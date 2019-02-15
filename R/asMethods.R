#' @name as_bigdist
#' @title Convert to bigdist
#' @description Generic to convert an object of class 'bigdist'
#' @param x Object coercible to bigdist
#' @param file File to write the 'bigdist' matrix
#' @param nproc Number of parallel processes via forking
#' @param ... additional arguments
#' @return An object of class 'bigdist'
#' @export
as_bigdist <- function(x, file, nproc, ...){
  UseMethod("as_bigdist", x)
}


as_bigdist.dist <- function(x, file, nproc = 1, ...){

  file <- suppressWarnings(normalizePath(file))
  assertthat::assert_that(!file.exists(paste0(file, ".bk")) &&
                            assertthat::is.writeable(dirname(file))
                          )
  size <- attr(x, "Size")

  # create a FBM
  distmat <- bigstatsr::FBM(nrow           = size
                             , ncol        = size
                             , type        = "double"
                             , backingfile = paste(file, size, sep = "_")
                             , create_bk   = TRUE
                             )
  filename <- paste0(paste(file, size, sep = "_"), ".bk")
  message("----")
  message(paste0("Location: ", filename))
  message(paste0("Size on disk: "
                 , round(file.size(filename)/2^30, 2)
                 , " GB"
  )
  )

  # iterate over columns of the dist
  assignValues <- function(i){
    values                   <- x[seq.int(colStartIndex(i, size), length.out = size - i)]
    distmat[(i + 1):size, i] <- values
    distmat[i, (i + 1):size] <- values

    return(NULL)
  }

  pbmcapply::pbmclapply(1:(size - 1)
                        , assignValues
                        , mc.cores = nproc
                        , mc.preschedule = FALSE
                        )

  invisible(gc())

  message("completed!")
  message("----")
  return(structure(list(fbm = distmat), class = "bigdist"))
}

colStartIndex <- compiler::cmpfun(
  function(i, size){
    as.integer(((i - 1) * size) - ((i - 1) * i/2) + 1L)
  }
  , options = list(optimize = 3)
  )
