#' @keywords internal
table_from_frame <- function(data) {
  if (ncol(data) == 0) {
    stop("`table_()` cannot build a table from a data frame with zero columns.")
  }

  n_rows <- nrow(data)
  n_cols <- ncol(data)

  extract_cell <- function(column, row_id) {
    if (is.list(column) && !inherits(column, "POSIXlt")) {
      return(column[[row_id]])
    }

    column[row_id]
  }

  format_cell <- function(x) {
    if (inherits(x, "factor")) {
      x <- as.character(x)
    }

    if (inherits(x, c("Date", "POSIXt"))) {
      x <- as.character(x)
    }

    if (inherits(x, "typst_markup") && length(x) == 1) {
      return(x)
    }

    structure(format_as_typst(x, named = FALSE), class = "typst_markup")
  }

  cells <- vector(mode = "list", length = n_rows * n_cols)
  cell_id <- 1

  for (row_id in seq_len(n_rows)) {
    for (col_id in seq_len(n_cols)) {
      cell <- extract_cell(data[[col_id]], row_id)
      cells[[cell_id]] <- format_cell(cell)
      cell_id <- cell_id + 1
    }
  }

  cells
}
