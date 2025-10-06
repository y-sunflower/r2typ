#' Create a Typst set rules
#'
#' Generates Typst set rules for a given function. Named arguments are included
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
#' set_heading(level = 2, numbering = "1.1")
#' set_text(font="Roboto", size="12pt")
#'
#' @name typst_set
NULL

#' @rdname typst_set
#' @export
set_heading <- function(...) typst_set("heading", ...)

#' @rdname typst_set
#' @export
set_text <- function(...) typst_set("text", ...)
