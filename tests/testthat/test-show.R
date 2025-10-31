test_that("Show rules", {
  set_rule <- set_text(red)
  show_rule <- show_("heading", set_rule)
  expect_equal(show_rule, "#show heading: set text(red)")
  expect_true(show_rule |> is_valid_typst(error_on_failure = TRUE))

  show_rule <- show_("heading", set_circle(width = percent(50)))
  expect_equal(show_rule, "#show heading: set circle(width: 50%)")
  expect_true(show_rule |> is_valid_typst(error_on_failure = TRUE))

  expect_error(
    show_("heading", "aaa"),
    regexp = "`set_rule` argument is invalid: 'aaa'. It should starts with '#set '."
  )
})
