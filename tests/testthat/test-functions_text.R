test_that("Test text functions", {
  out <- text(font = "Libertinus Serif", "Hello world")
  expect_equal(out, "#text(font: \"Libertinus Serif\")[Hello world]")

  out <- text("Just text")
  expect_equal(out, "#text[Just text]")

  out <- text(
    size = pt(12),
    w = percent(80),
    a = TRUE,
    c = NULL,
    d = em(17),
    e = "auto",
    "hello"
  )
  expect_equal(
    out,
    "#text(size: 12pt, w: 80%, a: true, c: none, d: 17em, e: auto)[hello]"
  )

  out <- heading(level = 2, numbering = "1.1", "Hello world")
  expect_equal(out, "#heading(level: 2, numbering: \"1.1\")[Hello world]")

  out <- heading("Just text")
  expect_equal(out, "#heading[Just text]")

  out <- heading(level = 3, "Intro", "More text")
  expect_equal(out, "#heading(level: 3)[Intro More text]")

  out <- linebreak()
  expect_equal(out, "#linebreak()")

  out <- linebreak(justify = TRUE)
  expect_equal(out, "#linebreak(justify: true)")

  out <- highlight(`top-edge` = "ascender", "hey")
  expect_equal(out, "#highlight(top-edge: \"ascender\")[hey]")

  out <- lower("hey")
  expect_equal(out, "#lower[hey]")

  out <- upper("you")
  expect_equal(out, "#upper[you]")

  out <- overline(offset = em(-1.2), "ice cream")
  expect_equal(out, "#overline(offset: -1.2em)[ice cream]")

  out <- overline(offset = fr(-1.2), "ice cream")
  expect_equal(out, "#overline(offset: -1.2fr)[ice cream]")

  out <- smallcaps(all = TRUE, "UNICEF")
  expect_equal(out, "#smallcaps(all: true)[UNICEF]")

  out <- smartquote("smart", double = FALSE)
  expect_equal(out, "#smartquote(double: false)[smart]")

  out <- strike("smart", double = FALSE)
  expect_equal(out, "#strike(double: false)[smart]")

  out <- sub("smart", double = FALSE)
  expect_equal(out, "#sub(double: false)[smart]")

  out <- super("smart", double = FALSE)
  expect_equal(out, "#super(double: false)[smart]")

  out <- underline("under", offset = "auto")
  expect_equal(out, "#underline(offset: auto)[under]")

  out <- circle(fill = blue, "hey")
  expect_equal(out, "#circle(fill: blue)[hey]")
})
