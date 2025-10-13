#' @title Is valid Typst?
#'
#' @description
#' Check that a character vector is valid Typst markup
#' by compiling it. If no error, it assumes the code
#' is valid.
#'
#' @param x A character vector
#' @param error_on_failure Whether to raise an error if
#' the code is invalid. Default to `FALSE`.
#'
#' @returns Whether or not pdf output file exist.
#'
#' @note
#' It requires to have the Typst compiler installed.
#' See https://typst.app/open-source/
#'
#' @examples
#' \dontrun{
#' typst_code <- c("= Hello World", "This is a Typst document.")
#' is_valid_typst(typst_code)
#'
#' typst_code <- c("= Hello World", "#This is a Typst document.")
#' is_valid_typst(typst_code)
#'
#' typst_code <- c("= Hello World", "#This is a Typst document.")
#' is_valid_typst(typst_code, error_on_failure = TRUE)
#' }
#'
#' @export
is_valid_typst <- function(x, error_on_failure = FALSE) {
  typ_file <- typst_write(x)
  result <- tryCatch(
    typst_compile(typ_file),
    error = function(e) {
      if (error_on_failure) {
        stop(e$message, call. = FALSE)
      }
      return(NULL)
    }
  )

  !is.null(result) && file.exists(result)
}
