#' @rdname typst_functions
#' @export
#' @examples
#' place(dx = pt(50), "pasta")
place <- function(...) typst_function("place", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' align(center + horizon, "hey")
align <- function(...) typst_function("align", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' h(fr(3))
h <- function(...) typst_function("h", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' v(percent(3), weak = TRUE)
v <- function(...) typst_function("v", ...)
