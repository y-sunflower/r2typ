test_that("Test visualize functions", {
  out <- circle(fill = blue, "hey")
  expect_equal(out, "#circle(fill: blue)[hey]")

  out <- rect(fill = blue, "hey")
  expect_equal(out, "#rect(fill: blue)[hey]")

  out <- rect(fill = blue, radius = pt(2), "yooooo")
  expect_equal(out, "#rect(fill: blue, radius: 2pt)[yooooo]")

  out <- ellipse(fill = green, "hey")
  expect_equal(out, "#ellipse(fill: green)[hey]")

  out <- image("../docs/link.svg")
  expect_equal(out, "#image(\"../docs/link.svg\")")

  out <- image(width = percent(80), height = "auto", "../docs/link.svg")
  expect_equal(out, "#image(width: 80%, height: auto, \"../docs/link.svg\")")

  out <- line(length = percent(80), angle = deg(20))
  expect_equal(out, "#line(length: 80%, angle: 20deg)")
})
