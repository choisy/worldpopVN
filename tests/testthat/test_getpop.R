context("getpop")

test_that("`getpop` returns error correctly", {
  expect_error(getpop(1999))
})
