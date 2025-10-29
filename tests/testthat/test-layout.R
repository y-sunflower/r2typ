test_that("Test layout functions", {
  out <- place(top + left, dx = pt(-5), "hey")
  expect_equal(out, "#place(top + left, dx: -5pt)[hey]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_place(dx = pt(-5))
  expect_equal(out, "#set place(dx: -5pt)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- place(
    top + left,
    dy = pt(15),
    square(size = pt(35), fill = red)
  )
  expect_equal(
    out,
    "#place(top + left, dy: 15pt)[#square(size: 35pt, fill: red)]"
  )
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- place(
    top + left,
    dy = pt(15),
    square(size = pt(35), fill = rgb("#ffffff"))
  )
  expect_equal(
    out,
    "#place(top + left, dy: 15pt)[#square(size: 35pt, fill: rgb(\"#ffffff\"))]"
  )
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- align(center + horizon, "hey")
  expect_equal(out, "#align(center + horizon)[hey]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- block(
    breakable = FALSE,
    width = percent(50),
    height = "auto",
    fill = aqua,
    "cookies"
  )
  expect_equal(
    out,
    "#block(breakable: false, width: 50%, height: auto, fill: aqua)[cookies]"
  )
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- box(
    clip = FALSE,
    width = percent(50),
    height = "auto",
    fill = red,
    "ice cream"
  )
  expect_equal(
    out,
    "#box(clip: false, width: 50%, height: auto, fill: red)[ice cream]"
  )
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- colbreak(weak = TRUE)
  expect_equal(out, "#colbreak(weak: true)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- stack(dir = ttb, "hey", "you", "!")
  expect_equal(out, "#stack(dir: ttb, \"hey\", \"you\", \"!\")")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- grid(
    columns = 2,
    rows = 2,
    gutter = pt(3),
    "hey",
    "cookies",
    "ice",
    "cream"
  )
  expect_equal(
    out,
    "#grid(columns: 2, rows: 2, gutter: 3pt, \"hey\", \"cookies\", \"ice\", \"cream\")"
  )
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_h(weak = TRUE)
  expect_equal(out, "#set h(weak: true)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_v(weak = TRUE)
  expect_equal(out, "#set v(weak: true)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_block(
    breakable = FALSE,
    width = percent(50),
    height = "auto",
    fill = aqua
  )
  expect_equal(
    out,
    "#set block(breakable: false, width: 50%, height: auto, fill: aqua)"
  )
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- hide("hey")
  expect_equal(out, "#hide[hey]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_box(clip = FALSE, width = percent(50), height = "auto", fill = red)
  expect_equal(
    out,
    "#set box(clip: false, width: 50%, height: auto, fill: red)"
  )
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_colbreak(weak = TRUE)
  expect_equal(out, "#set colbreak(weak: true)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_stack(dir = ttb)
  expect_equal(out, "#set stack(dir: ttb)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_grid(columns = 2, rows = 2, gutter = pt(3))
  expect_equal(out, "#set grid(columns: 2, rows: 2, gutter: 3pt)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_pagebreak(weak = TRUE)
  expect_equal(out, "#set pagebreak(weak: true)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_move(dx = pt(3), dy = pt(5))
  expect_equal(out, "#set move(dx: 3pt, dy: 5pt)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_pad(x = percent(0) + pt(5), y = percent(10) + pt(0))
  expect_equal(out, "#set pad(x: 0% + 5pt, y: 10% + 0pt)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_page(flipped = TRUE, columns = 2, fill = red)
  expect_equal(out, "#set page(flipped: true, columns: 2, fill: red)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- move(dx = pt(3), dy = pt(5), "pasta")
  expect_equal(out, "#move(dx: 3pt, dy: 5pt, \"pasta\")")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_scale(x = percent(-100))
  expect_equal(out, "#set scale(x: -100%)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- set_skew(ax = deg(-12))
  expect_equal(out, "#set skew(ax: -12deg)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- pad(x = percent(0) + pt(5), y = percent(10) + pt(0), image("file.svg"))
  expect_equal(out, "#pad(x: 0% + 5pt, y: 10% + 0pt)[#image(\"file.svg\")]")
  expect_false(out |> is_valid_typst()) # file not found error expected

  out <- page(
    flipped = TRUE,
    columns = 2,
    fill = red,
    place(
      top + left,
      dx = pt(-5),
      rect(fill = blue, radius = pt(2), "yooooo")
    )
  )
  expect_equal(
    out,
    "#page(flipped: true, columns: 2, fill: red)[#place(top + left, dx: -5pt)[#rect(fill: blue, radius: 2pt)[yooooo]]]"
  )
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- pagebreak(weak = TRUE)
  expect_equal(out, "#pagebreak(weak: true)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- rect(width = percent(100) - pt(50))
  expect_equal(out, "#rect(width: 100% - 50pt)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- scale_(x = percent(-100), "This is mirrored")
  expect_equal(out, "#scale(x: -100%)[This is mirrored]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- skew(ax = deg(-12), "This is some fake italic text.")
  expect_equal(out, "#skew(ax: -12deg)[This is some fake italic text.]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))
})
