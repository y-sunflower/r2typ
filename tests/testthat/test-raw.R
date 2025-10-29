test_that("as_quarto_typst returns correct structure", {
  x <- "#heading(level: 2, numbering: \"1.1\")[Hello world]"
  res <- as_quarto_typst(x)

  expect_s3_class(res, "knit_asis")
  expect_identical(attr(res, "knit_cacheable"), NA)
})

test_that("as_quarto_typst wraps content in typst block correctly", {
  x <- "#heading(level: 2, numbering: \"1.1\")[Hello world]"
  res <- as_quarto_typst(x)

  expected <- "\n```{=typst}\n#heading(level: 2, numbering: \"1.1\")[Hello world]\n```\n"
  expect_identical(
    res,
    structure(expected, class = "knit_asis", knit_cacheable = NA)
  )
})

test_that("as_quarto_typst handles multiple lines correctly", {
  x <- c("a", "b", "c")
  res <- as_quarto_typst(x)

  expected <- "\n```{=typst}\na\nb\nc\n```\n"
  expect_identical(
    res,
    structure(expected, class = "knit_asis", knit_cacheable = NA)
  )
})

test_that("as_quarto_typst handles empty input", {
  res <- as_quarto_typst(character())
  expected <- "\n```{=typst}\n\n```\n"
  expect_identical(
    res,
    structure(expected, class = "knit_asis", knit_cacheable = NA)
  )
})
