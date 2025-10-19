#' @rdname typst_functions
#' @export
#' @examples
#' assert(1 < 2, message = "math broke")
assert <- function(...) typst_function("assert", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' bytes("more cookies...")
bytes <- function(...) typst_function("bytes", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' datetime(year = 2012, month = 8, day = 3)
datetime <- function(...) typst_function("datetime", ...)
