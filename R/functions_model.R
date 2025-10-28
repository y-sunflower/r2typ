#' @rdname typst_functions
#' @export
#' @examples
#' bibliography(full = TRUE, "more cookies...")
bibliography <- function(...) typst_function("bibliography", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' list_(tight = TRUE, "I", "need", "a cat")
list_ <- function(...) typst_function("list", ...)

#' @rdname typst_functions
#' @export
document <- function(...) typst_function("document", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' emph("please! more cookies...")
emph <- function(...) typst_function("emph", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' figure(alt = "This is an alternative text", "more cookies...")
figure <- function(...) typst_function("figure", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' footnote(numbering = "*", "Cheese")
footnote <- function(...) typst_function("footnote", ...)

#' @rdname typst_functions
#' @export
heading <- function(...) typst_function("heading", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' enum(tight = FALSE, "I wonder", "if", "people", "will", "see", "this text")
enum <- function(...) typst_function("enum", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' outline(depth = 1)
outline <- function(...) typst_function("outline", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' par(
#'  `first-line-indent` = em(1),
#'  spacing = em(0.65),
#'  justify = TRUE,
#'  "more cookies..."
#')
#'
par <- function(...) typst_function("par", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' parbreak()
parbreak <- function(...) typst_function("parbreak", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' quote_(block = TRUE, "more cookies...")
quote_ <- function(...) typst_function("quote", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' strong("strong coffee")
strong <- function(...) typst_function("strong", ...)

#' @rdname typst_functions
#' @export
#' @examples
#' table_(align = center, inset = pt(10), "a", "b", "c", "d")
table_ <- function(...) typst_function("table", ...)
