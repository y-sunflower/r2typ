#' @rdname typst_function
#' @export
text <- function(...) typst_function("text", ...)

#' @rdname typst_function
#' @export
linebreak <- function(...) typst_function("linebreak", ...)

#' @rdname typst_function
#' @export
#' @examples
#' highlight(extent = pt(3), "hey")
highlight <- function(...) typst_function("highlight", ...)

#' @rdname typst_function
#' @export
#' @examples
#' lower("hey")
lower <- function(...) typst_function("lower", ...)

#' @rdname typst_function
#' @export
overline <- function(...) typst_function("overline", ...)

#' @rdname typst_function
#' @export
smallcaps <- function(...) typst_function("smallcaps", ...)

#' @rdname typst_function
#' @export
smartquote <- function(...) typst_function("smartquote", ...)

#' @rdname typst_function
#' @export
strike <- function(...) typst_function("strike", ...)

#' @rdname typst_function
#' @export
sub_ <- function(...) typst_function("sub", ...)

#' @rdname typst_function
#' @export
super <- function(...) typst_function("super", ...)

#' @rdname typst_function
#' @export
underline <- function(...) typst_function("underline", ...)

#' @rdname typst_function
#' @export
upper <- function(...) typst_function("upper", ...)

#' @rdname typst_function
#' @export
#' @examples
#' raw_("print('hello world')", lang = "python", block = TRUE)
raw_ <- function(...) typst_function("raw", ...)
