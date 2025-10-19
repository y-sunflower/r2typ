#' @title Write a Typst file from a character vector or copy an existing one
#'
#' @description
#' Create or copy a Typst file (.typ) from either a character vector or an existing .typ file.
#'
#' @param file_or_chr Path to a file (must end with ".typ") or a character vector.
#' @param output Optional output file path (must end with ".typ"). If NULL, a temporary .typ file is created.
#'
#' @return The path to the written .typ file, invisibly.
#'
#' @examples
#' \dontrun{
#' typst_code <- c("= Hello World", "This is a Typst document.")
#' typst_write(typst_code, output = "hello.typ")
#' }
#'
#' @export
typst_write <- function(file_or_chr, output = NULL) {
  if (!is.null(output) && !grepl("\\.typ$", output, ignore.case = TRUE)) {
    stop("Output file must have a .typ extension")
  }

  if (
    is.character(file_or_chr) &&
      length(file_or_chr) == 1 &&
      file.exists(file_or_chr)
  ) {
    if (!grepl("\\.typ$", file_or_chr, ignore.case = TRUE)) {
      stop("Input file must have a .typ extension")
    }
    if (is.null(output)) {
      output <- tempfile(fileext = ".typ")
    }
    file.copy(file_or_chr, output, overwrite = TRUE)
  } else if (is.character(file_or_chr)) {
    if (is.null(output)) {
      output <- tempfile(fileext = ".typ")
    }
    writeLines(file_or_chr, output)
  } else {
    stop("Input must be either a .typ file path or a character vector")
  }

  invisible(output)
}
