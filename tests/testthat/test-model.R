test_that("Test model functions", {
  out <- heading(level = 2, numbering = "1.1", "Hello world")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#heading(level: 2, numbering: \"1.1\")[Hello world]")
  expect_true(out |> is_valid_typst())

  out <- set_heading(level = 2, numbering = "1.1")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#set heading(level: 2, numbering: \"1.1\")")
  expect_true(out |> is_valid_typst())

  out <- heading("Just text")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#heading()[Just text]")
  expect_true(out |> is_valid_typst())

  out <- heading(level = 3, "Intro", "More text")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#heading(level: 3)[Intro More text]")
  expect_true(out |> is_valid_typst())

  out <- bibliography(full = TRUE, "more cookies...")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#bibliography(full: true, \"more cookies...\")")
  expect_false(out |> is_valid_typst()) # file not found error

  out <- set_bibliography(full = TRUE)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#set bibliography(full: true)")
  expect_true(out |> is_valid_typst())

  out <- list_("please", "more", "cookies...")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#list([please], [more], [cookies...])")

  out <- list_("please", "more", linebreak())
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#list([please], [more], [#linebreak()])")
  expect_true(out |> is_valid_typst())

  out <- list_(tight = TRUE, "I", "need", "a cat")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(
    out,
    "#list(tight: true, [I], [need], [a cat])"
  )
  expect_true(out |> is_valid_typst())

  out <- set_list(tight = TRUE)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#set list(tight: true)")
  expect_true(out |> is_valid_typst())

  out <- set_document(author = "Me, myself & I")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#set document(author: \"Me, myself & I\")")
  expect_true(out |> is_valid_typst())

  out <- emph("more cookies...")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#emph()[more cookies...]")
  expect_true(out |> is_valid_typst())

  out <- figure(alt = "This is an alternative text", "more cookies...")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(
    out,
    "#figure(alt: \"This is an alternative text\", \"more cookies...\")"
  )
  expect_true(out |> is_valid_typst())

  out <- set_figure(alt = "This is an alternative text")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#set figure(alt: \"This is an alternative text\")")
  expect_true(out |> is_valid_typst())

  out <- footnote(numbering = "*", "Cheese")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#footnote(numbering: \"*\")[Cheese]")
  expect_true(out |> is_valid_typst())

  out <- set_footnote(numbering = "*")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#set footnote(numbering: \"*\")")
  expect_true(out |> is_valid_typst())

  out <- enum(tight = FALSE, "please", "more", "cookies")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#enum(tight: false, [please], [more], [cookies])")
  expect_true(out |> is_valid_typst())

  out <- set_enum(tight = FALSE)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#set enum(tight: false)")
  expect_true(out |> is_valid_typst())

  out <- outline(depth = 1)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#outline(depth: 1)")
  expect_true(out |> is_valid_typst())

  out <- set_outline(depth = 1)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#set outline(depth: 1)")
  expect_true(out |> is_valid_typst())

  out <- par(
    `first-line-indent` = em(1),
    spacing = em(0.65),
    justify = TRUE,
    "more cookies..."
  )
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(
    out,
    "#par(first-line-indent: 1em, spacing: 0.65em, justify: true)[more cookies...]"
  )
  expect_true(out |> is_valid_typst())

  out <- set_par(
    `first-line-indent` = em(1),
    spacing = em(0.65),
    justify = TRUE
  )
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(
    out,
    "#set par(first-line-indent: 1em, spacing: 0.65em, justify: true)"
  )
  expect_true(out |> is_valid_typst())

  out <- parbreak()
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#parbreak()")
  expect_true(out |> is_valid_typst())

  out <- quote_(block = TRUE, "more cookies...")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#quote(block: true)[more cookies...]")
  expect_true(out |> is_valid_typst())

  out <- set_quote(block = TRUE)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#set quote(block: true)")
  expect_true(out |> is_valid_typst())

  out <- strong("strong coffee")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#strong()[strong coffee]")
  expect_true(out |> is_valid_typst())

  out <- strong(delta = 400, "more cookies...")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#strong(delta: 400)[more cookies...]")
  expect_true(out |> is_valid_typst())

  out <- set_strong(delta = 400)
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#set strong(delta: 400)")
  expect_true(out |> is_valid_typst())

  out <- table_(gutter = em(0.2), "please", "more", "cookies")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#table(gutter: 0.2em, [please], [more], [cookies])")
  expect_true(out |> is_valid_typst())

  out <- table_(align = center, inset = pt(10), "a", "b", "c", "d")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#table(align: center, inset: 10pt, [a], [b], [c], [d])")
  expect_true(out |> is_valid_typst())

  out <- table_(align = center, inset = mm(10), "a", "b", "c", "d")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#table(align: center, inset: 10mm, [a], [b], [c], [d])")
  expect_true(out |> is_valid_typst())

  out <- table_(align = center, inset = cm(10), "a", "b", "c", "d")
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#table(align: center, inset: 10cm, [a], [b], [c], [d])")
  expect_true(out |> is_valid_typst())

  out <- set_table(align = center, inset = pt(10))
  expect_true(out |> inherits("typst_markup"))
  out <- unclass(out)
  expect_equal(out, "#set table(align: center, inset: 10pt)")
  expect_true(out |> is_valid_typst())
})
