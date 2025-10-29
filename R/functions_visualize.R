#' @rdname typst_function
#' @export
#' @examples
#' \dontrun{image(width = percent(80), height = auto, "../docs/link.svg")}
image <- function(...) typst_function("image", ...)

#' @rdname typst_set
#' @export
#' @examples
#' image(width = percent(80), height = auto)
set_image <- function(...) typst_set("image", ...)

#' @rdname typst_function
#' @export
#' @examples
#' circle(fill = blue)
circle <- function(...) typst_function("circle", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_circle(fill = blue)
set_circle <- function(...) typst_set("circle", ...)

#' @rdname typst_function
#' @export
#' @examples
#' ellipse(fill = green)
ellipse <- function(...) typst_function("ellipse", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_ellipse(fill = green)
set_ellipse <- function(...) typst_set("ellipse", ...)

#' @rdname typst_function
#' @export
#' @examples
#' line(length = percent(80), angle = deg(20))
line <- function(...) typst_function("line", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_line(length = percent(80), angle = deg(20))
set_line <- function(...) typst_set("line", ...)

#' @rdname typst_function
#' @export
#' @examples
#' rect(fill = aqua, radius = pt(3))
rect <- function(...) typst_function("rect", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_rect(fill = aqua, radius = pt(3))
set_rect <- function(...) typst_set("rect", ...)

#' @rdname typst_function
#' @export
#' @examples
#' square(size = pt(5), fill = olive)
square <- function(...) typst_function("square", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_square(size = pt(5), fill = olive)
set_square <- function(...) typst_set("square", ...)
