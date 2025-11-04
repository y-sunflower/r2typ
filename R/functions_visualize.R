#' @rdname typst-function
#' @export
#' @examples
#' \dontrun{image(width = percent(80), height = auto, "../docs/link.svg")}
image <- function(...) typst_function("image", ...)

#' @rdname typst-set
#' @export
#' @examples
#' image(width = percent(80), height = auto)
set_image <- function(...) typst_set("image", ...)

#' @rdname typst-show
#' @export
show_image <- function(set_rule) typst_show("image", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' circle(fill = blue)
circle <- function(...) typst_function("circle", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_circle(fill = blue)
set_circle <- function(...) typst_set("circle", ...)

#' @rdname typst-show
#' @export
show_circle <- function(set_rule) typst_show("circle", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' ellipse(fill = green)
ellipse <- function(...) typst_function("ellipse", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_ellipse(fill = green)
set_ellipse <- function(...) typst_set("ellipse", ...)

#' @rdname typst-show
#' @export
show_ellipse <- function(set_rule) typst_show("ellipse", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' line(length = percent(80), angle = deg(20))
line <- function(...) typst_function("line", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_line(length = percent(80), angle = deg(20))
set_line <- function(...) typst_set("line", ...)

#' @rdname typst-show
#' @export
show_line <- function(set_rule) typst_show("line", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' rect(fill = aqua, radius = pt(3))
rect <- function(...) typst_function("rect", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_rect(fill = aqua, radius = pt(3))
set_rect <- function(...) typst_set("rect", ...)

#' @rdname typst-show
#' @export
show_rect <- function(set_rule) typst_show("rect", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' square(size = pt(5), fill = olive)
square <- function(...) typst_function("square", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_square(size = pt(5), fill = olive)
set_square <- function(...) typst_set("square", ...)

#' @rdname typst-show
#' @export
show_square <- function(set_rule) typst_show("square", set_rule)
