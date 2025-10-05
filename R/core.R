#' @keywords internal
parse_typst_args <- function(name, ...) {
  args <- list(...)
  named <- names(args)
  if (is.null(named)) {
    named <- rep("", length(args))
  }

  named_args <- args[nzchar(named)]
  unnamed_args <- args[!nzchar(named)]

  format_typst_value <- function(x, named) {
    if (inherits(x, "typst_unit")) {
      paste0(x, attr(x, "unit"))
    } else if (is.logical(x)) {
      tolower(as.character(x))
    } else if (is.null(x) || (length(x) == 1 && is.na(x))) {
      "none"
    } else if (is.character(x) && length(x) == 1 && x == "auto") {
      "auto"
    } else if (is.character(x) && length(x) == 1 && named) {
      paste0("\"", x, "\"")
    } else if (is.character(x) && length(x) == 1 && !named) {
      x
    } else {
      deparse(x)
    }
  }

  format_named <- function(x) format_typst_value(x, named = TRUE)
  format_unnamed <- function(x) format_typst_value(x, named = FALSE)

  named_str <- if (length(named_args)) {
    paste(
      paste0(names(named_args), ": ", sapply(named_args, format_named)),
      collapse = ", "
    )
  } else {
    ""
  }

  unnamed_str <- paste(sapply(unnamed_args, format_unnamed), collapse = " ")

  output <- list(name = name, named_str = named_str, unnamed_str = unnamed_str)
  return(output)
}

#' @keywords internal
typst_function <- function(name, ...) {
  parsed_args <- parse_typst_args(name, ...)

  if (parsed_args$named_str != "") {
    sprintf(
      "#%s(%s)[%s]",
      parsed_args$name,
      parsed_args$named_str,
      parsed_args$unnamed_str
    )
  } else {
    sprintf("#%s[%s]", parsed_args$name, parsed_args$unnamed_str)
  }
}

#' @keywords internal
typst_set <- function(name, ...) {
  parsed_args <- parse_typst_args(name, ...)

  if (parsed_args$named_str != "" && parsed_args$unnamed_str != "") {
    sprintf(
      "#set %s(%s, %s)",
      parsed_args$name,
      parsed_args$named_str,
      parsed_args$unnamed_str
    )
  } else if (parsed_args$named_str != "") {
    sprintf("#set %s(%s)", parsed_args$name, parsed_args$named_str)
  } else if (parsed_args$unnamed_str != "") {
    sprintf("#set %s(%s)", parsed_args$name, parsed_args$unnamed_str)
  } else {
    sprintf("#set %s()", parsed_args$name)
  }
}
