#' @rdname typst_functions
#' @export
bibliography <- function(...) typst_function("bibliography", ...)

#' @rdname typst_functions
#' @export
#' @note
#' Does not work yet because `label` type is not implemented yet.
#' See https://github.com/y-sunflower/rtyp/issues/10
cite <- function(...) typst_function("cite", ...)

#' @rdname typst_functions
#' @export
list_ <- function(...) typst_function("list", ...)

#' @rdname typst_functions
#' @export
document <- function(...) typst_function("document", ...)

#' @rdname typst_functions
#' @export
emph <- function(...) typst_function("emph", ...)

#' @rdname typst_functions
#' @export
figure <- function(...) typst_function("figure", ...)

#' @rdname typst_functions
#' @export
footnote <- function(...) typst_function("footnote", ...)

#' @rdname typst_functions
#' @export
heading <- function(...) typst_function("heading", ...)

#' @rdname typst_functions
#' @export
enum <- function(...) typst_function("enum", ...)

#' @rdname typst_functions
#' @export
outline <- function(...) typst_function("outline", ...)

#' @rdname typst_functions
#' @export
par <- function(...) typst_function("par", ...)

#' @rdname typst_functions
#' @export
parbreak <- function(...) typst_function("parbreak", ...)

#' @rdname typst_functions
#' @export
quote_ <- function(...) typst_function("quote", ...)

#' @rdname typst_functions
#' @export
strong <- function(...) typst_function("strong", ...)

#' @rdname typst_functions
#' @export
table_ <- function(...) typst_function("table", ...)
