#' @title Raw blocks for Quarto
#'
#' @description
#' Convert to raw Typst for Quarto.
#' Using this function is required to include the
#' output of `{r2typ}` in your document.
#'
#' @param x A character vector to interpret as raw typst.
#'
#' @returns A raw version, wrapped in the expected format
#' for Quarto document.
#'
#' @note
#' `{r2typ}` does not have any dependency, but this function tries
#' to reproduce the behavior `knitr::raw_block()` for Typst outputs.
#'
#' @examples
#' heading(level = 2, numbering = "1.1", "Hello world") |> as_raw_typ()
#'
#' typ_markup <- heading(level = 2, numbering = "1.1", "Hello world")
#' as_raw_typ(typ_markup)
#' @export
as_raw_typ <- function(x) {
  res <- paste0("\n```{=typst}\n", paste0(x, collapse = "\n"), "\n```\n")
  structure(res, class = "knit_asis", knit_cacheable = NA)
}
