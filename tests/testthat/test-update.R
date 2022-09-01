test_that("update functions", {
  expect_message(update_package())
  expect_equal(update_data(), list())
})

