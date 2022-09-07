test_that("collapse functions", {
  data.frame(
    var1 = c(1,1,1,3),
    var2 = c(1,2,2,2),
    group1 = c(1,2,2,2)
  ) -> df
  expect_equal(
    collapse_duplicates(df, group1),
    tibble::tibble(
      group1 = c("1","2"),
      var1 = c("1", "1; 3"),
      var2 = c("1", "2")
    )
  )
})
