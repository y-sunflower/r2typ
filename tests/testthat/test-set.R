test_that("Test heading set rule", {
  out <- set_heading(level = 2, numbering = "1.1")
  expect_equal(out, "#set heading(level: 2, numbering: \"1.1\")")

  out <- set_heading("blue")
  expect_equal(out, "#set heading(blue)")

  out <- set_heading("blue", level = 2)
  expect_equal(out, "#set heading(level: 2, blue)")
})

test_that("Test text set rule", {
  out <- set_text(font = "Libertinus Serif")
  expect_equal(out, "#set text(font: \"Libertinus Serif\")")

  out <- set_text(font = "Libertinus Serif", "red")
  expect_equal(out, "#set text(font: \"Libertinus Serif\", red)")
})

test_that("Test image set rule", {
  out <- set_image(width = percent(80), height = "auto")
  expect_equal(out, "#set image(width: 80%, height: auto)")
})

test_that("Test place set rule", {
  out <- set_place(dx = pt(-5))
  expect_equal(out, "#set place(dx: -5pt)")
})
