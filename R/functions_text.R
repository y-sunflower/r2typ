#' @rdname typst_function
#' @export
#' @examples
#' text(fill: silver, size: pt(20), "The most basic function in Typst...")
text <- function(...) typst_function("text", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_text(fill: silver, size: pt(20))
set_text <- function(...) typst_set("text", ...)

#' @rdname typst_function
#' @export
#' @examples
#' linebreak(justify = TRUE)
linebreak <- function(...) typst_function("linebreak", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_linebreak(justify = TRUE)
set_linebreak <- function(...) typst_set("linebreak", ...)

#' @rdname typst_function
#' @export
#' @examples
#' overline(evade = FALSE, "not sure who even uses this function")
overline <- function(...) typst_function("overline", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_overline(evade = FALSE)
set_overline <- function(...) typst_set("overline", ...)

#' @rdname typst_function
#' @export
#' @examples
#' smallcaps(all = TRUE, "Niche but useful func")
smallcaps <- function(...) typst_function("smallcaps", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_smallcaps(all = TRUE)
set_smallcaps <- function(...) typst_set("smallcaps", ...)

#' @rdname typst_function
#' @export
#' @examples
#' smartquote(double = FALSE)
smartquote <- function(...) typst_function("smartquote", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_smartquote(double = FALSE)
set_smartquote <- function(...) typst_set("smartquote", ...)

#' @rdname typst_function
#' @export
#' @examples
#' strike(offset = em(2), "strike function is kind of cool tbh!")
strike <- function(...) typst_function("strike", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_strike(offset = em(2))
set_strike <- function(...) typst_set("strike", ...)

#' @rdname typst_function
#' @export
#' @examples
#' sub_(typographic = FALSE, "not typographic")
sub_ <- function(...) typst_function("sub", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_sub(typographic = FALSE)
set_sub <- function(...) typst_set("sub", ...)

#' @rdname typst_function
#' @export
#' @examples
#' super(typographic = FALSE, "not typographic")
super <- function(...) typst_function("super", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_super(typographic = FALSE)
set_super <- function(...) typst_set("super", ...)

#' @rdname typst_function
#' @export
#' @examples
#' underline(stroke = pt(3) + olive, "what a weird underline")
underline <- function(...) typst_function("underline", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_underline(stroke = pt(3) + olive)
set_underline <- function(...) typst_set("underline", ...)

#' @rdname typst_function
#' @export
upper <- function(...) typst_function("upper", ...)

#' @rdname typst_set
#' @export
set_upper <- function(...) typst_set("upper", ...)

#' @rdname typst_function
#' @export
#' @examples
#' raw_("print('hello world')", lang = "python", block = TRUE)
raw_ <- function(...) typst_function("raw", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_raw(lang = "python", block = TRUE)
set_raw <- function(...) typst_set("raw", ...)

#' @rdname typst_function
#' @export
#' @examples
#' highlight(extent = pt(3), "hey")
highlight <- function(...) typst_function("highlight", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_highlight(extent = pt(3))
set_highlight <- function(...) typst_set("highlight", ...)

#' @rdname typst_function
#' @export
#' @examples
#' lower("hey")
lower <- function(...) typst_function("lower", ...)

#' @rdname typst_set
#' @export
set_lower <- function(...) typst_set("lower", ...)
