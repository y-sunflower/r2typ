#' @rdname typst-function
#' @export
#' @examples
#' assert(1 < 2, message = "math broke")
assert <- function(...) typst_function("assert", ...)

#' @rdname typst-function
#' @export
#' @examples
#' bytes("more cookies...")
bytes <- function(...) typst_function("bytes", ...)

#' @rdname typst-function
#' @export
#' @examples
#' datetime(year = 2012, month = 8, day = 3)
datetime <- function(...) typst_function("datetime", ...)

#' @rdname typst-function
#' @export
#' @examples
#' duration(days = 3, hours = 12)
duration <- function(...) typst_function("duration", ...)

#' @rdname typst-function
#' @export
#' @examples
#' eval_("*Markup!*", mode = "markup")
eval_ <- function(...) typst_function("eval", ...)

#' @rdname typst-function
#' @export
#' @examples
#' panic("this is wrong")
panic <- function(...) typst_function("panic", ...)

#' @rdname typst-function
#' @export
#' @examples
#' regex("\\d+")
regex <- function(...) typst_function("regex", ...)

#' @rdname typst-function
#' @export
#' @examples
#' repr("hello")
repr <- function(...) typst_function("repr", ...)

#' @rdname typst-function
#' @export
#' @examples
#' str_("hello")
str_ <- function(...) typst_function("str", ...)

#' @rdname typst-function
#' @export
#' @examples
#' symbol("10")
symbol <- function(...) typst_function("symbol", ...)

#' @rdname typst-function
#' @export
#' @examples
#' decimal("10")
decimal <- function(...) typst_function("decimal", ...)

#' @rdname typst-function
#' @export
#' @examples
#' type("10")
type <- function(...) typst_function("type", ...)

#' @rdname typst-function
#' @export
#' @examples
#' version(1, 2, 3, 4)
#' version(c(1, 2, 3, 4))
version <- function(...) typst_function("version", ...)
