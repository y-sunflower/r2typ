#' @rdname typst_functions
#' @export
text <- function(...) typst_function("text", ...)

#' @rdname typst_functions
#' @export
linebreak <- function(...) typst_function("linebreak", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' highlight(extent = pt(3), "hey")
highlight <- function(...) typst_function("highlight", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' lower("hey")
lower <- function(...) typst_function("lower", ...)

#' @rdname typst_functions
#' @export
overline <- function(...) typst_function("overline", ...)

#' @rdname typst_functions
#' @export
smallcaps <- function(...) typst_function("smallcaps", ...)

#' @rdname typst_functions
#' @export
smartquote <- function(...) typst_function("smartquote", ...)

#' @rdname typst_functions
#' @export
strike <- function(...) typst_function("strike", ...)

#' @rdname typst_functions
#' @export
sub_ <- function(...) typst_function("sub", ...)

#' @rdname typst_functions
#' @export
super <- function(...) typst_function("super", ...)

#' @rdname typst_functions
#' @export
underline <- function(...) typst_function("underline", ...)

#' @rdname typst_functions
#' @export
upper <- function(...) typst_function("upper", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' raw_("print('hello world')", lang = "python", block = TRUE)
raw_ <- function(...) typst_function("raw", ...)
