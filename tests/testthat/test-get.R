test_that("get functions", {
  data.frame(
    var1 = c(1,2,3,4,5),
    var2 = c(1,2,3,4,5)
  ) -> df
  expect_equal(get_index(df, var1), 1)
  expect_equal(get_varname(df, 1), "var1")
})
