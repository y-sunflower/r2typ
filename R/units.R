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
pt <- function(x) {
  structure(x, class = c("typst_unit", "typst_expression"), unit = "pt")
}

#' @rdname typst_units
#' @export
em <- function(x) {
  structure(x, class = c("typst_unit", "typst_expression"), unit = "em")
}

#' @rdname typst_units
#' @export
percent <- function(x) {
  structure(x, class = c("typst_unit", "typst_expression"), unit = "%")
}

#' @rdname typst_units
#' @export
fr <- function(x) {
  structure(x, class = c("typst_unit", "typst_expression"), unit = "fr")
}

#' @rdname typst_units
#' @export
deg <- function(x) {
  structure(x, class = c("typst_unit", "typst_expression"), unit = "deg")
}

#' @export
`+.typst_expression` <- function(left_expression, right_expression) {
  if (inherits(left_expression, "typst_unit")) {
    left_expression <- paste0(
      unclass(left_expression),
      attr(left_expression, "unit")
    )
  }

  if (inherits(right_expression, "typst_unit")) {
    right_expression <- paste0(
      unclass(right_expression),
      attr(right_expression, "unit")
    )
  }

  result <- paste(
    as.character(left_expression),
    as.character(right_expression),
    sep = " + "
  )
  structure(result, class = "typst_expression")
}
