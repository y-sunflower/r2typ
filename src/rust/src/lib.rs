use extendr_api::prelude::*;
use std::path::Path;
use typst::layout::PagedDocument;
use typst_as_lib::TypstEngine;

fn compile_file_to_pdf(file: &str) -> std::result::Result<String, String> {
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
    let output_path = input_path.with_extension("pdf");

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

/// Compile a `.typ` file to a sibling `.pdf` file and return the output path.
/// @export
#[extendr]
fn typst_compile(file: &str) -> String {
    match compile_file_to_pdf(file) {
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
