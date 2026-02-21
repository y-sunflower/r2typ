test_that("let keyword usage", {
  out <- let("yellow", rgb("#FFC300"))
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#let yellow = rgb(\"#FFC300\")")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out1 <- let("mycirc", circle(fill = yellow, square(height = cm(1))))
  expect_true(out1 |> inherits("typst_markup"))
  out1 <- unclass(out1)
  expect_equal(
    out1,
    "#let mycirc = circle(fill: rgb(\"#FFC300\"))[#square(height: 1cm)]"
  )
  expect_true(out1 |> is_valid_typst(error_on_failure = TRUE))

  expect_true(mycirc |> inherits("typst_markup"))
  mycirc <- unclass(mycirc)
  expect_equal(
    mycirc,
    "#circle(fill: rgb(\"#FFC300\"))[#square(height: 1cm)]"
  )
  expect_true(mycirc |> is_valid_typst(error_on_failure = TRUE))
})
