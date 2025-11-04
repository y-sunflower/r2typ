#' @title Compile a Typst file or character vector
#'
#' @description
#' Call the Typst CLI compiler and compile a file (.typ).
#' Falls back to `quarto typst` if `typst` is unavailable.
#'
#' @param file Path to a file (must end with ".typ").
#' @param output Optional path for the output file (default NULL).
#'
#' @returns Output file path, invisibly.
#'
#' @note
#' It requires to have the Typst compiler installed.
#' See [typst.app/open-source/](https://typst.app/open-source/).
#'
#' @export
typst_compile <- function(
  file,
  output = NULL
) {
  if (
    !is.character(file) ||
      length(file) != 1 ||
      !file.exists(file)
  ) {
    stop("`file` must be an existing .typ file path")
  }

  if (!grepl("\\.typ$", file, ignore.case = TRUE)) {
    stop("File must have a .typ extension")
  }

  args <- c("compile", file)
  if (!is.null(output)) {
    args <- c(args, output)
  }

  cli <- if (Sys.which("typst") != "") {
    "typst"
  } else if (Sys.which("quarto") != "") {
    c("quarto", "typst")
  } else {
    stop(
      "Neither 'typst' nor 'quarto typst' is available. ",
      "Install Typst: https://typst.app/open-source/ and ensure it is on PATH."
    )
  }

  if (length(cli) == 1) {
    res <- suppressWarnings(system2(cli, args, stdout = TRUE, stderr = TRUE))
    status <- attr(res, "status")
  } else {
    res <- suppressWarnings(system2(
      cli[1],
      c(cli[2], args),
      stdout = TRUE,
      stderr = TRUE
    ))
    status <- attr(res, "status")
  }

  if (!is.null(status) && status != 0) {
    stop("Typst compilation failed:\n\n", paste(res, collapse = "\n"))
  }

  invisible(if (!is.null(output)) output else file)
}
