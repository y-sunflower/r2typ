test_that("Advanced example 1", {
  c(
    set_text(purple),
    set_circle(width = percent(50)),
    align(
      center + horizon,
      circle(
        fill = aqua,
        stroke = pt(5) + red,
        align(
          right,
          text(
            font = "Roboto",
            size = em(1.2),
            "My favorite food is cookies!"
          )
        )
      )
    )
  ) |>
    typst_write() |>
    typst_compile(output = "here.pdf")

  expect_true(file.exists("here.pdf"))
  unlink("here.pdf")
})
