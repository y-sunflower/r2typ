#' Create a Typst set rules for Heading
#'
#' Generates Typst set rules for a `heading()` element. Named arguments are included
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
#' set_heading(level = 2, numbering = "1.1")
#'
#' @export
set_heading <- function(...) typst_set("heading", ...)

#' Create a Typst set rules for text
#'
#' Generates Typst set rules for a `text()` element. Named arguments are included
#' as Typst keyword arguments (e.g. `level`, `numbering`), and unnamed arguments
#' are used as the text content.
#'
#' @param ... Named or unnamed arguments passed to the Typst `text()` function.
#'   Named arguments become Typst parameters (e.g. `level = 2` → `level: 2`),
#'   while unnamed arguments form the body inside `[...]`.
#'
#' @return A character string containing the generated Typst code.
#'
#' @examples
#' set_text(font="Roboto", size="12pt")
#'
#' @export
set_text <- function(...) typst_set("text", ...)
