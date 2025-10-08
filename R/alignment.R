#' @title Create Typst Alignment
#'
#' @description
#' These functions generate special objects representing alignment in Typst code.
#' They can be used as arguments in functions like `text()` or `heading()` to
#' produce properly formatted Typst code.
#'
#' @param left_align A typst alignment
#' @param right_align A typst alignment
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
`+.typst_alignment` <- function(left_align, right_align) {
  result <- paste(
    as.character(left_align),
    as.character(right_align),
    sep = " + "
  )
  structure(result, class = c("typst_alignment", "typst_expression"))
}

#' @rdname typst_alignments
#' @export
horizon <- structure(
  "horizon",
  class = c("typst_alignment", "typst_expression")
)

#' @rdname typst_alignments
#' @export
top <- structure("top", class = c("typst_alignment", "typst_expression"))

#' @rdname typst_alignments
#' @export
bottom <- structure("bottom", class = c("typst_alignment", "typst_expression"))

#' @rdname typst_alignments
#' @export
center <- structure("center", class = c("typst_alignment", "typst_expression"))

#' @rdname typst_alignments
#' @export
left <- structure("left", class = c("typst_alignment", "typst_expression"))

#' @rdname typst_alignments
#' @export
right <- structure("right", class = c("typst_alignment", "typst_expression"))
