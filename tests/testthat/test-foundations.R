test_that("Test foundations functions", {
  out <- bytes(c(1, 2, 3))
  expect_equal(out, "#bytes((1, 2, 3))")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- bytes(list(1, 2, 3))
  expect_equal(out, "#bytes((1, 2, 3))")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- bytes("hey")
  expect_equal(out, "#bytes(\"hey\")")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- datetime(year = 2012, month = 8, day = 3)
  expect_equal(out, "#datetime(year: 2012, month: 8, day: 3)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- text(
    costs = list(hyphenation = percent(100), runt = percent(100)),
    "hey"
  )
  expect_equal(out, "#text(costs: (hyphenation: 100%, runt: 100%))[hey]")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- duration(days = 3, hours = 12)
  expect_equal(out, "#duration(days: 3, hours: 12)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- eval_("*Markup!*", mode = "markup")
  expect_equal(out, "#eval(mode: \"markup\", \"*Markup!*\")")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- panic("this is wrong")
  expect_equal(out, "#panic(\"this is wrong\")")

  out <- regex("\\d+")
  expect_equal(out, "#regex(\"\\d+\")")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- repr("hello")
  expect_equal(out, "#repr(\"hello\")")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- str_(10)
  expect_equal(out, "#str(10)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- symbol("a")
  expect_equal(out, "#symbol(\"a\")")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- decimal("10")
  expect_equal(out, "#decimal(\"10\")")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- type(14.7)
  expect_equal(out, "#type(14.7)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- version(1, 2, 3, 4)
  expect_equal(out, "#version(1, 2, 3, 4)")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))

  out <- version(c(1, 2, 3, 4))
  expect_equal(out, "#version((1, 2, 3, 4))")
  expect_true(out |> is_valid_typst(error_on_failure = TRUE))
})
