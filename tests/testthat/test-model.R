test_that("Test model functions", {
  out <- heading(level = 2, numbering = "1.1", "Hello world")
  expect_equal(out, "#heading(level: 2, numbering: \"1.1\")[Hello world]")

  out <- heading("Just text")
  expect_equal(out, "#heading[Just text]")

  out <- heading(level = 3, "Intro", "More text")
  expect_equal(out, "#heading(level: 3)[Intro More text]")

  out <- bibliography(arg = 1, "more cookies...")
  expect_equal(out, "#bibliography(arg: 1, \"more cookies...\")")

  out <- list_("please", "more", "cookies...")
  expect_equal(out, "#list([please], [more], [cookies...])")

  out <- list_("please", "more", linebreak())
  expect_equal(out, "#list([please], [more], [#linebreak()])")

  out <- list_(center + horizon, tight = TRUE, "I", "need", "a cat")
  expect_equal(
    out,
    "#list(center + horizon, tight: true, [I], [need], [a cat])"
  )

  out <- document(arg = 1, "more cookies...")
  expect_equal(out, "#document(arg: 1, \"more cookies...\")")

  out <- emph("more cookies...")
  expect_equal(out, "#emph[more cookies...]")

  out <- figure(arg = 1, "more cookies...")
  expect_equal(out, "#figure(arg: 1, \"more cookies...\")")

  out <- footnote(numbering = "*", "Cheese")
  expect_equal(out, "#footnote(numbering: \"*\")[Cheese]")

  out <- enum(tight = FALSE, "please", "more", "cookies")
  expect_equal(out, "#enum(tight: false, [please], [more], [cookies])")

  out <- outline(arg = 1, "more cookies...")
  expect_equal(out, "#outline(arg: 1, \"more cookies...\")")

  out <- par(arg = 1, "more cookies...")
  expect_equal(out, "#par(arg: 1)[more cookies...]")

  out <- parbreak()
  expect_equal(out, "#parbreak()")

  out <- quote_(arg = 1, "more cookies...")
  expect_equal(out, "#quote(arg: 1)[more cookies...]")

  out <- strong(arg = 1, "more cookies...")
  expect_equal(out, "#strong(arg: 1)[more cookies...]")

  out <- table_(arg = 1, "please", "more", "cookies")
  expect_equal(out, "#table(arg: 1, [please], [more], [cookies])")

  out <- table_(align = center, inset = pt(10), "a", "b", "c", "d")
  expect_equal(out, "#table(align: center, inset: 10pt, [a], [b], [c], [d])")
})
