#' @title Typst Color
#'
#' @description
#' These functions generate special objects representing colors in Typst code.
#' They can be used as arguments in functions like `text()` or `heading()` to
#' produce properly formatted Typst code.
#'
#' @return An object of class `typst_color` and `typst_expression`.
#'
#' @examples
#' rgb("#ffffff")
#' text(font = "Roboto", fill = rgb("#ffffff"), "cookies are healthy!!")
#' red
#' blue
#' black
#'
#' @name typst_colors
NULL

#' @rdname typst_colors
#' @export
#' @param hex An hexadecimal color.
rgb <- function(hex) {
  structure(
    paste0("rgb(\"", hex, "\")"),
    class = c("typst_color", "typst_expression")
  )
}

#' @rdname typst_colors
#' @export
silver <- structure("silver", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
grey <- structure("grey", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
black <- structure("black", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
white <- structure("white", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
navy <- structure("navy", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
blue <- structure("blue", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
aqua <- structure("aqua", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
teal <- structure("teal", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
eastern <- structure("eastern", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
purple <- structure("purple", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
fuchsia <- structure("fuchsia", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
maroon <- structure("maroon", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
red <- structure("red", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
orange <- structure("orange", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
yellow <- structure("yellow", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
olive <- structure("olive", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
green <- structure("green", class = c("typst_color", "typst_expression"))

#' @rdname typst_colors
#' @export
lime <- structure("lime", class = c("typst_color", "typst_expression"))
