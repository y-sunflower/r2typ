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

  out <- duration(days = 3, hours = 12)
  expect_equal(out, "#duration(days: 3, hours: 12)")

  out <- eval_("*Markup!*", mode = "markup")
  expect_equal(out, "#eval(mode: \"markup\", \"*Markup!*\")")

  out <- panic("this is wrong")
  expect_equal(out, "#panic(\"this is wrong\")")

  out <- regex("\\d+")
  expect_equal(out, "#regex(\"\\d+\")")

  out <- repr("hello")
  expect_equal(out, "#repr(\"hello\")")

  out <- str_(10)
  expect_equal(out, "#str(10)")

  out <- symbole("10")
  expect_equal(out, "#symbole(\"10\")")

  out <- decimal("10")
  expect_equal(out, "#decimal(\"10\")")

  out <- type(14.7)
  expect_equal(out, "#type(14.7)")

  out <- version(1, 2, 3, 4)
  expect_equal(out, "#version(1, 2, 3, 4)")

  out <- version(c(1, 2, 3, 4))
  expect_equal(out, "#version((1, 2, 3, 4))")
})
