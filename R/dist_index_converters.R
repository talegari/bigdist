is_integerish <- getFromNamespace(x = "is.integerish", ns = "assertthat")

#' @name dist_ij_k_
#' @title Convert ij index to k index
#' @description Convert ij index to k index for a dist object
#' @param i row index
#' @param j column index
#' @param size value of size attribute of the dist object
#' @return k index
dist_ij_k_ <- compiler::cmpfun(
  function(i, j, size){

    if(i == j){
      NA_integer_
    }
    else if(i < j){

      size*(i-1) - i*(i-1)/2 + j-i

    } else {

      size*(j-1) - j*(j-1)/2 + i-j
    }
  }
  , options = list(optimize = 3)
)

#' @name dist_ij_k
#' @title Vectorized version of dist_ij_k_
#' @description Convert ij indexes to k indexes for a dist object
#' @param i row indexes
#' @param j column indexes
#' @param size value of size attribute of the dist object
#' @return k indexes
dist_ij_k <- compiler::cmpfun(
  Vectorize(dist_ij_k_, vectorize.args = c("i", "j"))
  , options = list(optimize = 3)
)

#' @name dist_k_ij_
#' @title Convert kth index to ij index
#' @description Convert kth index to ij index of a dist object
#' @param k kth index
#' @param size value of size attribute of the dist object
#' @return ij index as a length two integer vector
dist_k_ij_ <- compiler::cmpfun(function(k, size){
  sums <- cumsum(seq(size - 1, 1, -1))
  j    <- Position(function(x) x >= k, sums)
  i    <- size - sums[j] + k

  return(c(i, j))
})

#' @name dist_k_ij
#' @title Vectorized version of dist_k_ij_
#' @description Convert kth indexes to ij indexes of a dist object
#' @param k kth indexes
#' @param size value of size attribute of the dist object
#' @return ij indexes as 2*n matrix where n is length of k vector
dist_k_ij <- compiler::cmpfun(
  Vectorize(dist_k_ij_, vectorize.args = c("k", "size"))
  , options = list(optimize = 3)
)