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


heading <- function(...) typst_call("heading", ...)
text <- function(...) typst_call("text", ...)

heading(level = 2, numbering = "1.1", "Hello world")
heading("Just text")
heading(level = 3, "Intro", "More text")

text(font = "Libertinus Serif", "Hello world")
text("Just text")
