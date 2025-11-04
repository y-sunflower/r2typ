#' @title Raw blocks for Quarto and Custom knit_print
#'
#' @description
#' Convert to raw Typst for Quarto.
#' Using this function is required to include the
#' output of `{r2typ}` in your document.
#'
#' Define output behavior when "knit printing" a `typst_markup`
#' object with `knitr` (mostly with Quarto).
#'
#' Learn more in the [Quarto usage vignette](../articles/using-r2typ-in-quarto-documents.html).
#'
#' @param x A character vector to interpret as raw typst or
#'   an object of class `typst_markup`
#' @param ... Ignored
#'
#' @returns For `as_quarto_typst()`, a raw version wrapped in the
#'   expected Quarto format. For `knit_print.typst_markup()`, output
#'   from `as_quarto_typst()`.
#'
#' @examples
#' heading(level = 2, numbering = "1.1", "Hello world") |> as_quarto_typst()
#'
#' typ_markup <- heading(level = 2, numbering = "1.1", "Hello world")
#' as_quarto_typst(typ_markup)
#'
#' @name quarto
NULL

#' @rdname quarto
#' @export
as_quarto_typst <- function(x) {
  knitr::raw_block(x, type = "typst")
}

#' @rdname quarto
#' @exportS3Method knitr::knit_print
knit_print.typst_markup <- function(x, ...) {
  as_quarto_typst(x)
}
