#' @title Compile a Typst file or character vector
#'
#' @description
#' Call the Typst CLI compiler and compile a file (.typ)
#' or a character vector.
#'
#' @param file_or_chr Path to a file (must end with ".typ") or a character vector.
#' @param output Optional path for the output file (default NULL).
#'
#' @returns Output file path, invisibly.
#'
#' @note
#' It requires to have the Typst compiler installed.
#' See https://typst.app/open-source/
#'
#' @examples
#' \dontrun{
#' typst_compile("example.typ")
#'
#' typst_code <- c("= Hello World", "This is a Typst document.")
#' typst_compile(typst_code, output = "my_output.pdf")
#' }
#'
#' @export
typst_compile <- function(file_or_chr, output = NULL) {
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

  cmd <- sprintf(
    "typst compile %s%s",
    shQuote(target_file),
    if (!is.null(output)) paste(" ", shQuote(output)) else ""
  )

  status <- system(cmd)
  if (status != 0) {
    stop("Typst compilation failed")
  }

  invisible(if (!is.null(output)) output else target_file)
}
