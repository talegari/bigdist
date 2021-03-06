#' @name as_bigdist
#' @title Convert to bigdist
#' @description Generic to convert an object of class 'bigdist'
#' @param x Object coercible to bigdist
#' @param file File to write the 'bigdist' matrix
#' @param ... additional arguments
#' @return An object of class 'bigdist'
#' @details Writing distances to FBM can be parallelized by setting up a future
#'   backend
#' @examples
#' temp3 <- as_bigdist(dist(mtcars), file = file.path(tempdir(), "temp_ex4"))
#' temp3
#' @export
as_bigdist <- function(x, file, ...){
  UseMethod("as_bigdist", x)
}

#' @export
as_bigdist.dist <- function(x, file, ...){

  file <- suppressWarnings(normalizePath(file))
  assertthat::assert_that(!file.exists(paste0(file, ".bk")) &&
                            assertthat::is.writeable(dirname(file))
                          )
  size <- attr(x, "Size")

  # create a FBM
  distmat <- bigstatsr::FBM(
    nrow          = size
    , ncol        = size
    , type        = "double"
    , backingfile = paste(file, size, "double", sep = "_")
    , create_bk   = TRUE
    )
  filename <- paste0(paste(file, size, "double", sep = "_"), ".bk")
  message("----")
  message(paste0("Location: ", filename))
  message(paste0("Size on disk: "
                 , round(file.size(filename)/2^30, 2)
                 , " GB"
                 )
          )

  # iterate over columns of the dist
  assignValues <- function(i){

    values <- x[seq.int(colStartIndex(i, size), length.out = size - i)]
    bigstatsr::without_downcast_warning(
      distmat[(i + 1):size, i] <- values
    )
    bigstatsr::without_downcast_warning(
      distmat[i, (i + 1):size] <- values
    )
    return(NULL)
  }

  furrr::future_map(1:(size - 1)
                    , assignValues
                    , .progress = TRUE
                    )

  invisible(gc())

  message("completed!")
  message("----")
  return(structure(list(fbm = distmat), class = "bigdist"))
}

#' @name colStartIndex
#' @title Get the column start index
#' @description Get the index of the dist object corresponding to some column
#'   start in the symmetric form of the distance matrix
#' @param i Column number
#' @param size Size of the dist object
#' @return An index of dist object
#' @examples
#' colStartIndex(2, 10)
#' @export
colStartIndex <- compiler::cmpfun(
  function(i, size){
    as.integer(((i - 1) * size) - ((i - 1) * i/2) + 1L)
  }
  , options = list(optimize = 3)
  )
