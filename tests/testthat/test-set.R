test_that("Test heading function", {
  out <- set_heading(level = 2, numbering = "1.1")
  expect_equal(out, "#set heading(level: 2, numbering: \"1.1\")")

  out <- set_heading("blue")
  expect_equal(out, "#set heading(blue)")

  out <- set_heading("blue", level = 2)
  expect_equal(out, "#set heading(level: 2, blue)")
})

test_that("Test text function", {
  out <- set_text(font = "Libertinus Serif")
  expect_equal(out, "#set text(font: \"Libertinus Serif\")")

  out <- set_text(font = "Libertinus Serif", "red")
  expect_equal(out, "#set text(font: \"Libertinus Serif\", red)")
})
