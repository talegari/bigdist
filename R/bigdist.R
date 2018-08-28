#' @name dist
#' @title Create a distance matrix on disk
#' @description Computes distances via \code{\link[proxy]{dist}} and saves then
#'   as file-backed matrix using \pkg{bigstatsr} package. Unix based systems can
#'   use the fork based parallelism for faster computation with some tradeoff in
#'   memory usage. The distances are written in chunks to keep the memory usage
#'   at bay.
#' @param mat Numeric matrix
#' @param method See method argument of \code{\link[proxy]{dist}}
#' @param file Name of the backing file to be created
#' @param nproc Number of parallel processes via forking
#' @return An object of class 'bigdist'
#' @examples
#' dist_iris <- stats::dist(iris[, 1:4])
#' bigd <- dist(as.matrix(iris[, 1:4]), file = "iris_test")
#' all.equal(as.numeric(as.matrix(dist_iris)), as.numeric(bigd$fbm[]))
#' file.remove("iris_test.bk")
#' @export

dist <- function(mat
                 , method = "euclidean"
                 , file
                 , nproc = 1
                 ){

  begin_time <- Sys.time()

  assertthat::assert_that(is.matrix(mat) && is.numeric(mat))
  file <- suppressWarnings(normalizePath(file))
  assertthat::assert_that(!file.exists(paste0(file, ".bk")) && assertthat::is.writeable(dirname(file)))
  assertthat::assert_that(assertthat::is.count(nproc))

  size <- nrow(mat)

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
  message("Computing distances ... ", appendLF = FALSE)

  # fill FBM on a loop
  parallel::mclapply(1:(size - 1)
                     , function(i){
                        dists                    <- distIndex(i, mat, method, size)
                        distmat[i, (i + 1):size] <- dists
                        distmat[(i + 1):size, i] <- dists

                        return(NULL)
                        }
                     , mc.cores       = nproc
                     , mc.preschedule = FALSE
                     )
  invisible(gc())
  end_time  <- Sys.time()
  diff_time <- end_time - begin_time
  message(paste0("Completed! ( ", round(as.numeric(diff_time), 2), " ", attr(diff_time, "units"), " )"))

  return(structure(list(fbm = distmat), class = "bigdist"))
}


#' @name distIndex
#' @title Compute distance between a row and its subsequent rows
#' @description Computes distance between row i and rows i + 1, i + 2, ..., n
#'   where n is the total number of rows
#' @param i row index
#' @param mat numeric matrix
#' @param method method is passed to \code{\link[proxy]{dist}}
#' @param size Number of rows of mat
#' @return (numeric vector) Vector of n - i distances where n is the total
#'   number of rows
distIndex <- function(i, mat, method, size){

  x <- matrix(mat[i, ], nrow = 1)
  y <- mat[(i + 1):size, ]
  if(is.null(dim(y))){
    y <- matrix(y, nrow = 1)
  }

  distances      <- unclass(proxy::dist(x, y, method))
  dim(distances) <- NULL

  return(distances)
}