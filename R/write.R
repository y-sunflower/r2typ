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
  if (!requireNamespace("tynding", quietly = TRUE)) {
    stop(
      "`typst_write()` requires the optional `tynding` package.",
      call. = FALSE
    )
  }

  tynding::typst_write(x, output = output)
}

#' @title Compile a `.typ` file to a `.pdf` file and return the output path
#'
#' @description
#' Compile a `.typ` file to a `.pdf` file and return the output path.
#'
#' @param file Path to an existing `.typ` file.
#' @param output Optional output path. Defaults to the input path with `.pdf`.
#'
#' @return The path to the compiled PDF file.
#'
#' @export
typst_compile <- function(file, output = NULL) {
  if (!requireNamespace("tynding", quietly = TRUE)) {
    stop(
      "`typst_compile()` requires the optional `tynding` package.",
      call. = FALSE
    )
  }

  tynding::typst_compile(file, output = output)
}
