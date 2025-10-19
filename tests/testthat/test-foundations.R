test_that("Test foundations functions", {
  out <- text(`stylistic-set` = c(1, 2, 3), "10 years ago")
  expect_equal(out, "#text(stylistic-set: (1, 2, 3))[10 years ago]")
  expect_true(out |> is_valid_typst())

  out <- assert(1 < 2, message = "math broke")
  expect_equal(out, "#assert(message: \"math broke\", TRUE)")

  out <- bytes(c(1, 2, 3))
  expect_equal(out, "#bytes((1, 2, 3))")
  expect_true(out |> is_valid_typst())

  out <- bytes(list(1, 2, 3))
  expect_equal(out, "#bytes((1, 2, 3))")
  expect_true(out |> is_valid_typst())

  out <- bytes("hey")
  expect_equal(out, "#bytes(\"hey\")")
  expect_true(out |> is_valid_typst())

  out <- datetime(year = 2012, month = 8, day = 3)
  expect_equal(out, "#datetime(year: 2012, month: 8, day: 3)")
  expect_true(out |> is_valid_typst())

  out <- text(
    costs = list(hyphenation = percent(100), runt = percent(100)),
    "hey"
  )
  expect_equal(out, "#text(costs: (hyphenation: 100%, runt: 100%))[hey]")
  expect_true(out |> is_valid_typst())

  out <- duration(days = 3, hours = 12)
  expect_equal(out, "#duration(days: 3, hours: 12)")
  expect_true(out |> is_valid_typst())

  out <- eval_("*Markup!*", mode = "markup")
  expect_equal(out, "#eval(mode: \"markup\", \"*Markup!*\")")
  expect_true(out |> is_valid_typst())

  out <- panic("this is wrong")
  expect_equal(out, "#panic(\"this is wrong\")")

  out <- regex("\\d+")
  expect_equal(out, "#regex(\"\\d+\")")
  expect_true(out |> is_valid_typst())

  out <- repr("hello")
  expect_equal(out, "#repr(\"hello\")")
  expect_true(out |> is_valid_typst())

  out <- str_(10)
  expect_equal(out, "#str(10)")
  expect_true(out |> is_valid_typst())

  out <- symbol("a")
  expect_equal(out, "#symbol(\"a\")")
  expect_true(out |> is_valid_typst())

  out <- decimal("10")
  expect_equal(out, "#decimal(\"10\")")
  expect_true(out |> is_valid_typst())

  out <- type(14.7)
  expect_equal(out, "#type(14.7)")
  expect_true(out |> is_valid_typst())

  out <- version(1, 2, 3, 4)
  expect_equal(out, "#version(1, 2, 3, 4)")
  expect_true(out |> is_valid_typst())

  out <- version(c(1, 2, 3, 4))
  expect_equal(out, "#version((1, 2, 3, 4))")
  expect_true(out |> is_valid_typst())
})
