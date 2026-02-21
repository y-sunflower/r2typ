use extendr_api::prelude::*;
use std::path::{Path, PathBuf};
use typst::layout::PagedDocument;
use typst_as_lib::TypstEngine;

fn compile_file_to_pdf(file: &str, output: Option<&str>) -> std::result::Result<String, String> {
    let input_path = Path::new(file);
    if !input_path.is_file() {
        return Err(format!(
            "Input file does not exist: {}",
            input_path.display()
        ));
    }

    match input_path.extension().and_then(|ext| ext.to_str()) {
        Some(ext) if ext.eq_ignore_ascii_case("typ") => {}
        _ => return Err(format!("Input file must have a .typ extension: {}", file)),
    }

    let root = input_path.parent().unwrap_or_else(|| Path::new("."));
    let main_file = input_path
        .file_name()
        .and_then(|name| name.to_str())
        .ok_or_else(|| format!("Invalid UTF-8 file name: {}", file))?;
    let output_path = match output {
        Some(path) if path.trim().is_empty() => {
            return Err("`output` must not be an empty path".to_owned());
        }
        Some(path) => PathBuf::from(path),
        None => input_path.with_extension("pdf"),
    };

    let engine = TypstEngine::builder()
        .with_file_system_resolver(root)
        .fonts(typst_assets::fonts())
        .build();

    let doc: PagedDocument = engine
        .compile(main_file)
        .output
        .map_err(|err| format!("Typst compilation failed: {err}"))?;

    let pdf = typst_pdf::pdf(&doc, &Default::default())
        .map_err(|err| format!("PDF export failed: {err:?}"))?;

    std::fs::write(&output_path, pdf)
        .map_err(|err| format!("Could not write PDF to {}: {err}", output_path.display()))?;

    Ok(output_path.to_string_lossy().into_owned())
}

/// Compile a `.typ` file to a `.pdf` file and return the output path.
/// @param file Path to an existing `.typ` file.
/// @param output Optional output path. Defaults to the input path with `.pdf`.
/// @export
#[extendr]
fn typst_compile(file: &str, #[default = "NULL"] output: Nullable<String>) -> String {
    let output = output.into_option();
    match compile_file_to_pdf(file, output.as_deref()) {
        Ok(output_path) => output_path,
        Err(message) => throw_r_error(message),
    }
}

// Macro to generate exports.
// This ensures exported functions are registered with R.
// See corresponding C code in `entrypoint.c`.
extendr_module! {
    mod r2typ;
    fn typst_compile;
}

#[cfg(test)]
mod tests {
    use super::compile_file_to_pdf;
    use std::fs;
    use std::path::{Path, PathBuf};
    use std::time::{SystemTime, UNIX_EPOCH};

    fn unique_temp_dir() -> PathBuf {
        let nanos = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .expect("system clock should be after unix epoch")
            .as_nanos();
        let dir =
            std::env::temp_dir().join(format!("r2typ-tests-{}-{}", std::process::id(), nanos));
        fs::create_dir_all(&dir).expect("could not create temp directory");
        dir
    }

    fn write_typ_file(path: &Path, content: &str) {
        fs::write(path, content).expect("could not write typst source file");
    }

    #[test]
    fn compile_uses_default_pdf_path_when_output_is_none() {
        let dir = unique_temp_dir();
        let typ_path = dir.join("default.typ");
        let expected_pdf = dir.join("default.pdf");
        write_typ_file(&typ_path, "= Hello from test");

        let output =
            compile_file_to_pdf(typ_path.to_str().expect("path should be valid UTF-8"), None)
                .expect("compilation should succeed");

        let output_path = PathBuf::from(output);
        assert_eq!(output_path, expected_pdf);
        assert!(
            expected_pdf.exists(),
            "expected default output PDF to exist"
        );

        let bytes = fs::read(&expected_pdf).expect("could not read generated PDF");
        assert!(bytes.starts_with(b"%PDF"), "generated file is not a PDF");

        fs::remove_dir_all(dir).expect("could not remove temp directory");
    }

    #[test]
    fn compile_writes_pdf_to_custom_output_path() {
        let dir = unique_temp_dir();
        let typ_path = dir.join("source.typ");
        let custom_pdf = dir.join("custom-output.pdf");
        write_typ_file(&typ_path, "= Hello custom output");

        let output = compile_file_to_pdf(
            typ_path.to_str().expect("path should be valid UTF-8"),
            Some(custom_pdf.to_str().expect("path should be valid UTF-8")),
        )
        .expect("compilation should succeed");

        let output_path = PathBuf::from(output);
        assert_eq!(output_path, custom_pdf);
        assert!(custom_pdf.exists(), "expected custom output PDF to exist");
        assert!(
            !dir.join("source.pdf").exists(),
            "default output path should not be used when custom output is provided"
        );

        let bytes = fs::read(&custom_pdf).expect("could not read generated PDF");
        assert!(bytes.starts_with(b"%PDF"), "generated file is not a PDF");

        fs::remove_dir_all(dir).expect("could not remove temp directory");
    }

    #[test]
    fn compile_fails_for_missing_input_file() {
        let dir = unique_temp_dir();
        let missing = dir.join("missing.typ");

        let err = compile_file_to_pdf(missing.to_str().expect("path should be valid UTF-8"), None)
            .expect_err("missing file should return an error");

        assert!(err.contains("Input file does not exist"));
        fs::remove_dir_all(dir).expect("could not remove temp directory");
    }

    #[test]
    fn compile_fails_for_non_typ_extension() {
        let dir = unique_temp_dir();
        let txt_path = dir.join("source.txt");
        write_typ_file(&txt_path, "= wrong extension");

        let err = compile_file_to_pdf(txt_path.to_str().expect("path should be valid UTF-8"), None)
            .expect_err("non-.typ input should return an error");

        assert!(err.contains("must have a .typ extension"));
        fs::remove_dir_all(dir).expect("could not remove temp directory");
    }

    #[test]
    fn compile_fails_for_empty_output_path() {
        let dir = unique_temp_dir();
        let typ_path = dir.join("source.typ");
        write_typ_file(&typ_path, "= Empty output path");

        let err = compile_file_to_pdf(
            typ_path.to_str().expect("path should be valid UTF-8"),
            Some(""),
        )
        .expect_err("empty output path should return an error");

        assert!(err.contains("`output` must not be an empty path"));
        fs::remove_dir_all(dir).expect("could not remove temp directory");
    }
}
