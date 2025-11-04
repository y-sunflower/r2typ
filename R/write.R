#' @title Write a Typst file from a character vector
#'
#' @description
#' Create a Typst file (.typ) from a character vector.
#'
#' @param x A character vector representing Typst code.
#' @param output Optional output file path (must end with ".typ"). If NULL, a temporary file is created.
#'
#' @return The path to the written .typ file, invisibly.
#'
#' @examples
#' \dontrun{
#' code <- c("= Hello World", "This is a Typst document.")
#' typst_write(code, output = "hello.typ")
#' }
#'
#' @export
typst_write <- function(x, output = NULL) {
  if (!is.null(output) && !grepl("\\.typ$", output, ignore.case = TRUE)) {
    stop("`output` must have a .typ extension")
  }

  if (is.null(output)) {
    output <- tempfile(fileext = ".typ")
  }

  writeLines(x, output)
  invisible(output)
}
