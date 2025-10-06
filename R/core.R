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
      paste0(unclass(x), attr(x, "unit"))
    } else if (inherits(x, "typst_alignment")) {
      unclass(x)
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

  list(name = name, named_str = named_str, unnamed_str = unnamed_str)
}

#' @keywords internal
typst_function <- function(name, ...) {
  parsed_args <- parse_typst_args(name, ...)

  # For #image, everything goes inside ()
  if (name == "image") {
    # unnamed strings should be quoted for image paths
    format_path <- function(x) {
      if (is.character(x) && length(x) == 1) paste0("\"", x, "\"") else x
    }

    unnamed <- list(...)
    named <- names(unnamed)
    if (is.null(named)) {
      named <- rep("", length(unnamed))
    }
    unnamed_args <- unnamed[!nzchar(named)]
    unnamed_values <- unnamed_args

    # recompute unnamed_str for image
    unnamed_str <- paste(sapply(unnamed_values, format_path), collapse = ", ")
    both <- c(parsed_args$named_str, unnamed_str)
    both <- both[both != ""]

    sprintf("#%s(%s)", name, paste(both, collapse = ", "))
  } else {
    # normal typst functions
    if (parsed_args$named_str != "") {
      sprintf(
        "#%s(%s)[%s]",
        name,
        parsed_args$named_str,
        parsed_args$unnamed_str
      )
    } else {
      sprintf("#%s[%s]", name, parsed_args$unnamed_str)
    }
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
