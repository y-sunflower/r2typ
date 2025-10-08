#' @title Create Typst Color
#'
#' @description
#' These functions generate special objects representing colors in Typst code.
#' They can be used as arguments in functions like `text()` or `heading()` to
#' produce properly formatted Typst code.
#'
#' @return An object of class `typst_color`.
#'
#' @examples
#' red
#' blue
#' black
#'
#' @name typst_colors
NULL

#' @rdname typst_colors
#' @export
silver <- structure("silver", class = "typst_color")

#' @rdname typst_colors
#' @export
grey <- structure("grey", class = "typst_color")

#' @rdname typst_colors
#' @export
black <- structure("black", class = "typst_color")

#' @rdname typst_colors
#' @export
white <- structure("white", class = "typst_color")

#' @rdname typst_colors
#' @export
navy <- structure("navy", class = "typst_color")

#' @rdname typst_colors
#' @export
blue <- structure("blue", class = "typst_color")

#' @rdname typst_colors
#' @export
aqua <- structure("aqua", class = "typst_color")

#' @rdname typst_colors
#' @export
teal <- structure("teal", class = "typst_color")

#' @rdname typst_colors
#' @export
eastern <- structure("eastern", class = "typst_color")

#' @rdname typst_colors
#' @export
purple <- structure("purple", class = "typst_color")

#' @rdname typst_colors
#' @export
fuchsia <- structure("fuchsia", class = "typst_color")

#' @rdname typst_colors
#' @export
maroon <- structure("maroon", class = "typst_color")

#' @rdname typst_colors
#' @export
red <- structure("red", class = "typst_color")

#' @rdname typst_colors
#' @export
orange <- structure("orange", class = "typst_color")

#' @rdname typst_colors
#' @export
yellow <- structure("yellow", class = "typst_color")

#' @rdname typst_colors
#' @export
olive <- structure("olive", class = "typst_color")

#' @rdname typst_colors
#' @export
green <- structure("green", class = "typst_color")

#' @rdname typst_colors
#' @export
lime <- structure("lime", class = "typst_color")
