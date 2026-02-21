test_that("let keyword usage", {
  out <- let("yellow", rgb("#FFC300"))
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#let yellow = rgb(\"#FFC300\")")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- let("mycirc", circle(fill = yellow, square(height = cm(1))))
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#let mycirc = circle(fill: yellow)[#square(height: 1cm)]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))
})
