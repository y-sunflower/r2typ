#' @title Format into Typst format
#'
#' @description
#' Format `x` to its Typst equivalent. This function
#' is used internally to convert R data types to their
#' equivalent in Typst. It works recursively.
#'
#' @param x The object to convert.
#' @param named Whether `x` is named or not.
#'
#' @returns Formatted to Typst
#'
#' @examples
#' format_as_typst(c(1, 2, 3))
#' format_as_typst(list(1, 2, 3))
#' format_as_typst(list(a=1, b=2, c=3))
#' format_as_typst(pt(20))
#' format_as_typst(TRUE)
#' format_as_typst(FALSE)
#' format_as_typst(NULL)
#'
#' @export
format_as_typst <- function(x, named) {
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
          sapply(x, function(y) format_as_typst(y, named = TRUE)),
          collapse = ", "
        ),
        ")"
      )
    } else {
      # unnamed list -> Typst array
      paste0(
        "(",
        paste0(
          sapply(x, function(y) format_as_typst(y, named = FALSE)),
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
        sapply(x, function(y) format_as_typst(y, named = FALSE)),
        collapse = ", "
      ),
      ")"
    )
  } else if (is.logical(x)) {
    # TRUE/FALSE --> true/false
    tolower(as.character(x))
  } else if (is.null(x)) {
    # NULL --> none
    "none"
  } else if (is.character(x) && length(x) == 1 && named) {
    # quoted arguments
    paste0("\"", x, "\"")
  } else if (is.character(x) && length(x) == 1 && !named) {
    x
  } else {
    deparse(x)
  }
}

#' @title Parse `...` arguments
#'
#' @description
#' This functions parses user arguments
#' from `...`. The goal is to get which arguments
#' are named or not, convert to their Typst format
#' and return a list with parsed info.
#'
#' @param name Name of the function
#' @param ... Any kind of named or not arguments.
#'
#' @returns A list with function name, named args and unnamed args: `list(name = name, named_str = named_str, unnamed_str = unnamed_str, expression_str = expression_str)`.
#'
#' @export
parse_typst_args <- function(name, ...) {
  args <- list(...)
  named <- names(args)
  if (is.null(named)) {
    named <- rep("", length(args))
  }

  named_args <- args[nzchar(named)]
  unnamed_args <- args[!nzchar(named)]

  # Separate "typst_expression" (more or less) from other unnamed args
  is_expression <- sapply(
    unnamed_args,
    inherits,
    expression_like
  )
  if (is.list(is_expression) && length(is_expression) == 0) {
    is_expression <- FALSE
  }
  expression_args <- unnamed_args[is_expression]
  other_unnamed_args <- unnamed_args[!is_expression]

  format_named <- function(x) format_as_typst(x, named = TRUE)
  format_unnamed <- function(x) format_as_typst(x, named = FALSE)

  # Format expression as positional args (no commas between them)
  expression_str <- if (length(expression_args)) {
    paste(sapply(expression_args, format_unnamed), collapse = " ")
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
    expression_str = expression_str
  )
}

#' @title Create a Typst function
#'
#' @description
#' Used to create all Typst functions in `r2typ`.
#' Arguments are parsed and then translated to Typst.
#'
#' @param name Function name
#' @param ... Any kind of named or not arguments.
#'
#' @return A character vector with well formatted Typst.
#'
#' @keywords internal
typst_function <- function(name, ...) {
  parsed_args <- parse_typst_args(name, ...)

  if (name %in% no_bracket_functions) {
    if (name %in% pos_bracket_functions) {
      format_path <- function(x) {
        # typst_markup -> keep markup and put in square brackets
        if (inherits(x, "typst_markup") && length(x) == 1) {
          paste0("[", as.character(x), "]")
        } else if (is.character(x) && length(x) == 1) {
          paste0("[", x, "]")
        } else {
          x
        }
      }
    } else {
      format_path <- function(x) {
        # typst_markup -> keep markup (no extra quotes)
        if (inherits(x, "typst_markup") && length(x) == 1) {
          paste0("[", x, "]")
        } else if (is.character(x) && length(x) == 1) {
          paste0("\"", x, "\"")
        } else {
          x
        }
      }
    }

    unnamed <- list(...)
    named <- names(unnamed)
    if (is.null(named)) {
      named <- rep("", length(unnamed))
    }
    unnamed_args <- unnamed[!nzchar(named)]
    unnamed_args <- unnamed_args[
      !sapply(unnamed_args, inherits, expression_like)
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

    parts <- c(parsed_args$expression_str, parsed_args$named_str, unnamed_str)
    parts <- parts[parts != ""]

    markup <- sprintf("#%s(%s)", name, paste(parts, collapse = ", "))
  } else {
    # normal typst functions - expressions go as positional args
    positional_parts <- c(parsed_args$expression_str, parsed_args$named_str)
    positional_parts <- positional_parts[positional_parts != ""]

    if (length(positional_parts) > 0) {
      if (parsed_args$unnamed_str == "" || parsed_args$unnamed_str == "none") {
        markup <- sprintf(
          "#%s(%s)",
          name,
          paste(positional_parts, collapse = ", ")
        )
      } else {
        markup <- sprintf(
          "#%s(%s)[%s]",
          name,
          paste(positional_parts, collapse = ", "),
          parsed_args$unnamed_str
        )
      }
    } else {
      if (parsed_args$unnamed_str == "" || parsed_args$unnamed_str == "none") {
        markup <- sprintf("#%s()", name)
      } else {
        markup <- sprintf("#%s[%s]", name, parsed_args$unnamed_str)
      }
    }
  }

  structure(markup, class = "typst_markup")
}

#' @title Create a Typst set rule
#'
#' @description
#' Used to create all Typst rules in `r2typ`.
#' Arguments are parsed and then translated to Typst.
#'
#' @param name Function name
#' @param ... Any kind of named or not arguments.
#'
#' @return A character vector with well formatted Typst.
#'
#' @keywords internal
typst_set <- function(name, ...) {
  parsed_args <- parse_typst_args(name, ...)

  # combine expression args + unnamed args, ignoring empty/"none" placeholders
  pos_parts <- c(parsed_args$expression_str, parsed_args$unnamed_str)
  pos_parts <- pos_parts[!pos_parts %in% c("", "none")]

  named_part <- parsed_args$named_str
  if (named_part %in% c("", "none")) {
    named_part <- ""
  }

  if (length(pos_parts) > 0 && named_part != "") {
    markup <- sprintf(
      "#set %s(%s, %s)",
      name,
      named_part,
      paste(pos_parts, collapse = ", ")
    )
  } else if (named_part != "") {
    markup <- sprintf("#set %s(%s)", name, named_part)
  } else if (length(pos_parts) > 0) {
    markup <- sprintf("#set %s(%s)", name, paste(pos_parts, collapse = ", "))
  } else {
    markup <- sprintf("#set %s()", name)
  }

  structure(markup, class = "typst_markup")
}

#' @title Typst show rules
#'
#' @description
#' Generates Typst show rules for a given function.
#'
#' @param name Name of the function for the show rule.
#' @param set_rule A set rule made with one of the set functions in `{r2typ}`.
#'
#' @return A character string containing the generated Typst code.
#'
#' @keywords internal
typst_show <- function(name, set_rule) {
  if (!startsWith(set_rule, "#set ")) {
    stop(
      "`set_rule` argument is invalid: '",
      set_rule,
      "'. It should starts with '#set '."
    )
  }

  show_rule <- paste0(
    "#show ",
    name,
    ": ",
    substr(set_rule, start = 2, stop = nchar(set_rule))
  )

  structure(show_rule, class = "typst_markup")
}
