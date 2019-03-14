testthat::context("test_accessors")
library("bigdist")

set.seed(1)
amat <- matrix(rnorm(1e3), ncol = 10)
td   <- tempdir()
file.remove(file.path(td, grep(".*\\.bk$", list.files(td), value = TRUE)))
temp <- bigdist(mat = amat, file = file.path(td, "tempfile"))

test_that("accessors should always return a matrix", {
  testthat::expect_is(bigdist_extract(temp, 1, 2)     , "matrix")
  testthat::expect_is(bigdist_extract(temp, 1:10, 2)  , "matrix")
  testthat::expect_is(bigdist_extract(temp, 1, 2:10)  , "matrix")
  testthat::expect_is(bigdist_extract(temp, 1:5, 2:10), "matrix")
})

test_that("accessors should handle empty ij", {
  # empty j
  testthat::expect_equal(dim(bigdist_extract(temp, 1, ))
                         ,  c(1, bigdist_size(temp))
                         )
  # empty i
  testthat::expect_equal(dim(bigdist_extract(temp, , 1))
                         , c(bigdist_size(temp), 1)
                         )
  # empty i and j
  testthat::expect_equal(dim(bigdist_extract(temp))
                         , c(bigdist_size(temp), bigdist_size(temp))
                         )
})

file.remove(file.path(td, grep(".*\\.bk$", list.files(td), value = TRUE)))