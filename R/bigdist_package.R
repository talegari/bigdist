#' @name package_bigdist
#' @title Package: bigdist
#' @aliases package_bigdist
#' @description bigdist package facilitates storing distance matrices on disk as
#'   'file-backed matrix' (FBM) using \pkg{bigstatsr} package. The FBM stores a
#'   symmetric matrix. Each distance is stored as a 'float/double' approximately
#'   requiring 4 or 8 bytes. The resulting file size will approximately be $8 *
#'   size^2$ where size is nrow/ncol of the data matrix. Working with bigdist
#'   package requires working knowledge of \pkg{bigstatsr} package.
#'
#'   \itemize{
#'
#'   \item bigdist: (function) Create  or connect to distance matrix on disk.
#'
#'   \item as_bigdist: (method) Convert to 'bigdist' class.
#'
#'   }
#'
#'   \pkg{disto} package provides a unified interface to distance matrices
#'   in-memory (class 'dist') or on disk (class 'bigdist').
"_PACKAGE"