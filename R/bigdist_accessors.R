#' @name bigdist_size
#' @title Size of bigdist
#' @description Size of bigdist
#' @param x Object of class 'bigdist'
#' @export
bigdist_size <- function(x){
  assertthat::assert_that(inherits(x, "bigdist"))
  x[["fbm"]][["ncol"]]
}


#' @name bigdist_extract
#' @title Extract parts of bigdist
#' @description  Extract parts of bigdist
#' @param x Object of class 'bigdist'
#' @param i (integer vector) row positions
#' @param j (integer vector) column positions
#' @param k (integer vector) positions
#' @param product (string) One among: 'inner', 'outer'(default)
#' @return A matrix or vector of distances when product is 'outer' and 'inner'
#'   respectively
#' @details In k-mode, both i and j should be missing and k should not be
#'   missing. In ij-mode, k should be missing and both i and j are optional. If
#'   i or j are missing, they are interpreted as all values of i or j (similar
#'   to matrix or dataframe subsetting).
#' @export
bigdist_extract <- function(x, i, j, k, product = "outer"){

  # assertions ----
  assertthat::assert_that(inherits(x, "bigdist"))

  sz <- bigdist_size(x)

  if(!missing(k)){
    assertthat::assert_that(is_integerish(k) && all(k > 0))
    assertthat::assert_that(max(k) <= sz * (sz - 1)/2)
    # if k is present, both i and j should be missing
    if(!missing(i) || !missing(j)){
      stop("When k is provided, both i and j should be missing")
    }

    # convert k to i and j indices
    ijs     <- dist_k_ij(k, sz)
    i       <- ijs[1, ]
    j       <- ijs[2, ]
    product <- "inner"

  } else { # when k is missing
    if(!missing(i)){
      assertthat::assert_that(is_integerish(i) && all(i > 0))
      assertthat::assert_that(max(i) <= sz)
    } else {
      i <- 1:sz
    }

    if(!missing(j)){
      assertthat::assert_that(is_integerish(j) && all(j > 0))
      assertthat::assert_that(max(j) <= sz)
    } else {
      j <- 1:sz
    }
  }

  assertthat::assert_that(assertthat::is.string(product))
  assertthat::assert_that(product %in% c("outer", "inner"))

  # extraction ----
  if(product == "outer"){

    res <- x[["fbm"]][i, j]
    if(is.null(dim(res))){
      dim(res) <- c(length(i), length(j))
    }

  } else {
    res <- mapply(function(a, b) x[["fbm"]][a, b], i, j, SIMPLIFY = TRUE)
  }

  return(res)
}

#' @name bigdist_replace
#' @title Replace parts of bigdist
#' @description  Replace parts of bigdist
#' @param x Object of class 'bigdist'
#' @param i (integer vector) row positions
#' @param j (integer vector) column positions
#' @param k (integer vector) positions
#' @param value (integer/numeric vector) Values to replace
#' @details There are two modes to specify the positions:
#'
#'   \itemize{
#'
#'   \item ij-mode where i and j are specified and k is missing. If i or j are
#'   missing, they are interpreted as all values of i or j (similar to matrix or
#'   dataframe subsetting). Lengths of i, j are required to be same. If 'value'
#'   is singleton, then it is extended to the length of i or j. Else, 'value'
#'   should have same length as i or j.
#'
#'   \item k-mode where  k is present and both i and k are missing. k is the
#'   positions in the dist object. If 'value' is singleton, then it is extended
#'   to the length of k. Else, 'value' should have same length as k.
#'
#'   }
#'
#' @return bigdist object
#' @export
bigdist_replace <- function(x, i, j, value, k){

  # assertions ----
  assertthat::assert_that(inherits(x, "bigdist"))
  assertthat::assert_that(is.numeric(value))

  sz <- bigdist_size(x)

  if(!missing(k)){
    assertthat::assert_that(is_integerish(k) && all(k > 0))
    assertthat::assert_that(max(k) <= sz * (sz - 1)/2)
    # if k is present, both i and j should be missing
    if(!missing(i) || !missing(j)){
      stop("When k is provided, both i and j should be missing")
    }

    if(length(value) != 1){
      assertthat::assert_that(length(k) == length(value))
    }

    # convert k to i and j indices
    ijs     <- dist_k_ij(k, sz)
    i       <- ijs[1, ]
    j       <- ijs[2, ]

  } else { # when k is missing
    if(!missing(i)){
      assertthat::assert_that(is_integerish(i) && all(i > 0))
      assertthat::assert_that(max(i) <= sz)
    } else {
      i <- 1:sz
    }

    if(!missing(j)){
      assertthat::assert_that(is_integerish(j) && all(j > 0))
      assertthat::assert_that(max(j) <= sz)
    } else {
      j <- 1:sz
    }

    if(length(i) != 1 && length(j) != 1){
      assertthat::assert_that(length(i) == length(j))
    }
    if(length(i) != 1 && length(value) != 1){
      assertthat::assert_that(length(i) == length(value))
    }
  }

  # replace ----
  suppressWarnings(
    mapply(function(a, b, val) x[["fbm"]][a, b] <- val
           , i, j, value
           , SIMPLIFY = TRUE
           )
    )

  return(x)
}

#' @name bigdist_subset
#' @title Subset parts of bigdist
#' @description  Subset parts of bigdist
#' @param x Object of class 'bigdist'
#' @param index Indexes of the bigdist to be subset as a bigdist
#' @param file (string) Name of the backing file to be created. Do not include
#'   trailing ".bk". See details for the backup file format.
#' @details The filename format is of the form <somename>_<size>_<type>.bk where
#'   size is the number of observations and type is the data type like 'double',
#'   'float'.
#' @export
bigdist_subset <- function(x, index, file){

  assertthat::assert_that(inherits(x, "bigdist"))

  index <- unique(index)
  sz    <- x[["fbm"]][["ncol"]]
  type  <- names(x[["fbm"]][["type"]])

  assertthat::assert_that(is_integerish(index) && all(index) > 0)
  assertthat::assert_that(max(index) < sz)

  filename <- paste0(paste(file, length(index), type, sep = "_"), ".bk")

  assertthat::assert_that(!file.exists(filename))
  assertthat::assert_that(assertthat::is.writeable(dirname(filename)))


  xCopy <- bigstatsr::big_copy(
    x[["fbm"]]
    , ind.row     = index
    , ind.col     = index
    , type        = names(x[["fbm"]][["type"]])
    , backingfile = paste(file, length(index), type, sep = "_")
    )
  res <- structure(list(fbm = xCopy), class = "bigdist")

  return(res)
}
