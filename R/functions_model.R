#' @rdname typst-set
#' @export
#' @examples
#' set_bibliography(full = TRUE)
set_bibliography <- function(...) typst_set("bibliography", ...)

#' @rdname typst-function
#' @export
#' @examples
#' bibliography(full = TRUE, "more cookies...")
bibliography <- function(...) typst_function("bibliography", ...)

#' @rdname typst-show
#' @export
show_bibliography <- function(set_rule) typst_show("bibliography", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' set_list(tight = TRUE)
set_list <- function(...) typst_set("list", ...)

#' @rdname typst-function
#' @export
#' @examples
#' list_(tight = TRUE, "I", "need", "a cat")
list_ <- function(...) typst_function("list", ...)

#' @rdname typst-show
#' @export
show_list <- function(set_rule) typst_show("list", set_rule)

#' @rdname typst-function
#' @export
document <- function(...) typst_function("document", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_document(author = "Me, myself & I")
set_document <- function(...) typst_set("document", ...)

#' @rdname typst-show
#' @export
show_document <- function(set_rule) typst_show("document", set_rule)

#' @rdname typst-set
#' @export
#' @examples
#' set_emph()
set_emph <- function(...) typst_set("emph", ...)

#' @rdname typst-function
#' @export
#' @examples
#' emph("please! more cookies...")
emph <- function(...) typst_function("emph", ...)

#' @rdname typst-show
#' @export
show_emph <- function(set_rule) typst_show("emph", set_rule)

#' @rdname typst-set
#' @export
#' @examples
#' set_figure(alt = "This is an alternative text")
set_figure <- function(...) typst_set("figure", ...)

#' @rdname typst-function
#' @export
#' @examples
#' figure(alt = "This is an alternative text", "more cookies...")
figure <- function(...) typst_function("figure", ...)

#' @rdname typst-show
#' @export
show_figure <- function(set_rule) typst_show("figure", set_rule)

#' @rdname typst-set
#' @export
#' @examples
#' set_footnote(numbering = "*")
set_footnote <- function(...) typst_set("footnote", ...)

#' @rdname typst-function
#' @export
#' @examples
#' footnote(numbering = "*", "Cheese")
footnote <- function(...) typst_function("footnote", ...)

#' @rdname typst-show
#' @export
show_footnote <- function(set_rule) typst_show("footnote", set_rule)

#' @rdname typst-set
#' @export
#' @examples
#' set_heading(level = 3)
set_heading <- function(...) typst_set("heading", ...)

#' @rdname typst-function
#' @export
#' @examples
#' heading(level = 3, "Intro", "More text")
heading <- function(...) typst_function("heading", ...)

#' @rdname typst-show
#' @export
show_heading <- function(set_rule) typst_show("heading", set_rule)

#' @rdname typst-set
#' @export
#' @examples
#' set_enum(tight = FALSE)
set_enum <- function(...) typst_set("enum", ...)

#' @rdname typst-function
#' @export
#' @examples
#' enum(tight = FALSE, "I wonder", "if", "people", "will", "see", "this text")
enum <- function(...) typst_function("enum", ...)

#' @rdname typst-show
#' @export
show_enum <- function(set_rule) typst_show("enum", set_rule)

#' @rdname typst-set
#' @export
#' @examples
#' set_outline(depth = 1)
set_outline <- function(...) typst_set("outline", ...)

#' @rdname typst-function
#' @export
#' @examples
#' outline(depth = 1)
outline <- function(...) typst_function("outline", ...)

#' @rdname typst-show
#' @export
show_outline <- function(set_rule) typst_show("outline", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' par(
#'  `first-line-indent` = em(1),
#'  spacing = em(0.65),
#'  justify = TRUE,
#'  "more cookies..."
#')
par <- function(...) typst_function("par", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_par(
#'  `first-line-indent` = em(1),
#'  spacing = em(0.65),
#'  justify = TRUE
#')
set_par <- function(...) typst_set("par", ...)

#' @rdname typst-show
#' @export
show_par <- function(set_rule) typst_show("par", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' parbreak()
parbreak <- function(...) typst_function("parbreak", ...)

#' @rdname typst-set
#' @export
set_parbreak <- function(...) typst_set("parbreak", ...)

#' @rdname typst-show
#' @export
show_parbreak <- function(set_rule) typst_show("parbreak", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' quote_(block = TRUE, "more cookies...")
quote_ <- function(...) typst_function("quote", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_quote(block = TRUE)
set_quote <- function(...) typst_set("quote", ...)

#' @rdname typst-show
#' @export
show_quote <- function(set_rule) typst_show("quote", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' strong("strong coffee")
strong <- function(...) typst_function("strong", ...)

#' @rdname typst-set
#' @export
#' @examples
#' set_strong(delta = 400)
set_strong <- function(...) typst_set("strong", ...)

#' @rdname typst-show
#' @export
show_strong <- function(set_rule) typst_show("strong", set_rule)

#' @rdname typst-function
#' @export
#' @examples
#' table_(align = center, inset = pt(10), "a", "b", "c", "d")
#' data <- data.frame(
#'   name = c("Alice", "Bob"),
#'   score = c(12, 18)
#' )
#' table_(data, align = center)
table_ <- function(...) {
  args <- list(...)
  arg_names <- names(args)

  if (is.null(arg_names)) {
    arg_names <- rep("", length(args))
  }

  unnamed_ids <- which(!nzchar(arg_names))
  is_data_frame <- vapply(args[unnamed_ids], is.data.frame, logical(1))

  if (!any(is_data_frame)) {
    return(typst_function("table", ...))
  }

  if (sum(is_data_frame) > 1) {
    stop("`table_()` only supports one unnamed data frame argument.")
  }

  data_frame_id <- unnamed_ids[which(is_data_frame)]
  data <- args[[data_frame_id]]
  cells <- table_from_frame(data)

  before <- if (data_frame_id > 1) args[seq_len(data_frame_id - 1)] else list()
  after <- if (data_frame_id < length(args)) {
    args[(data_frame_id + 1):length(args)]
  } else {
    list()
  }

  new_args <- c(before, cells, after)
  new_names <- names(new_args)
  if (is.null(new_names)) {
    new_names <- rep("", length(new_args))
  }

  if (!any(new_names == "columns")) {
    new_args <- c(list(columns = as.numeric(ncol(data))), new_args)
  }

  do.call(typst_function, c(list("table"), new_args))
}

#' @rdname typst-set
#' @export
#' @examples
#' set_table(align = center, inset = pt(10))
set_table <- function(...) typst_set("table", ...)

#' @rdname typst-show
#' @export
show_table <- function(set_rule) typst_show("table", set_rule)
