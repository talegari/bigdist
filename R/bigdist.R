#' @name bigdist
#' @title Read or Create a distance matrix on disk
#' @description Computes distances via \code{\link[proxy]{dist}} and saves then
#'   as file-backed matrix(FBM) using \pkg{bigstatsr} package or connects
#'   existing FBM backup file on disk.
#' @param mat Numeric matrix. When missing, attempts to connect to existing
#'   backup file.
#' @param file Name of the backing file to be created or an existing backup
#'   file. Do not include trailing ".bk". See details for the backup file
#'   format.
#' @param method See method argument of \code{\link[proxy]{dist}}. This ignored
#'   when mat is missing.
#' @param type Storage type of FBM. See \code{\link[bigstatsr]{FBM}}. This
#'   ignored when mat is missing.
#' @param nproc Number of parallel processes via forking. See details. This
#'   ignored when mat is missing.
#' @return An object of class 'bigdist'.
#' @details bigdist class is a list where the key 'fbm' holds the FBM
#'   connection. The filename format is of the form <somename>_<size>_<type>.bk
#'   where size is the number of observations
#' @examples
#' set.seed(1)
#' amat <- matrix(rnorm(1e4), ncol = 10)
#' temp <- bigdist(mat = amat, file = "~/somefile")
#' temp
#' temp$fbm[1, 2]
#'
#' temp2 <- bigdist(file = "~/somefile_1000_float")
#' temp2
#' temp2$fbm[1,2]
#' unlink("~/somefile_1000_float.bk")
#' @export
bigdist <- function(mat
                    , file
                    , method = "euclidean"
                    , type   = "float"
                    , nproc  = 1
                    ){
  # assertions ----
  what <- ifelse(missing(mat), "read", "write")

  if(what == "write"){
    assertthat::assert_that(is.matrix(mat) && is.numeric(mat))
    file <- suppressWarnings(normalizePath(file))
    assertthat::assert_that(!file.exists(paste0(file, ".bk")))
    assertthat::assert_that(assertthat::is.writeable(dirname(file)))
    assertthat::assert_that(assertthat::is.string(type))
    assertthat::assert_that(type %in% c("integer", "float", "double"))
    assertthat::assert_that(assertthat::is.count(nproc))
  }

  if(what == "read"){
    assertthat::assert_that(file.exists(paste0(file, ".bk")))
    assertthat::assert_that(assertthat::is.readable(paste0(file, ".bk")))

    filenameSplit <- strsplit(file, "_")[[1]]
    size <- suppressWarnings(as.integer(utils::tail(filenameSplit, 2)[1]))
    type <- utils::tail(filenameSplit, 1)
    assertthat::assert_that(
      !is.na(size) && type %in% c("integer", "float", "double")
      , msg = "bigdist backup file name does not natch the expected format: <filename>_<size>_<type>.bk"
      )
  }

  # create a FBM ----
  if(what == "write"){
    size    <- nrow(mat)
    distmat <- bigstatsr::FBM(nrow          = size
                              , ncol        = size
                              , type        = type
                              , backingfile = paste(file, size, type, sep = "_")
                              , create_bk   = TRUE
                              )

    filename <- paste0(paste(file, size, type, sep = "_"), ".bk")
    message("----")
    message(paste0("Location: ", filename))
    message(paste0("Size on disk: "
                   , round(file.size(filename)/2^30, 2)
                   , " GB"
                   )
            )
    message("Computing distances ... ")

    # fill FBM in a loop
    pbmcapply::pbmclapply(1:(size - 1)
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
    message("Completed!")
    message("----")
  }

  if(what == "read"){
    distmat <- bigstatsr::FBM(nrow          = size
                              , ncol        = size
                              , type        = type
                              , backingfile = file
                              , create_bk   = FALSE
                              )
  }

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
