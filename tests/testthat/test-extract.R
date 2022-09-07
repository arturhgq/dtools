test_that("extract functions", {
  c("a,.1.,b2,.c3") -> string
  expect_equal(extract_numbers(string), c("123"))
})
