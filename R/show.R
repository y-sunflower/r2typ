#' @title Typst show rules
#'
#' @description
#' Generates Typst show rules for a given function.
#'
#' @param name Name of the function for the show rule.
#' @param set_rule A set rule made with one of the set functions
#' in `{r2typ}`.
#'
#' @return A character string containing the generated Typst code.
#'
#' @examples
#' show_("heading", set_text(red))
#'
#' @export
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

  show_rule <- paste0(
    "#show ",
    name,
    ": ",
    substr(set_rule, start = 2, stop = nchar(set_rule))
  )

  structure(show_rule, class = "typst_markup")
}
