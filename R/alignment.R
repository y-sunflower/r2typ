#' @title (not working yet) Create Typst Alignment
#'
#' @description
#' These functions generate special objects representing alignment in Typst code.
#' They can be used as arguments in functions like `text()` or `heading()` to
#' produce properly formatted Typst code.
#'
#' @param e1 A typst alignment
#' @param e2 A typst alignment
#'
#' @return An object of class `typst_alignment`.
#'
#' @examples
#' left
#' center + horizon
#' top + right
#'
#' @name typst_alignments
#'
#' @export
`+.typst_alignment` <- function(e1, e2) {
  result <- paste(as.character(e1), as.character(e2), sep = " + ")
  structure(result, class = "typst_alignment")
}

#' @rdname typst_alignments
#' @export
horizon <- structure("horizon", class = "typst_alignment")

#' @rdname typst_alignments
#' @export
top <- structure("top", class = "typst_alignment")

#' @rdname typst_alignments
#' @export
bottom <- structure("bottom", class = "typst_alignment")

#' @rdname typst_alignments
#' @export
center <- structure("center", class = "typst_alignment")

#' @rdname typst_alignments
#' @export
left <- structure("left", class = "typst_alignment")

#' @rdname typst_alignments
#' @export
right <- structure("right", class = "typst_alignment")
