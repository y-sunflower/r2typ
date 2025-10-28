#' @title Typst Direction
#'
#' @description
#' These functions generate special objects representing directions in Typst.
#' They can be used as arguments in functions like `stack()`.
#'
#' @return An object of class `typst_direction` and `typst_expression`.
#'
#' @examples
#' ltr
#' rtl
#' ttb
#' btt
#'
#' @name typst_direction
NULL

#' @rdname typst_direction
#' @export
ltr <- structure("ltr", class = c("typst_direction", "typst_expression"))

#' @rdname typst_direction
#' @export
rtl <- structure("rtl", class = c("typst_direction", "typst_expression"))

#' @rdname typst_direction
#' @export
ttb <- structure("ttb", class = c("typst_direction", "typst_expression"))

#' @rdname typst_direction
#' @export
btt <- structure("btt", class = c("typst_direction", "typst_expression"))
