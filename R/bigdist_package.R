#' @name bigdist-package
#' @title Package: bigdist
#' @description bigdist package facilitates storing distance matrices on disk as
#'   'file-backed matrix' (FBM) using \pkg{bigstatsr} package. The FBM stores a
#'   symmetric matrix. Each distance is stored as a 'double' approximately
#'   requiring 8 bytes. The resulting file size will approximately be $8 *
#'   size^2$ where size is nrow/ncol of the data matrix.
#'
#'   \itemize{
#'
#'   \item dist: (function) Create distance matrix on disk.
#'
#'   \item as_bigdist: (method) Convert 'dist' to 'bigdist'.
#'
#'   }
#'
#'   \pkg{disto} package provides a unified interface to distance matrices
#'   in-memory (class 'dist') or on disk (class 'bigdist').
"_PACKAGE"