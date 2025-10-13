test_that("Valid Typst code returns TRUE", {
  valid_code <- c("= Hello World", "This is a Typst document.")
  expect_true(is_valid_typst(valid_code))
})

test_that("Invalid Typst code returns FALSE when error_on_failure = FALSE", {
  invalid_code <- c("= Hello World", "#This is a Typst document.") # Assuming '#' is invalid here
  expect_false(is_valid_typst(invalid_code))
})

test_that("Invalid Typst code throws error when error_on_failure = TRUE", {
  invalid_code <- c("= Hello World", "#This is a Typst document.")
  expect_error(is_valid_typst(invalid_code, error_on_failure = TRUE))
})
