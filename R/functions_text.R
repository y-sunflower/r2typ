#' @rdname typst-function
#' @export
#' @examples
#' text(fill = silver, size = pt(20), "The most basic function in Typst...")
text <- function(...) typst_function("text", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_text(fill = silver, size = pt(20))
set_text <- function(...) typst_set("text", ...)

#' @rdname typst-show
#' @export
show_text <- function(set_rule) typst_show("text", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' linebreak(justify = TRUE)
linebreak <- function(...) typst_function("linebreak", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_linebreak(justify = TRUE)
set_linebreak <- function(...) typst_set("linebreak", ...)

#' @rdname typst-show
#' @export
show_linebreak <- function(set_rule) typst_show("linebreak", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' overline(evade = FALSE, "not sure who even uses this function")
overline <- function(...) typst_function("overline", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_overline(evade = FALSE)
set_overline <- function(...) typst_set("overline", ...)

#' @rdname typst-show
#' @export
show_overline <- function(set_rule) typst_show("overline", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' smallcaps(all = TRUE, "Niche but useful func")
smallcaps <- function(...) typst_function("smallcaps", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_smallcaps(all = TRUE)
set_smallcaps <- function(...) typst_set("smallcaps", ...)

#' @rdname typst-show
#' @export
show_smallcaps <- function(set_rule) typst_show("smallcaps", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' smartquote(double = FALSE)
smartquote <- function(...) typst_function("smartquote", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_smartquote(double = FALSE)
set_smartquote <- function(...) typst_set("smartquote", ...)

#' @rdname typst-show
#' @export
show_smartquote <- function(set_rule) typst_show("smartquote", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' strike(offset = em(2), "strike function is kind of cool tbh!")
strike <- function(...) typst_function("strike", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_strike(offset = em(2))
set_strike <- function(...) typst_set("strike", ...)

#' @rdname typst-show
#' @export
show_strike <- function(set_rule) typst_show("strike", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' sub_(typographic = FALSE, "not typographic")
sub_ <- function(...) typst_function("sub", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_sub(typographic = FALSE)
set_sub <- function(...) typst_set("sub", ...)

#' @rdname typst-show
#' @export
show_sub <- function(set_rule) typst_show("sub", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' super(typographic = FALSE, "not typographic")
super <- function(...) typst_function("super", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_super(typographic = FALSE)
set_super <- function(...) typst_set("super", ...)

#' @rdname typst-show
#' @export
show_super <- function(set_rule) typst_show("super", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' underline(stroke = pt(3) + olive, "what a weird underline")
underline <- function(...) typst_function("underline", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_underline(stroke = pt(3) + olive)
set_underline <- function(...) typst_set("underline", ...)

#' @rdname typst-show
#' @export
show_underline <- function(set_rule) typst_show("underline", set_rule)

#' @rdname typst-function
#' @export
upper <- function(...) typst_function("upper", ...)

#' @rdname typst-set
#' @export
set_upper <- function(...) typst_set("upper", ...)

#' @rdname typst-show
#' @export
show_upper <- function(set_rule) typst_show("upper", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' raw_("print('hello world')", lang = "python", block = TRUE)
raw_ <- function(...) typst_function("raw", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_raw(lang = "python", block = TRUE)
set_raw <- function(...) typst_set("raw", ...)

#' @rdname typst-show
#' @export
show_raw <- function(set_rule) typst_show("raw", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' highlight(extent = pt(3), "hey")
highlight <- function(...) typst_function("highlight", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_highlight(extent = pt(3))
set_highlight <- function(...) typst_set("highlight", ...)

#' @rdname typst-show
#' @export
show_highlight <- function(set_rule) typst_show("highlight", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' lower("hey")
lower <- function(...) typst_function("lower", ...)

#' @rdname typst-set
#' @export
set_lower <- function(...) typst_set("lower", ...)

#' @rdname typst-show
#' @export
show_lower <- function(set_rule) typst_show("lower", set_rule)
