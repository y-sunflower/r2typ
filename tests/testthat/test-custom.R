test_that("User defined functions", {
  hello <- function(...) typst_function("hello", ...)
  out <- hello(fill = red, size = pt(10), other_arg = "world")

  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#hello(fill: red, size: 10pt, other_arg: \"world\")")
  expect_false(out |> is_valid_typst())
})
