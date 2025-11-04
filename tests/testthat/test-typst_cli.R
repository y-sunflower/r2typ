test_that("Valid Typst CLI usage", {
  markup <- c("= Hello World", "This is a Typst document.")
  typ_file <- typst_write(markup)
  expect_true(file.exists(typ_file))

  pdf_file <- typst_compile(typ_file)
  expect_true(file.exists(pdf_file))
})

test_that("Invalid Typst CLI usage", {
  markup <- c("= Hello World", "This is a Typst document.")

  expect_error(
    typst_write(markup, output = "invalid.py"),
    regexp = "Output file must have a .typ extension"
  )
})
