test_that("as_raw_typ returns correct structure", {
  x <- "#heading(level: 2, numbering: \"1.1\")[Hello world]"
  res <- as_raw_typ(x)

  expect_s3_class(res, "knit_asis")
  expect_identical(attr(res, "knit_cacheable"), NA)
})

test_that("as_raw_typ wraps content in typst block correctly", {
  x <- "#heading(level: 2, numbering: \"1.1\")[Hello world]"
  res <- as_raw_typ(x)

  expected <- "\n```{=typst}\n#heading(level: 2, numbering: \"1.1\")[Hello world]\n```\n"
  expect_identical(
    res,
    structure(expected, class = "knit_asis", knit_cacheable = NA)
  )
})

test_that("as_raw_typ handles multiple lines correctly", {
  x <- c("a", "b", "c")
  res <- as_raw_typ(x)

  expected <- "\n```{=typst}\na\nb\nc\n```\n"
  expect_identical(
    res,
    structure(expected, class = "knit_asis", knit_cacheable = NA)
  )
})

test_that("as_raw_typ handles empty input", {
  res <- as_raw_typ(character())
  expected <- "\n```{=typst}\n\n```\n"
  expect_identical(
    res,
    structure(expected, class = "knit_asis", knit_cacheable = NA)
  )
})
