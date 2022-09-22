test_that("format functions", {
  expect_equal(
    format_digits(c(1,2), .digits =  4),
    c(1.0000, 2.0000)
  )
})
