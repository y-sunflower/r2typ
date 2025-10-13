#' @title Raw blocks for Rmarkdown/Quarto
#'
#' @description
#' Convert to raw Typst for Rmarkdown and Quarto.
#' Using this function is required to include the
#' output of `{rtyp}` in your document.
#'
#' This is a simple wrapper around [`knitr::raw_block()`].
#'
#' @param x A character vector to interpret as raw typst.
#'
#' @returns A raw version, wrapped in the expected format
#' for Rmarkdown and Quarto document.
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
