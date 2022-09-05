test_that("get functions", {
  data.frame(
    var1 = c(1,2,3,4,5),
    var2 = c(1,2,3,4,5)
  ) -> df

  tibble::tibble(
    names = c("var1", "var2")
  ) -> df_names

  expect_equal(get_index(df, var1), 1)
  expect_equal(get_varname(df, 1), "var1")
  expect_equal(get_colnames(df), df_names)
})
