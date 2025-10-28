#' @title Typst function
#'
#' @description
#' Generates Typst code with element. Named arguments are included
#' as Typst keyword arguments (e.g. `level`, `numbering`), and unnamed arguments
#' are used as the heading content.
#' But please note that this behavior might be different in some functions
#' to respect true Typst syntax (such as `#table()` for instance).
#'
#' @param ... Named or unnamed arguments passed to the Typst function.
#'   Named arguments become Typst parameters (e.g. `level = 2` → `level: 2`),
#'   while unnamed arguments form the body inside `[...]`.
#'
#' @return A character string containing the generated Typst code.
#'
#' @name typst_function
NULL
