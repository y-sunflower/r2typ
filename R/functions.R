#' Create a Typst function
#'
#' Generates Typst code with element. Named arguments are included
#' as Typst keyword arguments (e.g. `level`, `numbering`), and unnamed arguments
#' are used as the heading content.
#'
#' @param ... Named or unnamed arguments passed to the Typst function.
#'   Named arguments become Typst parameters (e.g. `level = 2` → `level: 2`),
#'   while unnamed arguments form the body inside `[...]`.
#'
#' @return A character string containing the generated Typst code.
#'
#' @examples
#' heading(level = 2, numbering = "1.1", "Hello world")
#' text(font = "Libertinus Serif", "Hello world")
#' text("No arguments")
#'
#' @name typst_functions
NULL


#' @rdname typst_functions
#' @export
heading <- function(...) typst_function("heading", ...)

#' @rdname typst_functions
#' @export
text <- function(...) typst_function("text", ...)
