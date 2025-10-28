#' @rdname typst_set
#' @export
#' @examples
#' set_bibliography(full = TRUE)
set_bibliography <- function(...) typst_set("bibliography", ...)

#' @rdname typst_function
#' @export
#' @examples
#' bibliography(full = TRUE, "more cookies...")
bibliography <- function(...) typst_function("bibliography", ...)

#' @rdname typst_function
#' @export
#' @examples
#' set_list(tight = TRUE)
set_list <- function(...) typst_set("list", ...)

#' @rdname typst_function
#' @export
#' @examples
#' list_(tight = TRUE, "I", "need", "a cat")
list_ <- function(...) typst_function("list", ...)

#' @rdname typst_function
#' @export
document <- function(...) typst_function("document", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_document(author = "Me, myself & I")
set_document <- function(...) typst_set("document", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_emph()
set_emph <- function(...) typst_set("emph", ...)

#' @rdname typst_function
#' @export
#' @examples
#' emph("please! more cookies...")
emph <- function(...) typst_function("emph", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_figure(alt = "This is an alternative text")
set_figure <- function(...) typst_set("figure", ...)

#' @rdname typst_function
#' @export
#' @examples
#' figure(alt = "This is an alternative text", "more cookies...")
figure <- function(...) typst_function("figure", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_footnote(numbering = "*")
set_footnote <- function(...) typst_set("footnote", ...)

#' @rdname typst_function
#' @export
#' @examples
#' footnote(numbering = "*", "Cheese")
footnote <- function(...) typst_function("footnote", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_heading(level = 3)
set_heading <- function(...) typst_set("heading", ...)

#' @rdname typst_function
#' @export
#' @examples
#' heading(level = 3, "Intro", "More text")
heading <- function(...) typst_function("heading", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_enum(tight = FALSE)
set_enum <- function(...) typst_set("enum", ...)

#' @rdname typst_function
#' @export
#' @examples
#' enum(tight = FALSE, "I wonder", "if", "people", "will", "see", "this text")
enum <- function(...) typst_function("enum", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_outline(depth = 1)
set_outline <- function(...) typst_set("outline", ...)

#' @rdname typst_function
#' @export
#' @examples
#' outline(depth = 1)
outline <- function(...) typst_function("outline", ...)

#' @rdname typst_function
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

#' @rdname typst_set
#' @export
#' @examples
#' set_par(
#'  `first-line-indent` = em(1),
#'  spacing = em(0.65),
#'  justify = TRUE
#')
set_par <- function(...) typst_set("par", ...)

#' @rdname typst_function
#' @export
#' @examples
#' parbreak()
parbreak <- function(...) typst_function("parbreak", ...)

#' @rdname typst_set
#' @export
set_parbreak <- function(...) typst_set("parbreak", ...)

#' @rdname typst_function
#' @export
#' @examples
#' quote_(block = TRUE, "more cookies...")
quote_ <- function(...) typst_function("quote", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_quote(block = TRUE)
set_quote <- function(...) typst_set("quote", ...)

#' @rdname typst_function
#' @export
#' @examples
#' strong("strong coffee")
strong <- function(...) typst_function("strong", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_strong(delta = 400)
set_strong <- function(...) typst_set("strong", ...)

#' @rdname typst_function
#' @export
#' @examples
#' table_(align = center, inset = pt(10), "a", "b", "c", "d")
table_ <- function(...) typst_function("table", ...)

#' @rdname typst_set
#' @export
#' @examples
#' set_table(align = center, inset = pt(10))
set_table <- function(...) typst_set("table", ...)
