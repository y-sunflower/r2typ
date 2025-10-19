test_that("Test foundations functions", {
  out <- text(`stylistic-set` = c(1, 2, 3), "10 years ago")
  expect_equal(out, "#text(stylistic-set: (1, 2, 3))[10 years ago]")

  out <- assert(1 < 2, message = "math broke")
  expect_equal(out, "#assert(message: \"math broke\", TRUE)")

  out <- bytes(c(1, 2, 3))
  expect_equal(out, "#bytes((1, 2, 3))")

  out <- bytes(list(1, 2, 3))
  expect_equal(out, "#bytes((1, 2, 3))")

  out <- bytes("hey")
  expect_equal(out, "#bytes(\"hey\")")

  out <- datetime(year = 2012, month = 8, day = 3)
  expect_equal(out, "#datetime(year: 2012, month: 8, day: 3)")

  out <- text(costs = list(hyphenation = percent(100), runt = percent(100)))
  expect_equal(out, "#text(costs: (hyphenation: 100%, runt: 100%))")
})
