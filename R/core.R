#' @title Typst function generator
#'
#' @description
#' Base function used to generate
#' higher level functions.
#'
#' @param name Function name like `heading()` or `text()`
#' @param ... Additional arguments pasted to typst functions.
#'
#' @keywords internal
typst_call <- function(name, ...) {
  args <- list(...)
  named <- names(args)
  if (is.null(named)) {
    named <- rep("", length(args))
  }

  named_args <- args[nzchar(named)]
  unnamed_args <- args[!nzchar(named)]

  format_named <- function(x) {
    if (is.character(x) && length(x) == 1) paste0("\"", x, "\"") else deparse(x)
  }

  format_unnamed <- function(x) {
    if (is.character(x) && length(x) == 1) x else deparse(x)
  }

  named_str <- if (length(named_args)) {
    paste(
      paste0(names(named_args), ": ", sapply(named_args, format_named)),
      collapse = ", "
    )
  } else {
    ""
  }

  unnamed_str <- paste(sapply(unnamed_args, format_unnamed), collapse = " ")

  if (named_str != "") {
    sprintf("#%s(%s)[%s]", name, named_str, unnamed_str)
  } else {
    sprintf("#%s[%s]", name, unnamed_str)
  }
}
