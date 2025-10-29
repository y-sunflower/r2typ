#' @rdname typst_function
#' @export
#' @examples
#' place(dx = pt(50), "pasta")
place <- function(...) typst_function("place", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_place(dx = pt(50))
set_place <- function(...) typst_set("place", ...)

#' @rdname typst_function
#' @export
#' @examples
#' align(center + horizon, "hey")
align <- function(...) typst_function("align", ...)

#' @rdname typst_set
#' @export
set_align <- function(...) typst_set("align", ...)

#' @rdname typst_function
#' @export
#' @examples
#' h(fr(3))
h <- function(...) typst_function("h", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_h(weak = TRUE)
set_h <- function(...) typst_set("h", ...)

#' @rdname typst_function
#' @export
#' @examples
#' v(percent(3), weak = TRUE)
v <- function(...) typst_function("v", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_v(weak = TRUE)
set_v <- function(...) typst_set("v", ...)

#' @rdname typst_function
#' @export
#' @examples
#' block(breakable = FALSE, width = percent(50), height = auto, fill = aqua, "cookies")
block <- function(...) typst_function("block", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_block(breakable = FALSE, width = percent(50), height = auto, fill = aqua)
set_block <- function(...) typst_set("block", ...)

#' @rdname typst_function
#' @export
#' @examples
#' box(clip = FALSE, width = percent(50), height = auto, fill = red, "ice cream")
box <- function(...) typst_function("box", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_box(clip = FALSE, width = percent(50), height = auto, fill = red)
set_box <- function(...) typst_set("box", ...)

#' @rdname typst_function
#' @export
#' @examples
#' colbreak(weak = TRUE)
colbreak <- function(...) typst_function("colbreak", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_colbreak(weak = TRUE)
set_colbreak <- function(...) typst_set("colbreak", ...)

#' @rdname typst_function
#' @export
#' @examples
#' stack(dir = ttb, "hey", "you", "!")
stack <- function(...) typst_function("stack", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_stack(dir = ttb)
set_stack <- function(...) typst_set("stack", ...)

#' @rdname typst_function
#' @export
#' @examples
#' grid(columns = 2, rows = 2, gutter = pt(3), "hey", "cookies", "ice", "cream")
grid <- function(...) typst_function("grid", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_grid(columns = 2, rows = 2, gutter = pt(3))
set_grid <- function(...) typst_set("grid", ...)

#' @rdname typst_function
#' @export
#' @examples
#' hide("this is hidden")
hide <- function(...) typst_function("hide", ...)

#' @rdname typst_set
#' @export
set_hide <- function(...) typst_set("hide", ...)

#' @rdname typst_function
#' @export
#' @examples
#' pagebreak("this is hidden")
pagebreak <- function(...) typst_function("pagebreak", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_pagebreak(weak = TRUE)
set_pagebreak <- function(...) typst_set("pagebreak", ...)

#' @rdname typst_function
#' @export
#' @examples
#' move(dx = pt(3), dy = pt(5), "pasta")
move <- function(...) typst_function("move", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_move(dx = pt(3), dy = pt(5))
set_move <- function(...) typst_set("move", ...)

#' @rdname typst_function
#' @export
#' @examples
#' pad(x = percent(0) + pt(5), y = percent(10) + pt(0), image("file.svg"))
pad <- function(...) typst_function("pad", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_pad(x = percent(0) + pt(5), y = percent(10) + pt(0))
set_pad <- function(...) typst_set("pad", ...)

#' @rdname typst_function
#' @export
#' @examples
#' page(
#'  flipped = TRUE,
#'  columns = 2,
#'  fill = red,
#'  place(
#'    top + left,
#'    dx = pt(-5),
#'    rect(fill = blue, radius = pt(2), "yooooo")
#'  )
#')
page <- function(...) typst_function("page", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_page(
#'  flipped = TRUE,
#'  columns = 2,
#'  fill = red
#')
set_page <- function(...) typst_set("page", ...)

#' @rdname typst_function
#' @export
#' @examples
#' scale_(x = percent(-100), "This is mirrored")
scale_ <- function(...) typst_function("scale", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_scale(x = percent(-100))
set_scale <- function(...) typst_set("scale", ...)

#' @rdname typst_function
#' @export
#' @examples
#' skew(ax = deg(-12), "This is some fake italic text.")
skew <- function(...) typst_function("skew", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_skew(ax = deg(-12))
set_skew <- function(...) typst_set("skew", ...)

#' @rdname typst_function
#' @export
#' @examples
#' rotate(deg(-12), "What a weird feature!")
rotate <- function(...) typst_function("rotate", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_rotate(deg(-12))
set_rotate <- function(...) typst_set("rotate", ...)
