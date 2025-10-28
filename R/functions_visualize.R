#' @rdname typst_functions
#' @export
#' @examples
#' \dontrun{image(width = percent(80), height = "auto", "../docs/link.svg")}
image <- function(...) typst_function("image", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' circle(fill = blue, "hey friend!")
circle <- function(...) typst_function("circle", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' ellipse(fill = green, "Is pasta overrated?")
ellipse <- function(...) typst_function("ellipse", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' line(length = percent(80), angle = deg(20))
line <- function(...) typst_function("line", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' rect(fill = aqua, radius = pt(3), "yooooooo")
rect <- function(...) typst_function("rect", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' square(size = pt(5), fill = olive)
square <- function(...) typst_function("square", ...)
