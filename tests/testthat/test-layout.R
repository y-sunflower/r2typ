test_that("Test layout functions", {
  out <- place(top + left, dx = pt(-5), "hey")
  expect_equal(out, "#place(top + left, dx: -5pt)[hey]")

  out <- place(
    top + left,
    dy = pt(15),
    square(size = pt(35), fill = red)
  )
  expect_equal(
    out,
    "#place(top + left, dy: 15pt)[#square(size: 35pt, fill: red)]"
  )
})
