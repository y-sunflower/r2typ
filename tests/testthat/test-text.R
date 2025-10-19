test_that("Test text functions", {
  out <- text(font = "Libertinus Serif", "Hello world")
  expect_equal(out, "#text(font: \"Libertinus Serif\")[Hello world]")
  expect_true(out |> is_valid_typst())

  out <- text("Just text")
  expect_equal(out, "#text[Just text]")
  expect_true(out |> is_valid_typst())

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

  out <- linebreak()
  expect_equal(out, "#linebreak()")
  expect_true(out |> is_valid_typst())

  out <- linebreak(justify = TRUE)
  expect_equal(out, "#linebreak(justify: true)")
  expect_true(out |> is_valid_typst())

  out <- highlight(`top-edge` = "ascender", "hey")
  expect_equal(out, "#highlight(top-edge: \"ascender\")[hey]")
  expect_true(out |> is_valid_typst())

  out <- lower("hey")
  expect_equal(out, "#lower[hey]")
  expect_true(out |> is_valid_typst())

  out <- upper("you")
  expect_equal(out, "#upper[you]")
  expect_true(out |> is_valid_typst())

  out <- overline(offset = em(-1.2), "ice cream")
  expect_equal(out, "#overline(offset: -1.2em)[ice cream]")
  expect_true(out |> is_valid_typst())

  out <- overline(offset = em(-1.2), "ice cream")
  expect_equal(out, "#overline(offset: -1.2em)[ice cream]")
  expect_true(out |> is_valid_typst())

  out <- smallcaps(all = TRUE, "UNICEF")
  expect_equal(out, "#smallcaps(all: true)[UNICEF]")
  expect_true(out |> is_valid_typst())

  out <- smartquote(double = FALSE)
  expect_equal(out, "#smartquote(double: false)")
  expect_true(out |> is_valid_typst())

  out <- strike("smart", background = TRUE)
  expect_equal(out, "#strike(background: true)[smart]")
  expect_true(out |> is_valid_typst())

  out <- sub_("smart", double = FALSE)
  expect_equal(out, "#sub(double: false)[smart]")

  out <- super("smart", double = FALSE)
  expect_equal(out, "#super(double: false)[smart]")

  out <- underline("under", offset = "auto")
  expect_equal(out, "#underline(offset: auto)[under]")

  out <- raw_("print('hello world')", lang = "python", block = TRUE)
  expect_equal(
    out,
    "#raw(lang: \"python\", block: true, \"print('hello world')\")"
  )

  out <- raw_(lang = "python", block = TRUE, "print('hello world')")
  expect_equal(
    out,
    "#raw(lang: \"python\", block: true, \"print('hello world')\")"
  )
})
