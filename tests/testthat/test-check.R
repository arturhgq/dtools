
test_that(
  "Check `check_r_pipe` message",
  {
    expect_message(check_r_pipe(), "This R version contain the native pipe.")
  }
)

