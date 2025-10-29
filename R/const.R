#' @keywords internal
#'
#' @rdname const
#'
#' @title Functions with brackets.
#'
#' @description
#' Function where positional arguments are in brackets.
pos_bracket_functions <- c("list", "enum", "table")

#' @keywords internal
#'
#' @rdname const
#'
#' @title Functions with no brackets.
#'
#' @description
#' Function where additional arguments is not content.
#' For example, image() usage must be image(height: 2in, "file.svg").
no_bracket_functions <- c(
  pos_bracket_functions,
  "image",
  "linebreak",
  "bibliography",
  "figure",
  "document",
  "outline",
  "parbreak",
  "bytes",
  "decimal",
  "assert",
  "stack",
  "grid",
  "pagebreak",
  "move",
  "raw",
  "eval",
  "panic",
  "regex",
  "repr",
  "str",
  "rgb",
  "symbol",
  "type",
  "version",
  "cite",
  "h",
  "v",
  "line"
)
