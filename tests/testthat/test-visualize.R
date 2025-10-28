test_that("Test visualize functions", {
  out <- circle(fill = blue, "hey")
  expect_equal(out, "#circle(fill: blue)[hey]")
  expect_true(out |> is_valid_typst())

  out <- rect(fill = blue, "hey")
  expect_equal(out, "#rect(fill: blue)[hey]")
  expect_true(out |> is_valid_typst())

  out <- rect(fill = blue, radius = pt(2), "yooooo")
  expect_equal(out, "#rect(fill: blue, radius: 2pt)[yooooo]")
  expect_true(out |> is_valid_typst())

  out <- ellipse(fill = green, "hey")
  expect_equal(out, "#ellipse(fill: green)[hey]")
  expect_true(out |> is_valid_typst())

  out <- image("../docs/link.svg")
  expect_equal(out, "#image(\"../docs/link.svg\")")
  expect_false(out |> is_valid_typst()) # image not found error

  out <- image(width = percent(80), height = "auto", "../docs/link.svg")
  expect_equal(out, "#image(width: 80%, height: auto, \"../docs/link.svg\")")
  expect_false(out |> is_valid_typst()) # image not found error

  out <- line(length = percent(80), angle = deg(20))
  expect_equal(out, "#line(length: 80%, angle: 20deg)")
  expect_true(out |> is_valid_typst())

  out <- line(stroke = pt(2) + blue)
  expect_equal(out, "#line(stroke: 2pt + blue)")
  expect_true(out |> is_valid_typst())

  out <- line(stroke = pt(2) + rgb("#3d9970"))
  expect_equal(out, "#line(stroke: 2pt + rgb(\"#3d9970\"))")
  expect_true(out |> is_valid_typst())

  out <- square(size = pt(5), fill = red)
  expect_equal(out, "#square(size: 5pt, fill: red)")
  expect_true(out |> is_valid_typst())
})
