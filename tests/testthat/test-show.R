test_that("show rules", {
  out <- show_heading(set_text(fill = red, size = pt(20)))

  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#show heading: set text(fill: red, size: 20pt)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))
})
