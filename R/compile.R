#' @title Compile a Typst file or character vector
#'
#' @description
#' Call the Typst CLI compiler and compile a file (.typ)
#' or a character vector. Falls back to `quarto typst` if `typst` is unavailable.
#'
#' @param file_or_chr Path to a file (must end with ".typ") or a character vector.
#' @param output Optional path for the output file (default NULL).
#'
#' @returns Output file path, invisibly.
#'
#' @note
#' It requires to have the Typst compiler installed.
#' See [typst.app/open-source/](https://typst.app/open-source/).
#'
#' @export
typst_compile <- function(
  file_or_chr,
  output = NULL
) {
  if (
    is.character(file_or_chr) &&
      length(file_or_chr) == 1 &&
      file.exists(file_or_chr)
  ) {
    if (!grepl("\\.typ$", file_or_chr, ignore.case = TRUE)) {
      stop("File must have a .typ extension")
    }
    target_file <- file_or_chr
  } else if (is.character(file_or_chr)) {
    target_file <- tempfile(fileext = ".typ")
    writeLines(file_or_chr, target_file)
  } else {
    stop("Input must be either a .typ file path or a character vector")
  }

  args <- c("compile", target_file)
  if (!is.null(output)) {
    args <- c(args, output)
  }

  # Detect available CLI
  cli <- if (Sys.which("typst") != "") {
    "typst"
  } else if (Sys.which("quarto") != "") {
    c("quarto", "typst")
  } else {
    stop(
      "Neither 'typst' nor 'quarto typst' is available on your system. ",
      "You can install the Typst compiler here: https://typst.app/open-source/. ",
      "Make sure it's on your PATH too."
    )
  }

  if (length(cli) == 1) {
    res <- suppressWarnings(system2(cli, args, stdout = TRUE, stderr = TRUE))
    status <- attr(res, "status")
  } else {
    res <- suppressWarnings(system2(
      cli[1],
      c(cli[2], args),
      stdout = TRUE,
      stderr = TRUE
    ))
    status <- attr(res, "status")
  }

  if (!is.null(status) && status != 0) {
    stop("Typst compilation failed:\n\n", paste(res, collapse = "\n"))
  }

  invisible(if (!is.null(output)) output else target_file)
}
