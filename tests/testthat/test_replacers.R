testthat::context("test_replacers")
library("bigdist")

set.seed(1)
amat <- matrix(rnorm(1e3), ncol = 10)
td   <- tempdir()
temp <- bigdist(mat = amat, file = file.path(td, "temp_ex11"))

test_that("should always write in inner form", {
  # returns bigdist object after replacement
  testthat::expect_equal(bigdist_replace(temp, 1, 2, 100), temp)
  # inner type replacement singleton
  testthat::expect_equal(bigdist_replace(temp, 1:2, 3:4, 101), temp)
  # inner type replacement of expected length
  testthat::expect_equal(bigdist_replace(temp, 1:2, 3:4, 102:103), temp)
  # replacement (length mismatch in i and j)
  testthat::expect_error(bigdist_replace(temp, 1:2, 3:5, 101))
  # replacement (length mismatch in value)
  testthat::expect_error(bigdist_replace(temp, 1:2, 3:4, 102:104))
})
