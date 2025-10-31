#' @title Typst show rules
#'
#' @description
#' Generates Typst show rules for a given function.
#'
#' @param ... Named or unnamed arguments passed to the Typst function.
#'   Named arguments become Typst parameters (e.g. `level = 2` → `level: 2`),
#'   while unnamed arguments form the body inside `[...]`.
#'
#' @return A character string containing the generated Typst code.
#'
#' @name typst_show
show_ <- function(name, set_rule) {
  if (!startsWith(set_rule, "#set ")) {
    stop(
      "`set_rule` argument is invalid: '",
      set_rule,
      "'. It should starts with '#set '."
    )
  }

  paste0(
    "#show ",
    name,
    ": ",
    substr(set_rule, start = 2, stop = nchar(set_rule))
  )
}
