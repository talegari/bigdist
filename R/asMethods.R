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

#' @name as_bigdist.dist
#' @title Convert 'dist' to 'bigdist'
#' @description Method to convert an object of class 'dist' to class 'bigdist'
#' @param x Object of class 'dist'
#' @param file File to write the 'bigdist' matrix
#' @param nproc Number of parallel processes via forking
#' @param ... additional arguments
#' @return An object of class 'bigdist'
#' @examples
#' dist_iris <- stats::dist(iris[, 1:4])
#' bigd <- as_bigdist(dist_iris, "iris_test2")
#' all.equal(as.numeric(as.matrix(dist_iris)), as.numeric(bigd$fbm[]))
#' file.remove("iris_test2.bk")
#' @export

as_bigdist.dist <- function(x, file, nproc = 1, ...){

  begin_time <- Sys.time()

  size <- attr(x, "Size")
  file <- suppressWarnings(normalizePath(file))
  assertthat::assert_that(!file.exists(paste0(file, ".bk")) &&
                            assertthat::is.writeable(dirname(file))
                          )
  assertthat::assert_that(assertthat::is.count(nproc))

  # create a FBM
  distmat <- bigstatsr::FBM(nrow           = size
                             , ncol        = size
                             , type        = "double"
                             , backingfile = file
                             , create_bk   = TRUE
                             )
  message(paste0("Location: ", paste0(file, ".bk")))
  message(paste0("Size on disk: "
                 , round(file.size(paste0(file, ".bk"))/2^30, 2)
                 , " GB"
                 )
          )
  message("Copying distances ... ", appendLF = FALSE)

  # write to FBM from columns of dist
  subdiags <- 1L + cumsum(as.integer(c(0, seq.int(size - 1, 2, -1))))
  bottoms  <- (size - 1L) + cumsum(as.integer(c(0, seq.int(size - 2, 1, -1))))

  assign_column <- function(i){
    dists                    <- x[subdiags[i]:bottoms[i]]
    distmat[(i + 1):size, i] <- dists
    distmat[i, (i + 1):size] <- dists

    return(NULL)
  }

  parallel::mclapply(1:length(subdiags)
                     , assign_column
                     , mc.cores       = nproc
                     , mc.preschedule = FALSE
                     )

  invisible(gc())
  end_time  <- Sys.time()
  diff_time <- end_time - begin_time
  message(paste0("Completed! ( ", round(as.numeric(diff_time), 2), " ", attr(diff_time, "units"), " )"))

  return( structure(list(fbm = distmat), class = "bigdist") )
}
