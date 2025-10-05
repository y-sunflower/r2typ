#' Create a Typst Heading Element
#'
#' Generates Typst code for a `heading()` element. Named arguments are included
#' as Typst keyword arguments (e.g. `level`, `numbering`), and unnamed arguments
#' are used as the heading content.
#'
#' @param ... Named or unnamed arguments passed to the Typst `heading()` function.
#'   Named arguments become Typst parameters (e.g. `level = 2` → `level: 2`),
#'   while unnamed arguments form the body inside `[...]`.
#'
#' @return A character string containing the generated Typst code.
#'
#' @examples
#' heading(level = 2, numbering = "1.1", "Hello world")
#' heading("Just text")
#'
#' @export
heading <- function(...) typst_function("heading", ...)

#' Create a Typst Text Element
#'
#' Generates Typst code for a `text()` element. Named arguments are included
#' as Typst keyword arguments (e.g. `font`), and unnamed arguments are used
#' as the text content.
#'
#' @param ... Named or unnamed arguments passed to the Typst `text()` function.
#'   Named arguments become Typst parameters (e.g. `font = "Libertinus Serif"`
#'   → `font: "Libertinus Serif"`), while unnamed arguments form the body inside `[...]`.
#'
#' @return A character string containing the generated Typst code.
#'
#' @examples
#' text(font = "Libertinus Serif", "Hello world")
#' text("Just text")
#'
#' @export
text <- function(...) typst_function("text", ...)
