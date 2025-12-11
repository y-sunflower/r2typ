test_that("Test text functions", {
  out <- text(font = "Libertinus Serif", "Hello world")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#text(font: \"Libertinus Serif\")[Hello world]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- text(`stylistic-set` = c(1, 2, 3), "10 years ago")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#text(stylistic-set: (1, 2, 3))[10 years ago]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- text("Just text")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#text()[Just text]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_text(red)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#set text(red)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- text(
    size = pt(12),
    w = percent(80),
    a = TRUE,
    c = NULL,
    d = em(17),
    e = auto,
    "hello"
  )
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(
    out,
    "#text(size: 12pt, w: 80%, a: true, c: none, d: 17em, e: auto)[hello]"
  )

  out <- linebreak()
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#linebreak()")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- linebreak(justify = TRUE)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#linebreak(justify: true)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- highlight(`top-edge` = "ascender", "hey")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#highlight(top-edge: \"ascender\")[hey]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- lower("HEY")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#lower()[HEY]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- upper("you")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#upper()[you]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- overline(offset = em(-1.2), "ice cream")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#overline(offset: -1.2em)[ice cream]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- overline(offset = em(-1.2), "ice cream")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#overline(offset: -1.2em)[ice cream]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- smallcaps(all = TRUE, "UNICEF")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#smallcaps(all: true)[UNICEF]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- smartquote(double = FALSE)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#smartquote(double: false)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- strike("smart", background = TRUE)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#strike(background: true)[smart]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- sub_("smart", typographic = FALSE)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#sub(typographic: false)[smart]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- super("smart", typographic = FALSE)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#super(typographic: false)[smart]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- underline("under", offset = auto)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#underline(offset: auto)[under]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- raw_("print('hello world')", lang = "python", block = TRUE)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(
    out,
    "#raw(lang: \"python\", block: true, \"print('hello world')\")"
  )
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- raw_(lang = "python", block = TRUE, "print('hello world')")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(
    out,
    "#raw(lang: \"python\", block: true, \"print('hello world')\")"
  )
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))
})
