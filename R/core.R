#' @keywords internal
format_typst_value <- function(x, named) {
  if (inherits(x, "typst_unit")) {
    paste0(unclass(x), attr(x, "unit"))
  } else if (inherits(x, "list")) {
    nm <- names(x)
    if (!is.null(nm) && any(nzchar(nm))) {
      # named list -> Typst dictionary
      paste0(
        "(",
        paste0(
          nm,
          ": ",
          sapply(x, function(y) format_typst_value(y, named = TRUE)),
          collapse = ", "
        ),
        ")"
      )
    } else {
      # unnamed list -> Typst array
      paste0(
        "(",
        paste0(
          sapply(x, function(y) format_typst_value(y, named = FALSE)),
          collapse = ", "
        ),
        ")"
      )
    }
  } else if (inherits(x, "typst_expression")) {
    unclass(x)
  } else if (length(x) > 1) {
    # c() --> array
    paste0(
      "(",
      paste0(
        sapply(x, function(y) format_typst_value(y, named = FALSE)),
        collapse = ", "
      ),
      ")"
    )
  } else if (is.logical(x)) {
    # TRUE/FALSE --> true/false
    tolower(as.character(x))
  } else if (is.null(x) || (length(x) == 1 && is.na(x))) {
    # NULL/NA --> none
    "none"
  } else if (is.character(x) && length(x) == 1 && x == "auto") {
    # "auto" --> auto
    "auto"
  } else if (is.character(x) && length(x) == 1 && named) {
    # quoted arguments
    paste0("\"", x, "\"")
  } else if (is.character(x) && length(x) == 1 && !named) {
    x
  } else {
    deparse(x)
  }
}

#' @keywords internal
parse_typst_args <- function(name, ...) {
  args <- list(...)
  named <- names(args)
  if (is.null(named)) {
    named <- rep("", length(args))
  }

  named_args <- args[nzchar(named)]
  unnamed_args <- args[!nzchar(named)]

  # Separate typst_alignment from other unnamed args
  is_alignment <- sapply(unnamed_args, inherits, "typst_alignment")
  if (is.list(is_alignment) && length(is_alignment) == 0) {
    is_alignment <- FALSE
  }
  alignment_args <- unnamed_args[is_alignment]
  other_unnamed_args <- unnamed_args[!is_alignment]

  format_named <- function(x) format_typst_value(x, named = TRUE)
  format_unnamed <- function(x) format_typst_value(x, named = FALSE)

  # Format alignment as positional args (no commas between them)
  alignment_str <- if (length(alignment_args)) {
    paste(sapply(alignment_args, format_unnamed), collapse = " ")
  } else {
    ""
  }

  named_str <- if (length(named_args)) {
    paste(
      paste0(names(named_args), ": ", sapply(named_args, format_named)),
      collapse = ", "
    )
  } else {
    ""
  }

  unnamed_str <- paste(
    sapply(other_unnamed_args, format_unnamed),
    collapse = " "
  )

  list(
    name = name,
    named_str = named_str,
    unnamed_str = unnamed_str,
    alignment_str = alignment_str
  )
}

#' @keywords internal
typst_function <- function(name, ...) {
  parsed_args <- parse_typst_args(name, ...)

  # edgecases, everything goes inside ()
  no_bracket_functions <- c(
    "image",
    "linebreak",
    "bibliography",
    "list",
    "figure",
    "document",
    "outline",
    "table",
    "enum",
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

  kwargs_bracket_functions <- c("list", "enum", "table")

  if (name %in% no_bracket_functions) {
    if (name %in% kwargs_bracket_functions) {
      format_path <- function(x) {
        if (is.character(x) && length(x) == 1) paste0("[", x, "]") else x
      }
    } else {
      format_path <- function(x) {
        if (is.character(x) && length(x) == 1) paste0("\"", x, "\"") else x
      }
    }

    unnamed <- list(...)
    named <- names(unnamed)
    if (is.null(named)) {
      named <- rep("", length(unnamed))
    }
    unnamed_args <- unnamed[!nzchar(named)]
    unnamed_args <- unnamed_args[
      !sapply(unnamed_args, inherits, "typst_alignment")
    ]
    unnamed_values <- unnamed_args
    unnamed_str <- paste(
      sapply(unnamed_values, function(x) {
        if (length(x) > 1) {
          paste0("(", paste0(format_path(x), collapse = ", "), ")")
        } else {
          format_path(x)
        }
      }),
      collapse = ", "
    )

    parts <- c(parsed_args$alignment_str, parsed_args$named_str, unnamed_str)
    parts <- parts[parts != ""]

    sprintf("#%s(%s)", name, paste(parts, collapse = ", "))
  } else {
    # normal typst functions - alignments go as positional args
    positional_parts <- c(parsed_args$alignment_str, parsed_args$named_str)
    positional_parts <- positional_parts[positional_parts != ""]

    if (length(positional_parts) > 0) {
      if (parsed_args$unnamed_str == "" || parsed_args$unnamed_str == "none") {
        sprintf("#%s(%s)", name, paste(positional_parts, collapse = ", "))
      } else {
        sprintf(
          "#%s(%s)[%s]",
          name,
          paste(positional_parts, collapse = ", "),
          parsed_args$unnamed_str
        )
      }
    } else {
      if (parsed_args$unnamed_str == "" || parsed_args$unnamed_str == "none") {
        sprintf("#%s()", name)
      } else {
        sprintf("#%s[%s]", name, parsed_args$unnamed_str)
      }
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
