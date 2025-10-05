test_that("Test heading function", {
  out <- heading(level = 2, numbering = "1.1", "Hello world")
  expect_equal(out, "#heading(level: 2, numbering: \"1.1\")[Hello world]")

  out <- heading("Just text")
  expect_equal(out, "#heading[Just text]")

  out <- heading(level = 3, "Intro", "More text")
  expect_equal(out, "#heading(level: 3)[Intro More text]")
})

test_that("Test text function", {
  out <- text(font = "Libertinus Serif", "Hello world")
  expect_equal(out, "#text(font: \"Libertinus Serif\")[Hello world]")

  out <- text("Just text")
  expect_equal(out, "#text[Just text]")
})
