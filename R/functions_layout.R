#' @rdname typst-function
#' @export
#' @examples
#' place(dx = pt(50), "pasta")
place <- function(...) typst_function("place", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_place(dx = pt(50))
set_place <- function(...) typst_set("place", ...)

#' @rdname typst-show
#' @export
show_place <- function(set_rule) typst_show("place", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' align(center + horizon, "hey")
align <- function(...) typst_function("align", ...)

#' @rdname typst-set
#' @export
set_align <- function(...) typst_set("align", ...)

#' @rdname typst-show
#' @export
show_align <- function(set_rule) typst_show("align", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' h(fr(3))
h <- function(...) typst_function("h", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_h(weak = TRUE)
set_h <- function(...) typst_set("h", ...)

#' @rdname typst-show
#' @export
show_h <- function(set_rule) typst_show("h", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' v(percent(3), weak = TRUE)
v <- function(...) typst_function("v", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_v(weak = TRUE)
set_v <- function(...) typst_set("v", ...)

#' @rdname typst-show
#' @export
show_v <- function(set_rule) typst_show("v", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' block(breakable = FALSE, width = percent(50), height = auto, fill = aqua, "cookies")
block <- function(...) typst_function("block", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_block(breakable = FALSE, width = percent(50), height = auto, fill = aqua)
set_block <- function(...) typst_set("block", ...)

#' @rdname typst-show
#' @export
show_block <- function(set_rule) typst_show("block", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' box(clip = FALSE, width = percent(50), height = auto, fill = red, "ice cream")
box <- function(...) typst_function("box", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_box(clip = FALSE, width = percent(50), height = auto, fill = red)
set_box <- function(...) typst_set("box", ...)

#' @rdname typst-show
#' @export
show_box <- function(set_rule) typst_show("box", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' colbreak(weak = TRUE)
colbreak <- function(...) typst_function("colbreak", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_colbreak(weak = TRUE)
set_colbreak <- function(...) typst_set("colbreak", ...)

#' @rdname typst-show
#' @export
show_colbreak <- function(set_rule) typst_show("colbreak", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' stack(dir = ttb, "hey", "you", "!")
stack <- function(...) typst_function("stack", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_stack(dir = ttb)
set_stack <- function(...) typst_set("stack", ...)

#' @rdname typst-show
#' @export
show_stack <- function(set_rule) typst_show("stack", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' grid(columns = 2, rows = 2, gutter = pt(3), "hey", "cookies", "ice", "cream")
grid <- function(...) typst_function("grid", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_grid(columns = 2, rows = 2, gutter = pt(3))
set_grid <- function(...) typst_set("grid", ...)

#' @rdname typst-show
#' @export
show_grid <- function(set_rule) typst_show("grid", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' hide("this is hidden")
hide <- function(...) typst_function("hide", ...)

#' @rdname typst-set
#' @export
set_hide <- function(...) typst_set("hide", ...)

#' @rdname typst-show
#' @export
show_hide <- function(set_rule) typst_show("hide", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' pagebreak("this is hidden")
pagebreak <- function(...) typst_function("pagebreak", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_pagebreak(weak = TRUE)
set_pagebreak <- function(...) typst_set("pagebreak", ...)

#' @rdname typst-show
#' @export
show_pagebreak <- function(set_rule) typst_show("pagebreak", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' move(dx = pt(3), dy = pt(5), "pasta")
move <- function(...) typst_function("move", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_move(dx = pt(3), dy = pt(5))
set_move <- function(...) typst_set("move", ...)

#' @rdname typst-show
#' @export
show_move <- function(set_rule) typst_show("move", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' pad(x = percent(0) + pt(5), y = percent(10) + pt(0), image("file.svg"))
pad <- function(...) typst_function("pad", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_pad(x = percent(0) + pt(5), y = percent(10) + pt(0))
set_pad <- function(...) typst_set("pad", ...)

#' @rdname typst-show
#' @export
show_pad <- function(set_rule) typst_show("pad", set_rule)

#' @rdname typst-function
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

#' @rdname typst-set
#' @export
#' @examples
#' set_page(
#'  flipped = TRUE,
#'  columns = 2,
#'  fill = red
#')
set_page <- function(...) typst_set("page", ...)

#' @rdname typst-show
#' @export
show_page <- function(set_rule) typst_show("page", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' scale_(x = percent(-100), "This is mirrored")
scale_ <- function(...) typst_function("scale", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_scale(x = percent(-100))
set_scale <- function(...) typst_set("scale", ...)

#' @rdname typst-show
#' @export
show_scale <- function(set_rule) typst_show("scale", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' skew(ax = deg(-12), "This is some fake italic text.")
skew <- function(...) typst_function("skew", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_skew(ax = deg(-12))
set_skew <- function(...) typst_set("skew", ...)

#' @rdname typst-show
#' @export
show_skew <- function(set_rule) typst_show("skew", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' rotate(deg(-12), "What a weird feature!")
rotate <- function(...) typst_function("rotate", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_rotate(deg(-12))
set_rotate <- function(...) typst_set("rotate", ...)

#' @rdname typst-show
#' @export
show_rotate <- function(set_rule) typst_show("rotate", set_rule)
