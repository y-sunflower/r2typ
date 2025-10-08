#' @title Create Typst Unit Values
#'
#' @description
#' These functions generate special objects representing units in Typst code.
#' They can be used as arguments in functions like `text()` or `heading()` to
#' produce properly formatted Typst code.
#'
#' @param x Numeric value of the unit.
#'
#' @return An object of class `typst_unit` with an associated unit attribute.
#'   When passed to a Typst-generating function, it is converted to the
#'   appropriate unit string (e.g., `12pt`, `1.5em`, `80%`).
#'
#' @examples
#' pt(12)       # Represents 12pt
#' em(1.5)      # Represents 1.5em
#' percent(80)  # Represents 80%
#' fr(2)        # Represents 2fr
#'
#' text(size = pt(12), "Hello world")
#'
#' @name typst_units
NULL

#' @rdname typst_units
#' @export
pt <- function(x) structure(x, class = "typst_unit", unit = "pt")

#' @rdname typst_units
#' @export
em <- function(x) structure(x, class = "typst_unit", unit = "em")

#' @rdname typst_units
#' @export
percent <- function(x) structure(x, class = "typst_unit", unit = "%")

#' @rdname typst_units
#' @export
fr <- function(x) structure(x, class = "typst_unit", unit = "fr")

#' @rdname typst_units
#' @export
deg <- function(x) structure(x, class = "typst_unit", unit = "deg")
