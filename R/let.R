#' @title Typst let keyword
#'
#' @description
#' `let` is the keyword used to define variables in Typst.
#' It allows to create reusable components.
#'
#' @param name Name of the variables.
#' @param value Value to assign to `name`.
#'
#' @return A character string
#'
#' @examples
#' let("yellow", rgb_("#FFC300"))
#'
#' let("mycirc", circle(width=cm_(3), fill=yellow, square(height=cm_(1))))
#'
#' @export
let <- function(name, value) {
  if (startsWith(value, "#")) {
    value <- substr(value, 2, nchar(value))
  }
  markup <- paste0("#let ", name, " = ", value)

  structure(markup, class = "typst_markup")
}
