#' @title Typst let keyword
#'
#' @description
#' `let` is the keyword used to define variables in Typst.
#' It allows to create reusable components.
#'
#' Note that it will call `assign(name, value, envir = parent.frame())`
#' so that `name` becomes an actual variable in your R environment.
#'
#' @param name Name of the variables.
#' @param value Value to assign to `name`.
#'
#' @return A character string
#'
#' @examples
#' let("yellow", rgb("#FFC300"))
#'
#' let("mycirc", circle(width=cm(3), fill=yellow, square(height=cm(1))))
#'
#' mycirc # this variable exists!
#'
#' @export
let <- function(name, value) {
  assign(name, value, envir = parent.frame())

  if (startsWith(value, "#")) {
    value <- substr(value, 2, nchar(value))
  }
  markup <- paste0("#let ", name, " = ", value)

  structure(markup, class = "typst_markup")
}
