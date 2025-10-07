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

#' @rdname typst_functions
#' @export
place <- function(...) typst_function("place", ...)

#' @rdname typst_functions
#' @export
image <- function(...) typst_function("image", ...)

#' @rdname typst_functions
#' @export
linebreak <- function(...) typst_function("linebreak", ...)

#' @rdname typst_functions
#' @export
highlight <- function(...) typst_function("highlight", ...)

#' @rdname typst_functions
#' @export
lower <- function(...) typst_function("lower", ...)

#' @rdname typst_functions
#' @export
overline <- function(...) typst_function("overline", ...)

#' @rdname typst_functions
#' @export
smallcaps <- function(...) typst_function("smallcaps", ...)

#' @rdname typst_functions
#' @export
smartquote <- function(...) typst_function("smartquote", ...)

#' @rdname typst_functions
#' @export
strike <- function(...) typst_function("strike", ...)

#' @rdname typst_functions
#' @export
sub <- function(...) typst_function("sub", ...)

#' @rdname typst_functions
#' @export
super <- function(...) typst_function("super", ...)

#' @rdname typst_functions
#' @export
underline <- function(...) typst_function("underline", ...)

#' @rdname typst_functions
#' @export
upper <- function(...) typst_function("upper", ...)
