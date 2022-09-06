test_that("list functions", {
  list(
    obj1 = mtcars,
    obj2 = mtcars
  ) -> list1

  list(
    mtcars,
    airmiles
  ) -> list2

  expect_equal(
    list_select(list1, "obj1"),
    list1["obj1"]
  )
  expect_equal(
    list_select(list2, 1),
    list2[1]
  )
  expect_equal(
    list_remove(list1, "obj1"),
    list1["obj2"]
  )
  expect_equal(
    list_remove(list2, 1),
    list2[2]
  )
})
