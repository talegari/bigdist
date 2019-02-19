bigdist
=======

bigdist package facilitates storing distance matrices on disk as 'file-backed matrix' (FBM) using [bigstatsr](https://cran.r-project.org/package=bigstatsr) package. The FBM stores a symmetric matrix. Each distance is stored as a 'float/double' approximately requiring 4 or 8 bytes. The resulting file size will approximately be 4 or 8 \* size^2 where size is nrow/ncol of the data matrix. Working with bigdist object requires working knowledge of bigstatsr package.

[disto](https://cran.r-project.org/package=disto) package provides a unified interface to distance matrices in-memory (class 'dist') or on disk (class 'bigdist').

Installation
------------

You can install bigdist from github with:

``` r
# install.packages("devtools")
devtools::install_github("talegari/bigdist")
```

Functionality
-------------

``` r
library("bigdist")

# create a random matrix
set.seed(1)
amat <- matrix(rnorm(1e4), ncol = 10)
td   <- tempdir()
dir.create(td)
#> Warning in dir.create(td): '/tmp/RtmpGJ6Yae' already exists

# create a bigdist object with FBM(fle-baked matrix) on disk
temp <- bigdist(mat = amat, file = file.path(td, "tempfile"))
#> ----
#> Location: /tmp/RtmpGJ6Yae/tempfile_1000_float.bk
#> Size on disk: 0 GB
#> Computing distances ...
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.09393 -> 4.09393)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.09393 -> 4.09393)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.12981 -> 5.12981)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.12981 -> 5.12981)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.28062 -> 6.28062)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.28062 -> 6.28062)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.93986 -> 3.93986)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.93986 -> 3.93986)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.1571 -> 5.1571)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.1571 -> 5.1571)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.88046 -> 4.88046)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.88046 -> 4.88046)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.32243 -> 6.32243)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.32243 -> 6.32243)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.21672 -> 4.21672)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.21672 -> 4.21672)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.86749 -> 3.86749)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.86749 -> 3.86749)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.62694 -> 4.62694)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.62694 -> 4.62694)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.93023 -> 2.93023)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.93023 -> 2.93023)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15447 -> 4.15447)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15447 -> 4.15447)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4259 -> 4.4259)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4259 -> 4.4259)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.86248 -> 5.86248)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.86248 -> 5.86248)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.86412 -> 3.86413)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.86412 -> 3.86413)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.37643 -> 3.37643)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.37643 -> 3.37643)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05176 -> 5.05176)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05176 -> 5.05176)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.77364 -> 4.77364)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.77364 -> 4.77364)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.99298 -> 3.99298)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.99298 -> 3.99298)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4541 -> 4.4541)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4541 -> 4.4541)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.65989 -> 3.65989)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.65989 -> 3.65989)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.60143 -> 3.60143)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.60143 -> 3.60143)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.68624 -> 4.68624)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.68624 -> 4.68624)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.70601 -> 4.70601)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.70601 -> 4.70601)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.34329 -> 4.34329)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.34329 -> 4.34329)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.89421 -> 3.89421)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.89421 -> 3.89421)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.28658 -> 4.28658)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.28658 -> 4.28658)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.82703 -> 4.82703)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.82703 -> 4.82703)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.22067 -> 4.22067)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.22067 -> 4.22067)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.86466 -> 4.86466)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.86466 -> 4.86466)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.68439 -> 4.68439)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.68439 -> 4.68439)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.99808 -> 4.99808)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.99808 -> 4.99808)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.25827 -> 2.25827)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.25827 -> 2.25827)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.24862 -> 3.24862)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.24862 -> 3.24862)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.30723 -> 2.30723)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.30723 -> 2.30723)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.06046 -> 3.06046)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.06046 -> 3.06046)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.95253 -> 4.95253)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.95253 -> 4.95253)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.99048 -> 4.99048)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.99048 -> 4.99048)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.0205 -> 4.0205)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.0205 -> 4.0205)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.95994 -> 2.95994)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.95994 -> 2.95994)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.72729 -> 2.72729)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.72729 -> 2.72729)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.15371 -> 5.15372)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.15371 -> 5.15372)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.49999 -> 5.49999)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.49999 -> 5.49999)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.3148 -> 5.3148)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.3148 -> 5.3148)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.39923 -> 4.39923)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.39923 -> 4.39923)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.93229 -> 3.93229)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.93229 -> 3.93229)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.09657 -> 4.09657)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.09657 -> 4.09657)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.89112 -> 4.89112)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.89112 -> 4.89112)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.11082 -> 6.11082)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.11082 -> 6.11082)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.73637 -> 4.73637)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.73637 -> 4.73637)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.9075 -> 5.9075)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.9075 -> 5.9075)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90281 -> 4.90281)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90281 -> 4.90281)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.57547 -> 4.57547)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.57547 -> 4.57547)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.59245 -> 4.59245)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.59245 -> 4.59245)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15728 -> 4.15728)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15728 -> 4.15728)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.42801 -> 5.42801)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.42801 -> 5.42801)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.69099 -> 3.69099)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.69099 -> 3.69099)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.73245 -> 4.73245)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.73245 -> 4.73245)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.87935 -> 3.87935)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.87935 -> 3.87935)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.4223 -> 5.4223)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.4223 -> 5.4223)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.75142 -> 5.75142)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.75142 -> 5.75142)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.02488 -> 4.02488)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.02488 -> 4.02488)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.43479 -> 4.43479)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.43479 -> 4.43479)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.69299 -> 3.69299)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.69299 -> 3.69299)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.32069 -> 3.32069)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.32069 -> 3.32069)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.17871 -> 4.17871)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.17871 -> 4.17871)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.6632 -> 5.6632)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.6632 -> 5.6632)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.46456 -> 3.46456)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.46456 -> 3.46456)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.20335 -> 3.20335)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.20335 -> 3.20335)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.04532 -> 4.04532)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.04532 -> 4.04532)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.30425 -> 4.30425)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.30425 -> 4.30425)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.48718 -> 3.48718)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.48718 -> 3.48718)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.56046 -> 3.56046)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.56046 -> 3.56046)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.23573 -> 3.23573)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.23573 -> 3.23573)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.88476 -> 4.88476)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.88476 -> 4.88476)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.2734 -> 4.2734)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.2734 -> 4.2734)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.68152 -> 3.68152)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.68152 -> 3.68152)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.63271 -> 3.63271)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.63271 -> 3.63271)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.0426 -> 4.0426)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.0426 -> 4.0426)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.99174 -> 2.99174)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.99174 -> 2.99174)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.47855 -> 3.47855)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.47855 -> 3.47855)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.85972 -> 4.85972)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.85972 -> 4.85972)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.59997 -> 4.59997)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.59997 -> 4.59997)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.13869 -> 5.13869)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.13869 -> 5.13869)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.34157 -> 5.34157)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.34157 -> 5.34157)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41784 -> 4.41784)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41784 -> 4.41784)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.20662 -> 4.20662)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.20662 -> 4.20662)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.48303 -> 2.48303)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.48303 -> 2.48303)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.64149 -> 3.64149)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.64149 -> 3.64149)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80369 -> 4.80369)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80369 -> 4.80369)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.84381 -> 3.84381)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.84381 -> 3.84381)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.21452 -> 4.21452)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.21452 -> 4.21452)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.68731 -> 2.68731)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.68731 -> 2.68731)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.03937 -> 3.03937)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.03937 -> 3.03937)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.49451 -> 5.49451)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.49451 -> 5.49451)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.92327 -> 6.92327)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.92327 -> 6.92327)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.11305 -> 5.11305)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.11305 -> 5.11305)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.63371 -> 3.63371)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.63371 -> 3.63371)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.74543 -> 2.74543)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.74543 -> 2.74543)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.60143 -> 2.60143)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.60143 -> 2.60143)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.89792 -> 2.89792)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.89792 -> 2.89792)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.53854 -> 5.53854)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.53854 -> 5.53854)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.79683 -> 3.79683)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.79683 -> 3.79683)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (1.87454 -> 1.87454)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (1.87454 -> 1.87454)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.64371 -> 3.64371)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.64371 -> 3.64371)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.30621 -> 4.30621)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.30621 -> 4.30621)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.7466 -> 4.7466)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.7466 -> 4.7466)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.24589 -> 5.24589)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.24589 -> 5.24589)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.47291 -> 3.47291)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.47291 -> 3.47291)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.17616 -> 3.17616)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.17616 -> 3.17616)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.27593 -> 3.27593)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.27593 -> 3.27593)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.21018 -> 3.21018)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.21018 -> 3.21018)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.08328 -> 4.08328)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.08328 -> 4.08328)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.97799 -> 5.97799)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.97799 -> 5.97799)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.95864 -> 4.95864)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.95864 -> 4.95864)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.42886 -> 5.42886)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.42886 -> 5.42886)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.14981 -> 4.14981)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.14981 -> 4.14981)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.58331 -> 2.58331)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.58331 -> 2.58331)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.58069 -> 4.58069)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.58069 -> 4.58069)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.11116 -> 4.11116)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.11116 -> 4.11116)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.22911 -> 4.22911)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.22911 -> 4.22911)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.47676 -> 3.47676)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.47676 -> 3.47676)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.8071 -> 2.8071)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.8071 -> 2.8071)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.19203 -> 4.19203)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.19203 -> 4.19203)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.19144 -> 4.19144)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.19144 -> 4.19144)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.0351 -> 3.0351)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.0351 -> 3.0351)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.71023 -> 5.71023)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.71023 -> 5.71023)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51363 -> 4.51363)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51363 -> 4.51363)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.96195 -> 4.96195)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.96195 -> 4.96195)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.41705 -> 3.41705)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.41705 -> 3.41705)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.71519 -> 4.71519)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.71519 -> 4.71519)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.66723 -> 3.66723)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.66723 -> 3.66723)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.87247 -> 3.87247)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.87247 -> 3.87247)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51274 -> 4.51274)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51274 -> 4.51274)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.75453 -> 3.75453)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.75453 -> 3.75453)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.37458 -> 5.37458)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.37458 -> 5.37458)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.59991 -> 3.59991)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.59991 -> 3.59991)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.0821 -> 5.0821)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.0821 -> 5.0821)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.02823 -> 3.02823)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.02823 -> 3.02823)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.71339 -> 4.71339)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.71339 -> 4.71339)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.13752 -> 4.13752)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.13752 -> 4.13752)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.13782 -> 7.13782)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.13782 -> 7.13782)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.13986 -> 5.13986)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.13986 -> 5.13986)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.25681 -> 4.25681)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.25681 -> 4.25681)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15897 -> 4.15897)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15897 -> 4.15897)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.37763 -> 5.37763)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.37763 -> 5.37763)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.02781 -> 6.02781)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.02781 -> 6.02781)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.74006 -> 3.74006)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.74006 -> 3.74006)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.79126 -> 4.79126)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.79126 -> 4.79126)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.35626 -> 3.35626)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.35626 -> 3.35626)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.301 -> 6.301)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.301 -> 6.301)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.3916 -> 3.3916)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.3916 -> 3.3916)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.54184 -> 3.54184)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.54184 -> 3.54184)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.06941 -> 5.06941)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.06941 -> 5.06941)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.09015 -> 4.09015)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.09015 -> 4.09015)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.97299 -> 5.97299)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.97299 -> 5.97299)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96579 -> 3.96579)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96579 -> 3.96579)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.51656 -> 2.51656)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.51656 -> 2.51656)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.89864 -> 4.89864)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.89864 -> 4.89864)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.85335 -> 4.85335)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.85335 -> 4.85335)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.32295 -> 3.32295)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.32295 -> 3.32295)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.53898 -> 3.53898)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.53898 -> 3.53898)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.3133 -> 5.3133)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.3133 -> 5.3133)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.39914 -> 5.39914)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.39914 -> 5.39914)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.92117 -> 5.92117)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.92117 -> 5.92117)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.99317 -> 4.99317)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.99317 -> 4.99317)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90784 -> 4.90784)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90784 -> 4.90784)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.56655 -> 3.56655)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.56655 -> 3.56655)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.67068 -> 3.67068)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.67068 -> 3.67068)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.24283 -> 5.24283)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.24283 -> 5.24283)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.93566 -> 3.93566)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.93566 -> 3.93566)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.10255 -> 4.10255)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.10255 -> 4.10255)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.04962 -> 5.04962)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.04962 -> 5.04962)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.58594 -> 4.58595)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.58594 -> 4.58595)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.64475 -> 3.64475)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.64475 -> 3.64475)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.0121 -> 3.0121)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.0121 -> 3.0121)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.43009 -> 4.43009)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.43009 -> 4.43009)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.55093 -> 4.55093)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.55093 -> 4.55093)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.62374 -> 3.62374)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.62374 -> 3.62374)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.25638 -> 4.25638)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.25638 -> 4.25638)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.47295 -> 4.47295)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.47295 -> 4.47295)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.24141 -> 3.24141)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.24141 -> 3.24141)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.09823 -> 3.09823)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.09823 -> 3.09823)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24834 -> 4.24834)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24834 -> 4.24834)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.88126 -> 4.88126)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.88126 -> 4.88126)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.31122 -> 5.31122)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.31122 -> 5.31122)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.25911 -> 5.25911)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.25911 -> 5.25911)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.30808 -> 5.30808)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.30808 -> 5.30808)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.60816 -> 4.60816)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.60816 -> 4.60816)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90715 -> 4.90715)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90715 -> 4.90715)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.32892 -> 3.32892)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.32892 -> 3.32892)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.03189 -> 3.03189)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.03189 -> 3.03189)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.64378 -> 3.64378)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.64378 -> 3.64378)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.84818 -> 5.84818)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.84818 -> 5.84818)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.39852 -> 6.39852)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.39852 -> 6.39852)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.77019 -> 3.77019)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.77019 -> 3.77019)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.3156 -> 5.3156)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.3156 -> 5.3156)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.57495 -> 3.57495)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.57495 -> 3.57495)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.75004 -> 4.75004)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.75004 -> 4.75004)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.39273 -> 2.39273)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.39273 -> 2.39273)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.14333 -> 5.14333)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.14333 -> 5.14333)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.57752 -> 7.57752)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.57752 -> 7.57752)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.80672 -> 5.80672)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.80672 -> 5.80672)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.10412 -> 5.10412)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.10412 -> 5.10412)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.50734 -> 6.50734)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.50734 -> 6.50734)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.04379 -> 4.04379)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.04379 -> 4.04379)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.35403 -> 4.35403)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.35403 -> 4.35403)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.66474 -> 2.66474)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.66474 -> 2.66474)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.12823 -> 3.12823)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.12823 -> 3.12823)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.85469 -> 4.85469)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.85469 -> 4.85469)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.85587 -> 5.85587)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.85587 -> 5.85587)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.06557 -> 5.06557)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.06557 -> 5.06557)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.18707 -> 3.18707)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.18707 -> 3.18707)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.65607 -> 4.65607)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.65607 -> 4.65607)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.52719 -> 7.52719)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.52719 -> 7.52719)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.30293 -> 6.30293)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.30293 -> 6.30293)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.55677 -> 4.55677)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.55677 -> 4.55677)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.5597 -> 4.5597)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.5597 -> 4.5597)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.71428 -> 4.71428)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.71428 -> 4.71428)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.24245 -> 3.24245)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.24245 -> 3.24245)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.78341 -> 4.78341)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.78341 -> 4.78341)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.39226 -> 2.39226)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.39226 -> 2.39226)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24455 -> 4.24454)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24455 -> 4.24454)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.71113 -> 3.71113)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.71113 -> 3.71113)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.73941 -> 3.73941)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.73941 -> 3.73941)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.74113 -> 3.74113)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.74113 -> 3.74113)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.98984 -> 2.98984)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.98984 -> 2.98984)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.97154 -> 4.97154)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.97154 -> 4.97154)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31075 -> 4.31075)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31075 -> 4.31075)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.08888 -> 3.08888)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.08888 -> 3.08888)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.30836 -> 3.30836)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.30836 -> 3.30836)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.90738 -> 3.90738)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.90738 -> 3.90738)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.27201 -> 3.27201)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.27201 -> 3.27201)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.71831 -> 3.71831)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.71831 -> 3.71831)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.60539 -> 4.60539)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.60539 -> 4.60539)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.92187 -> 2.92187)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.92187 -> 2.92187)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.28611 -> 4.28611)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.28611 -> 4.28611)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.95043 -> 4.95043)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.95043 -> 4.95043)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.20604 -> 4.20604)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.20604 -> 4.20604)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.10213 -> 4.10213)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.10213 -> 4.10213)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.52123 -> 4.52123)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.52123 -> 4.52123)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.80818 -> 5.80818)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.80818 -> 5.80818)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.37957 -> 3.37957)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.37957 -> 3.37957)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15012 -> 4.15012)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15012 -> 4.15012)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.87581 -> 5.87581)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.87581 -> 5.87581)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.46254 -> 5.46254)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.46254 -> 5.46254)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.03015 -> 5.03015)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.03015 -> 5.03015)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.01951 -> 5.01951)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.01951 -> 5.01951)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.92324 -> 2.92324)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.92324 -> 2.92324)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.9222 -> 3.9222)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.9222 -> 3.9222)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.63375 -> 4.63375)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.63375 -> 4.63375)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.78526 -> 4.78526)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.78526 -> 4.78526)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.93682 -> 2.93682)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.93682 -> 2.93682)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4431 -> 4.4431)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4431 -> 4.4431)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.30813 -> 3.30813)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.30813 -> 3.30813)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.00433 -> 5.00433)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.00433 -> 5.00433)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.55408 -> 3.55408)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.55408 -> 3.55408)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.2933 -> 2.2933)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.2933 -> 2.2933)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.06265 -> 4.06265)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.06265 -> 4.06265)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.26427 -> 4.26427)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.26427 -> 4.26427)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.76635 -> 5.76635)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.76635 -> 5.76635)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.3499 -> 4.3499)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.3499 -> 4.3499)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41795 -> 4.41795)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41795 -> 4.41795)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.4676 -> 5.4676)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.4676 -> 5.4676)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.55495 -> 5.55495)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.55495 -> 5.55495)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.95779 -> 2.95779)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.95779 -> 2.95779)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.62272 -> 4.62272)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.62272 -> 4.62272)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.45358 -> 2.45358)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.45358 -> 2.45358)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.89376 -> 4.89376)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.89376 -> 4.89376)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.59192 -> 4.59192)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.59192 -> 4.59192)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.28656 -> 3.28656)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.28656 -> 3.28656)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.75536 -> 5.75536)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.75536 -> 5.75536)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.69714 -> 5.69714)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.69714 -> 5.69714)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.21309 -> 5.21309)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.21309 -> 5.21309)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.97629 -> 2.97629)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.97629 -> 2.97629)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.70011 -> 5.70011)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.70011 -> 5.70011)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.96793 -> 4.96793)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.96793 -> 4.96793)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.57603 -> 3.57603)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.57603 -> 3.57603)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.79915 -> 3.79915)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.79915 -> 3.79915)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.46933 -> 4.46933)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.46933 -> 4.46933)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.75733 -> 3.75733)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.75733 -> 3.75733)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.32464 -> 4.32464)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.32464 -> 4.32464)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.56822 -> 4.56822)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.56822 -> 4.56822)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.99969 -> 4.99969)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.99969 -> 4.99969)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.16351 -> 5.16351)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.16351 -> 5.16351)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.54933 -> 3.54933)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.54933 -> 3.54933)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.33634 -> 4.33634)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.33634 -> 4.33634)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.01576 -> 4.01576)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.01576 -> 4.01576)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.12587 -> 4.12587)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.12587 -> 4.12587)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.95519 -> 4.95519)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.95519 -> 4.95519)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51714 -> 4.51714)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51714 -> 4.51714)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.3878 -> 3.3878)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.3878 -> 3.3878)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.7404 -> 5.7404)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.7404 -> 5.7404)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.72829 -> 5.72829)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.72829 -> 5.72829)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.42999 -> 5.42999)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.42999 -> 5.42999)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.20713 -> 3.20712)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.20713 -> 3.20712)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.33101 -> 4.33101)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.33101 -> 4.33101)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.62249 -> 4.62249)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.62249 -> 4.62249)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.31245 -> 3.31245)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.31245 -> 3.31245)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.97935 -> 3.97935)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.97935 -> 3.97935)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.98724 -> 3.98724)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.98724 -> 3.98724)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.83649 -> 5.83649)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.83649 -> 5.83649)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.08716 -> 4.08716)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.08716 -> 4.08716)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.56811 -> 4.56811)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.56811 -> 4.56811)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.25888 -> 3.25888)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.25888 -> 3.25888)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.12404 -> 5.12404)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.12404 -> 5.12404)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.80189 -> 5.80189)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.80189 -> 5.80189)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.25609 -> 4.25609)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.25609 -> 4.25609)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.00473 -> 4.00473)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.00473 -> 4.00473)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.4729 -> 5.4729)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.4729 -> 5.4729)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24908 -> 4.24908)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24908 -> 4.24908)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.28477 -> 3.28477)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.28477 -> 3.28477)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15928 -> 4.15928)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15928 -> 4.15928)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.39352 -> 4.39352)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.39352 -> 4.39352)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.30625 -> 5.30625)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.30625 -> 5.30625)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.01008 -> 6.01008)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.01008 -> 6.01008)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80789 -> 4.80789)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80789 -> 4.80789)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.02863 -> 5.02863)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.02863 -> 5.02863)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.41083 -> 5.41083)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.41083 -> 5.41083)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.88904 -> 4.88904)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.88904 -> 4.88904)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05641 -> 5.05641)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05641 -> 5.05641)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.51889 -> 3.51889)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.51889 -> 3.51889)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.58159 -> 5.58159)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.58159 -> 5.58159)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.96358 -> 5.96358)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.96358 -> 5.96358)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.10584 -> 4.10584)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.10584 -> 4.10584)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.71879 -> 3.71879)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.71879 -> 3.71879)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05441 -> 5.05441)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05441 -> 5.05441)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.91646 -> 3.91646)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.91646 -> 3.91646)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.66844 -> 5.66844)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.66844 -> 5.66844)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.30755 -> 6.30755)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.30755 -> 6.30755)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.70959 -> 3.70959)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.70959 -> 3.70959)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.02784 -> 4.02784)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.02784 -> 4.02784)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.37625 -> 4.37625)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.37625 -> 4.37625)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.40956 -> 4.40956)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.40956 -> 4.40956)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96693 -> 3.96693)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96693 -> 3.96693)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.34902 -> 3.34902)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.34902 -> 3.34902)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.59259 -> 3.59259)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.59259 -> 3.59259)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.85778 -> 4.85778)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.85778 -> 4.85778)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.86864 -> 4.86864)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.86864 -> 4.86864)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.59195 -> 4.59195)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.59195 -> 4.59195)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.08883 -> 5.08883)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.08883 -> 5.08883)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.1108 -> 5.1108)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.1108 -> 5.1108)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.16336 -> 3.16336)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.16336 -> 3.16336)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.40644 -> 4.40644)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.40644 -> 4.40644)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.85005 -> 5.85005)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.85005 -> 5.85005)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.29822 -> 5.29822)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.29822 -> 5.29822)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.89244 -> 2.89244)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.89244 -> 2.89244)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.05936 -> 4.05936)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.05936 -> 4.05936)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.5226 -> 3.5226)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.5226 -> 3.5226)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.57015 -> 3.57015)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.57015 -> 3.57015)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.08745 -> 5.08745)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.08745 -> 5.08745)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.06587 -> 5.06587)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.06587 -> 5.06587)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.29341 -> 3.29341)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.29341 -> 3.29341)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.63197 -> 3.63197)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.63197 -> 3.63197)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.12534 -> 5.12534)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.12534 -> 5.12534)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.52911 -> 3.52911)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.52911 -> 3.52911)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.71667 -> 2.71667)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.71667 -> 2.71667)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.30409 -> 3.30409)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.30409 -> 3.30409)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.64434 -> 4.64434)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.64434 -> 4.64434)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.84121 -> 3.84121)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.84121 -> 3.84121)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.93157 -> 5.93157)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.93157 -> 5.93157)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.64562 -> 3.64562)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.64562 -> 3.64562)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31671 -> 4.31671)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31671 -> 4.31671)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.80853 -> 5.80853)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.80853 -> 5.80853)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.75478 -> 4.75478)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.75478 -> 4.75478)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.00989 -> 5.00989)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.00989 -> 5.00989)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.34801 -> 4.34801)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.34801 -> 4.34801)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.68096 -> 2.68096)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.68096 -> 2.68096)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.97161 -> 2.97161)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.97161 -> 2.97161)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.50729 -> 4.50729)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.50729 -> 4.50729)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.06633 -> 4.06633)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.06633 -> 4.06633)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.27828 -> 5.27828)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.27828 -> 5.27828)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.37383 -> 3.37383)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.37383 -> 3.37383)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.85397 -> 4.85397)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.85397 -> 4.85397)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.08155 -> 6.08155)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.08155 -> 6.08155)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.44718 -> 6.44718)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.44718 -> 6.44718)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.35172 -> 4.35172)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.35172 -> 4.35172)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.99542 -> 2.99542)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.99542 -> 2.99542)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.41981 -> 3.41981)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.41981 -> 3.41981)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.60232 -> 3.60232)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.60232 -> 3.60232)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96554 -> 3.96554)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96554 -> 3.96554)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.62263 -> 2.62263)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.62263 -> 2.62263)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.87097 -> 2.87097)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.87097 -> 2.87097)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96963 -> 3.96963)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96963 -> 3.96963)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.76956 -> 3.76956)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.76956 -> 3.76956)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.58774 -> 3.58774)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.58774 -> 3.58774)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.0833 -> 5.0833)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.0833 -> 5.0833)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05946 -> 5.05946)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05946 -> 5.05946)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.36475 -> 3.36475)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.36475 -> 3.36475)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.07749 -> 3.07749)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.07749 -> 3.07749)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05953 -> 5.05953)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05953 -> 5.05953)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15242 -> 4.15242)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15242 -> 4.15242)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.23853 -> 3.23853)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.23853 -> 3.23853)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51797 -> 4.51797)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51797 -> 4.51797)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.04294 -> 3.04294)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.04294 -> 3.04294)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.9066 -> 4.9066)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.9066 -> 4.9066)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.36655 -> 6.36655)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.36655 -> 6.36655)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.49083 -> 5.49083)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.49083 -> 5.49083)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.63516 -> 3.63516)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.63516 -> 3.63516)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.00926 -> 4.00926)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.00926 -> 4.00926)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.03514 -> 4.03514)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.03514 -> 4.03514)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.77932 -> 4.77932)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.77932 -> 4.77932)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.99985 -> 3.99985)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.99985 -> 3.99985)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.37902 -> 3.37902)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.37902 -> 3.37902)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.71 -> 2.71)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.71 -> 2.71)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.44941 -> 4.44941)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.44941 -> 4.44941)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.40954 -> 4.40954)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.40954 -> 4.40954)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.26075 -> 3.26075)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.26075 -> 3.26075)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.33941 -> 4.33941)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.33941 -> 4.33941)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.82777 -> 4.82777)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.82777 -> 4.82777)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.11943 -> 3.11943)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.11943 -> 3.11943)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.87219 -> 3.87219)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.87219 -> 3.87219)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.93481 -> 4.93481)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.93481 -> 4.93481)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27535 -> 4.27535)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27535 -> 4.27535)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.30889 -> 6.30889)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.30889 -> 6.30889)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.97282 -> 4.97282)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.97282 -> 4.97282)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.10917 -> 5.10917)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.10917 -> 5.10917)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.08674 -> 5.08674)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.08674 -> 5.08674)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.34086 -> 5.34086)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.34086 -> 5.34086)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.25331 -> 4.25331)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.25331 -> 4.25331)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.30475 -> 4.30475)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.30475 -> 4.30475)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.44585 -> 3.44585)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.44585 -> 3.44585)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.11935 -> 4.11935)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.11935 -> 4.11935)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.6868 -> 3.6868)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.6868 -> 3.6868)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.83065 -> 2.83065)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.83065 -> 2.83065)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.06053 -> 6.06053)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.06053 -> 6.06053)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.20951 -> 4.20951)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.20951 -> 4.20951)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.92629 -> 3.92629)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.92629 -> 3.92629)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.23683 -> 2.23683)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.23683 -> 2.23683)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.98718 -> 3.98718)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.98718 -> 3.98718)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.22519 -> 5.22519)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.22519 -> 5.22519)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.5924 -> 4.5924)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.5924 -> 4.5924)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.19141 -> 4.19141)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.19141 -> 4.19141)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.01631 -> 3.01631)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.01631 -> 3.01631)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.5985 -> 3.59851)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.5985 -> 3.59851)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.90148 -> 3.90148)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.90148 -> 3.90148)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90864 -> 4.90864)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90864 -> 4.90864)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31907 -> 4.31907)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31907 -> 4.31907)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.45837 -> 2.45836)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.45837 -> 2.45836)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.73994 -> 3.73994)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.73994 -> 3.73994)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.67693 -> 5.67693)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.67693 -> 5.67693)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.25035 -> 5.25035)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.25035 -> 5.25035)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.7794 -> 4.7794)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.7794 -> 4.7794)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.87398 -> 4.87398)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.87398 -> 4.87398)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.81245 -> 3.81245)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.81245 -> 3.81245)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.67779 -> 4.67779)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.67779 -> 4.67779)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.03286 -> 6.03286)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.03286 -> 6.03286)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.68341 -> 6.68341)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.68341 -> 6.68341)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51893 -> 4.51893)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51893 -> 4.51893)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.34203 -> 4.34203)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.34203 -> 4.34203)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41609 -> 4.41609)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41609 -> 4.41609)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96566 -> 3.96566)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96566 -> 3.96566)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.46915 -> 3.46915)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.46915 -> 3.46915)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96387 -> 3.96387)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96387 -> 3.96387)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.24996 -> 6.24996)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.24996 -> 6.24996)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.36711 -> 6.36711)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.36711 -> 6.36711)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.31125 -> 5.31125)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.31125 -> 5.31125)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.72261 -> 3.72261)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.72261 -> 3.72261)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.08995 -> 5.08995)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.08995 -> 5.08995)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.79139 -> 7.79139)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.79139 -> 7.79139)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.52816 -> 5.52816)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.52816 -> 5.52816)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.70866 -> 3.70866)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.70866 -> 3.70866)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.97636 -> 3.97636)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.97636 -> 3.97636)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.7319 -> 3.7319)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.7319 -> 3.7319)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.3163 -> 4.3163)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.3163 -> 4.3163)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.26456 -> 5.26456)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.26456 -> 5.26456)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.94604 -> 3.94604)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.94604 -> 3.94604)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31894 -> 4.31894)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31894 -> 4.31894)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.6384 -> 4.6384)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.6384 -> 4.6384)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.14685 -> 5.14685)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.14685 -> 5.14685)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41715 -> 4.41715)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41715 -> 4.41715)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80756 -> 4.80756)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80756 -> 4.80756)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.15347 -> 6.15347)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.15347 -> 6.15347)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.68451 -> 5.68451)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.68451 -> 5.68451)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.56236 -> 4.56236)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.56236 -> 4.56236)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15207 -> 4.15207)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15207 -> 4.15207)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.37678 -> 4.37678)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.37678 -> 4.37678)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.69243 -> 3.69243)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.69243 -> 3.69243)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.31271 -> 3.31271)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.31271 -> 3.31271)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.6179 -> 2.6179)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.6179 -> 2.6179)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.519 -> 2.519)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.519 -> 2.519)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.32851 -> 3.32851)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.32851 -> 3.32851)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.70236 -> 2.70236)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.70236 -> 2.70236)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.07493 -> 5.07493)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.07493 -> 5.07493)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24386 -> 4.24386)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24386 -> 4.24386)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.81562 -> 4.81562)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.81562 -> 4.81562)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.8131 -> 3.8131)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.8131 -> 3.8131)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.8835 -> 4.8835)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.8835 -> 4.8835)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.16289 -> 6.16289)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.16289 -> 6.16289)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.4122 -> 3.4122)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.4122 -> 3.4122)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.3112 -> 5.3112)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.3112 -> 5.3112)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.29923 -> 5.29923)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.29923 -> 5.29923)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.14812 -> 3.14812)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.14812 -> 3.14812)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.00962 -> 7.00962)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.00962 -> 7.00962)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.10231 -> 6.10231)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.10231 -> 6.10231)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.26982 -> 3.26982)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.26982 -> 3.26982)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.88695 -> 4.88695)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.88695 -> 4.88695)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.87025 -> 5.87025)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.87025 -> 5.87025)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.66752 -> 3.66752)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.66752 -> 3.66752)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.69108 -> 4.69108)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.69108 -> 4.69108)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.6859 -> 4.6859)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.6859 -> 4.6859)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27439 -> 4.27439)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27439 -> 4.27439)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.32716 -> 4.32716)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.32716 -> 4.32716)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.12364 -> 4.12364)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.12364 -> 4.12364)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.94712 -> 4.94712)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.94712 -> 4.94712)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.61193 -> 5.61193)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.61193 -> 5.61193)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.74666 -> 2.74666)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.74666 -> 2.74666)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.57719 -> 2.57719)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.57719 -> 2.57719)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4987 -> 4.4987)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4987 -> 4.4987)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.57696 -> 4.57696)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.57696 -> 4.57696)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.21916 -> 4.21916)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.21916 -> 4.21916)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.45597 -> 3.45597)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.45597 -> 3.45597)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.61205 -> 2.61205)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.61205 -> 2.61205)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.11181 -> 4.11181)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.11181 -> 4.11181)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.93251 -> 4.93251)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.93251 -> 4.93251)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.66966 -> 5.66966)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.66966 -> 5.66966)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.6045 -> 5.6045)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.6045 -> 5.6045)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.39833 -> 3.39833)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.39833 -> 3.39833)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.11624 -> 4.11624)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.11624 -> 4.11624)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.65386 -> 5.65386)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.65386 -> 5.65386)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.65229 -> 3.65229)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.65229 -> 3.65229)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.10344 -> 4.10344)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.10344 -> 4.10344)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.38627 -> 6.38627)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.38627 -> 6.38627)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.46447 -> 4.46447)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.46447 -> 4.46447)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.53771 -> 4.53771)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.53771 -> 4.53771)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.70852 -> 5.70852)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.70852 -> 5.70852)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.416 -> 4.416)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.416 -> 4.416)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90554 -> 4.90554)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90554 -> 4.90554)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.2313 -> 4.2313)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.2313 -> 4.2313)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.21442 -> 4.21442)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.21442 -> 4.21442)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.67493 -> 5.67493)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.67493 -> 5.67493)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.11889 -> 6.11889)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.11889 -> 6.11889)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.02581 -> 5.02581)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.02581 -> 5.02581)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.56961 -> 3.56961)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.56961 -> 3.56961)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90419 -> 4.90419)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90419 -> 4.90419)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.83412 -> 2.83412)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.83412 -> 2.83412)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.79741 -> 4.79741)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.79741 -> 4.79741)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.95189 -> 5.95189)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.95189 -> 5.95189)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.22773 -> 6.22773)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.22773 -> 6.22773)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.27067 -> 5.27067)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.27067 -> 5.27067)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.08481 -> 3.08481)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.08481 -> 3.08481)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.84407 -> 3.84407)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.84407 -> 3.84407)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.81123 -> 2.81123)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.81123 -> 2.81123)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.97706 -> 3.97706)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.97706 -> 3.97706)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.38542 -> 5.38542)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.38542 -> 5.38542)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.93931 -> 3.93931)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.93931 -> 3.93931)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.16665 -> 3.16665)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.16665 -> 3.16665)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.77872 -> 4.77872)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.77872 -> 4.77872)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.10919 -> 5.10919)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.10919 -> 5.10919)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.16017 -> 5.16017)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.16017 -> 5.16017)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.76647 -> 3.76647)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.76647 -> 3.76647)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41113 -> 4.41113)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41113 -> 4.41113)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.33153 -> 4.33153)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.33153 -> 4.33153)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.08256 -> 3.08256)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.08256 -> 3.08256)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.13475 -> 5.13475)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.13475 -> 5.13475)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.66395 -> 4.66395)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.66395 -> 4.66395)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.58166 -> 7.58166)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.58166 -> 7.58166)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.35466 -> 4.35466)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.35466 -> 4.35466)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31029 -> 4.31029)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31029 -> 4.31029)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.57713 -> 5.57713)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.57713 -> 5.57713)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.58219 -> 4.58219)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.58219 -> 4.58219)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.85844 -> 2.85844)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.85844 -> 2.85844)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.21449 -> 4.21449)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.21449 -> 4.21449)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.44891 -> 4.44891)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.44891 -> 4.44891)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.36523 -> 3.36523)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.36523 -> 3.36523)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05832 -> 5.05832)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05832 -> 5.05832)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.52464 -> 5.52464)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.52464 -> 5.52464)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15316 -> 4.15316)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15316 -> 4.15316)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24042 -> 4.24042)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24042 -> 4.24042)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.57848 -> 2.57848)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.57848 -> 2.57848)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.66954 -> 3.66954)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.66954 -> 3.66954)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.49682 -> 4.49682)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.49682 -> 4.49682)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.37203 -> 3.37203)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.37203 -> 3.37203)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.32036 -> 3.32036)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.32036 -> 3.32036)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.93498 -> 2.93498)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.93498 -> 2.93498)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.43142 -> 4.43142)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.43142 -> 4.43142)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.44878 -> 4.44878)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.44878 -> 4.44878)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.57981 -> 5.57981)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.57981 -> 5.57981)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.33498 -> 3.33498)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.33498 -> 3.33498)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.52732 -> 3.52732)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.52732 -> 3.52732)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.25273 -> 4.25273)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.25273 -> 4.25273)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.98991 -> 3.98991)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.98991 -> 3.98991)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.90399 -> 2.90399)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.90399 -> 2.90399)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80113 -> 4.80113)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80113 -> 4.80113)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.12867 -> 4.12867)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.12867 -> 4.12867)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.63667 -> 5.63667)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.63667 -> 5.63667)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27588 -> 4.27588)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27588 -> 4.27588)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.61795 -> 2.61795)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.61795 -> 2.61795)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.30804 -> 4.30804)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.30804 -> 4.30804)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.85166 -> 4.85166)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.85166 -> 4.85166)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.30763 -> 4.30763)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.30763 -> 4.30763)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.96111 -> 4.96111)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.96111 -> 4.96111)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.15302 -> 5.15302)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.15302 -> 5.15302)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.7383 -> 3.7383)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.7383 -> 3.7383)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.74847 -> 3.74847)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.74847 -> 3.74847)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.84548 -> 4.84548)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.84548 -> 4.84548)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.64991 -> 5.64991)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.64991 -> 5.64991)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.38513 -> 3.38513)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.38513 -> 3.38513)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.75161 -> 4.75161)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.75161 -> 4.75161)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.69239 -> 3.69239)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.69239 -> 3.69239)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.68681 -> 4.68681)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.68681 -> 4.68681)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.23266 -> 3.23266)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.23266 -> 3.23266)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.32742 -> 4.32742)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.32742 -> 4.32742)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.13229 -> 4.13229)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.13229 -> 4.13229)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.4391 -> 5.4391)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.4391 -> 5.4391)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.80732 -> 3.80732)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.80732 -> 3.80732)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.70378 -> 2.70378)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.70378 -> 2.70378)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.34252 -> 3.34252)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.34252 -> 3.34252)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.3003 -> 3.3003)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.3003 -> 3.3003)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (1.89392 -> 1.89392)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (1.89392 -> 1.89392)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.56243 -> 4.56243)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.56243 -> 4.56243)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.34799 -> 5.34799)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.34799 -> 5.34799)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.44371 -> 4.44371)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.44371 -> 4.44371)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.07144 -> 7.07144)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.07144 -> 7.07144)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.77827 -> 5.77826)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.77827 -> 5.77826)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.27676 -> 3.27676)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.27676 -> 3.27676)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31895 -> 4.31895)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31895 -> 4.31895)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.01395 -> 5.01395)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.01395 -> 5.01395)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.46968 -> 4.46968)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.46968 -> 4.46968)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.95569 -> 2.95569)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.95569 -> 2.95569)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.58486 -> 3.58486)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.58486 -> 3.58486)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.22863 -> 4.22863)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.22863 -> 4.22863)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.4685 -> 3.4685)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.4685 -> 3.4685)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.7992 -> 3.7992)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.7992 -> 3.7992)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.68676 -> 3.68676)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.68676 -> 3.68676)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.12732 -> 5.12732)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.12732 -> 5.12732)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.74158 -> 3.74158)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.74158 -> 3.74158)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.1784 -> 4.1784)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.1784 -> 4.1784)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.05798 -> 4.05798)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.05798 -> 4.05798)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.07936 -> 4.07936)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.07936 -> 4.07936)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.66883 -> 3.66883)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.66883 -> 3.66883)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.33418 -> 6.33418)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.33418 -> 6.33418)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27282 -> 4.27282)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27282 -> 4.27282)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.49276 -> 3.49276)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.49276 -> 3.49276)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.21756 -> 5.21756)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.21756 -> 5.21756)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.10542 -> 4.10542)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.10542 -> 4.10542)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.69386 -> 4.69386)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.69386 -> 4.69386)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.06564 -> 4.06564)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.06564 -> 4.06564)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.58809 -> 4.58809)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.58809 -> 4.58809)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.50989 -> 6.50989)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.50989 -> 6.50989)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.35286 -> 5.35286)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.35286 -> 5.35286)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.75543 -> 4.75543)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.75543 -> 4.75543)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.63637 -> 4.63637)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.63637 -> 4.63637)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.92751 -> 2.92751)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.92751 -> 2.92751)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.50095 -> 4.50095)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.50095 -> 4.50095)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.08913 -> 4.08913)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.08913 -> 4.08913)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.26495 -> 5.26495)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.26495 -> 5.26495)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.09676 -> 5.09676)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.09676 -> 5.09676)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.03523 -> 3.03523)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.03523 -> 3.03523)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.20265 -> 4.20265)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.20265 -> 4.20265)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.64361 -> 4.64361)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.64361 -> 4.64361)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.54042 -> 3.54042)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.54042 -> 3.54042)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.49041 -> 5.49041)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.49041 -> 5.49041)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.35707 -> 4.35707)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.35707 -> 4.35707)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.66775 -> 5.66775)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.66775 -> 5.66775)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.62679 -> 6.62679)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.62679 -> 6.62679)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.51397 -> 3.51397)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.51397 -> 3.51397)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.60956 -> 4.60956)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.60956 -> 4.60956)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4144 -> 4.4144)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4144 -> 4.4144)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24567 -> 4.24567)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24567 -> 4.24567)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.27859 -> 3.27859)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.27859 -> 3.27859)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.56611 -> 4.56611)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.56611 -> 4.56611)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.19203 -> 4.19203)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.19203 -> 4.19203)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.41038 -> 5.41038)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.41038 -> 5.41038)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.05761 -> 4.05761)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.05761 -> 4.05761)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.5296 -> 2.5296)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.5296 -> 2.5296)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.29027 -> 4.29027)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.29027 -> 4.29027)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.97684 -> 5.97684)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.97684 -> 5.97684)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.1744 -> 3.1744)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.1744 -> 3.1744)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.32132 -> 5.32132)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.32132 -> 5.32132)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.37066 -> 5.37066)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.37066 -> 5.37066)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.30875 -> 6.30875)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.30875 -> 6.30875)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.34071 -> 2.34071)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.34071 -> 2.34071)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.98438 -> 3.98438)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.98438 -> 3.98438)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05939 -> 5.05939)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05939 -> 5.05939)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.25702 -> 5.25702)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.25702 -> 5.25702)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.35617 -> 5.35617)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.35617 -> 5.35617)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.36803 -> 3.36803)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.36803 -> 3.36803)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.08462 -> 5.08462)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.08462 -> 5.08462)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.77124 -> 5.77124)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.77124 -> 5.77124)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.12154 -> 4.12154)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.12154 -> 4.12154)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.37505 -> 4.37505)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.37505 -> 4.37505)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.85498 -> 2.85498)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.85498 -> 2.85498)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.7308 -> 3.7308)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.7308 -> 3.7308)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (1.43938 -> 1.43938)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (1.43938 -> 1.43938)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.89784 -> 4.89784)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.89784 -> 4.89784)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.12711 -> 5.12711)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.12711 -> 5.12711)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.40608 -> 5.40608)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.40608 -> 5.40608)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.26983 -> 4.26983)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.26983 -> 4.26983)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.38741 -> 5.38741)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.38741 -> 5.38741)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.33733 -> 6.33733)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.33733 -> 6.33733)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.70076 -> 4.70076)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.70076 -> 4.70076)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.18223 -> 5.18223)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.18223 -> 5.18223)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.89127 -> 4.89127)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.89127 -> 4.89127)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.03991 -> 2.03991)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.03991 -> 2.03991)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.32144 -> 4.32144)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.32144 -> 4.32144)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.7141 -> 5.7141)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.7141 -> 5.7141)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.94329 -> 4.94329)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.94329 -> 4.94329)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.77825 -> 5.77825)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.77825 -> 5.77825)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.26786 -> 5.26786)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.26786 -> 5.26786)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.12775 -> 5.12775)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.12775 -> 5.12775)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41175 -> 4.41175)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41175 -> 4.41175)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.15293 -> 5.15293)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.15293 -> 5.15293)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.37517 -> 4.37517)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.37517 -> 4.37517)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.00942 -> 4.00942)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.00942 -> 4.00942)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.31028 -> 5.31028)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.31028 -> 5.31028)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.85291 -> 2.85291)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.85291 -> 2.85291)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.46259 -> 4.46259)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.46259 -> 4.46259)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.53154 -> 2.53154)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.53154 -> 2.53154)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80333 -> 4.80333)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80333 -> 4.80333)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.39675 -> 5.39675)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.39675 -> 5.39675)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.56645 -> 6.56645)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.56645 -> 6.56645)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.27795 -> 6.27795)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.27795 -> 6.27795)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.17738 -> 6.17738)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.17738 -> 6.17738)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.86567 -> 4.86567)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.86567 -> 4.86567)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.93996 -> 4.93996)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.93996 -> 4.93996)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.40908 -> 5.40908)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.40908 -> 5.40908)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05842 -> 5.05842)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.05842 -> 5.05842)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.02623 -> 3.02623)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.02623 -> 3.02623)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.89606 -> 3.89606)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.89606 -> 3.89606)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.58844 -> 3.58844)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.58844 -> 3.58844)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.05164 -> 4.05164)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.05164 -> 4.05164)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.17268 -> 4.17268)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.17268 -> 4.17268)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.52264 -> 2.52264)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.52264 -> 2.52264)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.67562 -> 5.67562)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.67562 -> 5.67562)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.75933 -> 5.75933)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.75933 -> 5.75933)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.625 -> 4.625)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.625 -> 4.625)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.65745 -> 4.65745)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.65745 -> 4.65745)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.8513 -> 4.8513)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.8513 -> 4.8513)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.71509 -> 2.71509)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.71509 -> 2.71509)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.26948 -> 5.26948)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.26948 -> 5.26948)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.13549 -> 4.13549)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.13549 -> 4.13549)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.54112 -> 4.54111)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.54112 -> 4.54111)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.03613 -> 5.03613)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.03613 -> 5.03613)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.94518 -> 2.94518)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.94518 -> 2.94518)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.966 -> 4.966)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.966 -> 4.966)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.59532 -> 6.59532)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.59532 -> 6.59532)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.36015 -> 5.36015)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.36015 -> 5.36015)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15763 -> 4.15763)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.15763 -> 4.15763)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.13926 -> 5.13926)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.13926 -> 5.13926)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.00912 -> 3.00912)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.00912 -> 3.00912)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.37359 -> 5.37359)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.37359 -> 5.37359)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.50854 -> 4.50854)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.50854 -> 4.50854)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.73874 -> 4.73874)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.73874 -> 4.73874)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.57259 -> 3.57259)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.57259 -> 3.57259)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.51856 -> 3.51856)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.51856 -> 3.51856)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.00289 -> 5.00289)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.00289 -> 5.00289)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.95445 -> 4.95445)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.95445 -> 4.95445)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.28972 -> 2.28972)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.28972 -> 2.28972)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.40194 -> 5.40194)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.40194 -> 5.40194)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.97522 -> 3.97522)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.97522 -> 3.97522)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.79815 -> 3.79815)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.79815 -> 3.79815)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.03052 -> 5.03052)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.03052 -> 5.03052)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.73784 -> 4.73784)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.73784 -> 4.73784)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.05217 -> 4.05217)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.05217 -> 4.05217)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.18785 -> 6.18785)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.18785 -> 6.18785)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.21661 -> 5.21661)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.21661 -> 5.21661)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.35274 -> 5.35274)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.35274 -> 5.35274)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.93919 -> 5.93919)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.93919 -> 5.93919)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.73476 -> 3.73476)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.73476 -> 3.73476)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.36029 -> 4.36029)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.36029 -> 4.36029)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.58819 -> 4.58819)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.58819 -> 4.58819)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.35078 -> 3.35078)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.35078 -> 3.35078)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41852 -> 4.41852)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.41852 -> 4.41852)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.72274 -> 4.72274)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.72274 -> 4.72274)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.57547 -> 4.57547)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.57547 -> 4.57547)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.00955 -> 4.00955)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.00955 -> 4.00955)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.35237 -> 4.35237)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.35237 -> 4.35237)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.84143 -> 3.84143)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.84143 -> 3.84143)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.20422 -> 5.20422)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.20422 -> 5.20422)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.0273 -> 5.0273)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.0273 -> 5.0273)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27968 -> 4.27968)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27968 -> 4.27968)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.14794 -> 4.14794)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.14794 -> 4.14794)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.33152 -> 3.33152)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.33152 -> 3.33152)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.52266 -> 3.52266)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.52266 -> 3.52266)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.28489 -> 4.28489)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.28489 -> 4.28489)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.44109 -> 6.44109)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.44109 -> 6.44109)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.35632 -> 3.35632)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.35632 -> 3.35632)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.17329 -> 4.17329)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.17329 -> 4.17329)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4209 -> 4.4209)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4209 -> 4.4209)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96717 -> 3.96717)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.96717 -> 3.96717)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.51345 -> 5.51345)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.51345 -> 5.51345)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27046 -> 4.27046)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27046 -> 4.27046)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51027 -> 4.51027)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51027 -> 4.51027)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.73412 -> 4.73412)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.73412 -> 4.73412)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4095 -> 4.4095)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.4095 -> 4.4095)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.73553 -> 3.73553)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.73553 -> 3.73553)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.57542 -> 3.57542)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.57542 -> 3.57542)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.47329 -> 4.47329)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.47329 -> 4.47329)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.16822 -> 4.16822)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.16822 -> 4.16822)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.55026 -> 3.55026)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.55026 -> 3.55026)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.06341 -> 4.06341)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.06341 -> 4.06341)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.65713 -> 4.65713)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.65713 -> 4.65713)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.63862 -> 2.63862)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.63862 -> 2.63862)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.78311 -> 2.78311)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.78311 -> 2.78311)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.70293 -> 4.70293)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.70293 -> 4.70293)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.97025 -> 3.97025)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.97025 -> 3.97025)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.43577 -> 3.43577)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.43577 -> 3.43577)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.11717 -> 6.11717)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.11717 -> 6.11717)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.78023 -> 3.78023)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.78023 -> 3.78023)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.1938 -> 4.1938)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.1938 -> 4.1938)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.76248 -> 4.76248)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.76248 -> 4.76248)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.76978 -> 4.76978)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.76978 -> 4.76978)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.42901 -> 4.42901)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.42901 -> 4.42901)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.57643 -> 4.57643)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.57643 -> 4.57643)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.09757 -> 5.09757)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.09757 -> 5.09757)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.42986 -> 4.42986)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.42986 -> 4.42986)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.59124 -> 3.59124)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.59124 -> 3.59124)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.70893 -> 4.70893)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.70893 -> 4.70893)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.20262 -> 4.20262)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.20262 -> 4.20262)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.39035 -> 4.39035)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.39035 -> 4.39035)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.19612 -> 4.19613)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.19612 -> 4.19613)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.20875 -> 5.20875)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.20875 -> 5.20875)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.93723 -> 4.93723)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.93723 -> 4.93723)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.59347 -> 4.59347)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.59347 -> 4.59347)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.14154 -> 5.14154)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.14154 -> 5.14154)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.3545 -> 4.3545)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.3545 -> 4.3545)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.1739 -> 4.1739)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.1739 -> 4.1739)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.84424 -> 4.84424)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.84424 -> 4.84424)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.37242 -> 3.37242)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.37242 -> 3.37242)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.52689 -> 4.52689)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.52689 -> 4.52689)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.67817 -> 3.67817)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.67817 -> 3.67817)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.79408 -> 3.79408)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.79408 -> 3.79408)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.50843 -> 4.50843)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.50843 -> 4.50843)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.04329 -> 4.04329)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.04329 -> 4.04329)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.55578 -> 3.55578)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.55578 -> 3.55578)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.34472 -> 5.34472)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.34472 -> 5.34472)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.02773 -> 5.02773)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.02773 -> 5.02773)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.03864 -> 4.03864)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.03864 -> 4.03864)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.5261 -> 4.5261)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.5261 -> 4.5261)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.14477 -> 4.14477)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.14477 -> 4.14477)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.34713 -> 4.34713)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.34713 -> 4.34713)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.64778 -> 4.64778)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.64778 -> 4.64778)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.49759 -> 3.49759)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.49759 -> 3.49759)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.54879 -> 3.54879)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.54879 -> 3.54879)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.28462 -> 4.28463)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.28462 -> 4.28463)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.69877 -> 7.69877)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (7.69877 -> 7.69877)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90001 -> 4.90001)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.90001 -> 4.90001)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (1.79654 -> 1.79654)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (1.79654 -> 1.79654)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.94255 -> 5.94255)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.94255 -> 5.94255)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.5205 -> 6.5205)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.5205 -> 6.5205)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.41833 -> 6.41833)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.41833 -> 6.41833)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.7214 -> 5.7214)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.7214 -> 5.7214)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.28064 -> 5.28064)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.28064 -> 5.28064)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.57514 -> 3.57514)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.57514 -> 3.57514)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.98788 -> 2.98788)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.98788 -> 2.98788)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.2932 -> 4.2932)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.2932 -> 4.2932)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.26253 -> 5.26253)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.26253 -> 5.26253)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.11213 -> 5.11213)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.11213 -> 5.11213)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.58919 -> 3.58919)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.58919 -> 3.58919)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.24832 -> 6.24832)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.24832 -> 6.24832)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.36146 -> 5.36146)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.36146 -> 5.36146)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.92017 -> 3.92017)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.92017 -> 3.92017)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.80512 -> 5.80512)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.80512 -> 5.80512)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.25065 -> 3.25065)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.25065 -> 3.25065)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.39662 -> 4.39662)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.39662 -> 4.39662)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.16848 -> 5.16848)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.16848 -> 5.16848)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.70168 -> 4.70168)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.70168 -> 4.70168)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.83595 -> 2.83595)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.83595 -> 2.83595)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.88574 -> 2.88574)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.88574 -> 2.88574)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (1.45227 -> 1.45227)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (1.45227 -> 1.45227)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.82136 -> 3.82136)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.82136 -> 3.82136)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.86754 -> 4.86754)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.86754 -> 4.86754)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.73135 -> 3.73135)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.73135 -> 3.73135)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.76355 -> 4.76355)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.76355 -> 4.76355)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.64459 -> 3.64459)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.64459 -> 3.64459)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.77103 -> 4.77103)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.77103 -> 4.77103)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.73512 -> 4.73512)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.73512 -> 4.73512)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.70429 -> 5.70429)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.70429 -> 5.70429)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.28044 -> 4.28044)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.28044 -> 4.28044)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.71608 -> 3.71608)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.71608 -> 3.71608)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.59121 -> 5.59121)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.59121 -> 5.59121)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.38935 -> 3.38935)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.38935 -> 3.38935)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.30323 -> 2.30323)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.30323 -> 2.30323)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.2362 -> 3.2362)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.2362 -> 3.2362)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.2148 -> 5.2148)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.2148 -> 5.2148)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.65666 -> 4.65666)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.65666 -> 4.65666)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.16028 -> 4.16027)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.16028 -> 4.16027)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.03367 -> 6.03367)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.03367 -> 6.03367)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.0349 -> 6.0349)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.0349 -> 6.0349)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.93353 -> 4.93353)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.93353 -> 4.93353)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.54868 -> 4.54868)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.54868 -> 4.54868)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.6759 -> 5.6759)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.6759 -> 5.6759)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.72523 -> 4.72523)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.72523 -> 4.72523)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.03377 -> 4.03377)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.03377 -> 4.03377)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.92911 -> 5.92911)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.92911 -> 5.92911)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.87332 -> 5.87332)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.87332 -> 5.87332)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.59746 -> 4.59746)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.59746 -> 4.59746)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80714 -> 4.80714)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80714 -> 4.80714)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.76986 -> 3.76986)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.76986 -> 3.76986)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.55143 -> 4.55143)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.55143 -> 4.55143)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.75002 -> 3.75002)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.75002 -> 3.75002)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27478 -> 4.27478)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27478 -> 4.27478)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27035 -> 4.27035)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27035 -> 4.27035)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.74663 -> 4.74663)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.74663 -> 4.74663)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.88381 -> 3.88381)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.88381 -> 3.88381)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.23435 -> 4.23435)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.23435 -> 4.23435)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.39865 -> 5.39865)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.39865 -> 5.39865)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.83566 -> 5.83566)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.83566 -> 5.83566)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80855 -> 4.80855)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.80855 -> 4.80855)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.44638 -> 3.44638)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.44638 -> 3.44638)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.03162 -> 3.03162)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.03162 -> 3.03162)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.91272 -> 3.91272)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.91272 -> 3.91272)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.99322 -> 4.99322)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.99322 -> 4.99322)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.34899 -> 4.34899)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.34899 -> 4.34899)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27794 -> 4.27794)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.27794 -> 4.27794)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.59146 -> 3.59146)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.59146 -> 3.59146)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.05091 -> 4.05091)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.05091 -> 4.05091)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.32677 -> 4.32677)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.32677 -> 4.32677)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.17861 -> 3.17861)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.17861 -> 3.17861)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.1472 -> 5.1472)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.1472 -> 5.1472)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.69739 -> 4.69739)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.69739 -> 4.69739)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.77895 -> 4.77894)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.77895 -> 4.77894)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.18806 -> 6.18806)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.18806 -> 6.18806)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.0731 -> 6.0731)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.0731 -> 6.0731)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.6985 -> 4.6985)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.6985 -> 4.6985)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.22365 -> 4.22365)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.22365 -> 4.22365)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.5542 -> 3.5542)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.5542 -> 3.5542)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.69325 -> 4.69325)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.69325 -> 4.69325)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.2991 -> 4.2991)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.2991 -> 4.2991)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.6569 -> 3.6569)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.6569 -> 3.6569)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.10049 -> 5.10049)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.10049 -> 5.10049)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.74476 -> 4.74476)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.74476 -> 4.74476)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.75953 -> 3.75953)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.75953 -> 3.75953)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.67887 -> 2.67887)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.67887 -> 2.67887)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.26675 -> 6.26675)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.26675 -> 6.26675)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.15371 -> 5.15371)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.15371 -> 5.15371)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.81239 -> 3.81239)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.81239 -> 3.81239)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.96967 -> 2.96967)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.96967 -> 2.96967)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.7437 -> 3.7437)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.7437 -> 3.7437)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.55141 -> 3.55141)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.55141 -> 3.55141)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.84562 -> 4.84562)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.84562 -> 4.84562)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.79803 -> 3.79803)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.79803 -> 3.79803)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.36166 -> 5.36166)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.36166 -> 5.36166)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.31958 -> 3.31958)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.31958 -> 3.31958)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.6178 -> 3.6178)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.6178 -> 3.6178)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.24708 -> 5.24708)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.24708 -> 5.24708)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24105 -> 4.24105)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24105 -> 4.24105)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.75438 -> 3.75438)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.75438 -> 3.75438)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.63381 -> 3.63381)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.63381 -> 3.63381)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.90697 -> 2.90697)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.90697 -> 2.90697)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.19513 -> 3.19513)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.19513 -> 3.19513)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.11406 -> 3.11406)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.11406 -> 3.11406)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.27299 -> 3.27299)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.27299 -> 3.27299)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.34847 -> 5.34847)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.34847 -> 5.34847)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.58583 -> 3.58583)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.58583 -> 3.58583)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.88046 -> 3.88046)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.88046 -> 3.88046)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.69135 -> 3.69135)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.69135 -> 3.69135)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.626 -> 3.626)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.626 -> 3.626)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.0515 -> 5.0515)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.0515 -> 5.0515)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.3539 -> 4.3539)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.3539 -> 4.3539)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.92174 -> 4.92174)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.92174 -> 4.92174)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.48479 -> 5.48479)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.48479 -> 5.48479)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.07258 -> 4.07258)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.07258 -> 4.07258)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.44871 -> 4.44871)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.44871 -> 4.44871)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.11823 -> 4.11823)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.11823 -> 4.11823)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.06607 -> 3.06607)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.06607 -> 3.06607)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.15789 -> 3.15789)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.15789 -> 3.15789)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.53341 -> 3.53341)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.53341 -> 3.53341)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.39848 -> 4.39848)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.39848 -> 4.39848)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.08399 -> 3.08399)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.08399 -> 3.08399)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.68754 -> 4.68754)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.68754 -> 4.68754)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.53062 -> 6.53062)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.53062 -> 6.53062)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.18557 -> 5.18557)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.18557 -> 5.18557)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.1284 -> 3.1284)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.1284 -> 3.1284)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.66594 -> 5.66594)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.66594 -> 5.66594)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.78135 -> 6.78135)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (6.78135 -> 6.78135)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.30318 -> 4.30318)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.30318 -> 4.30318)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.3361 -> 4.3361)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.3361 -> 4.3361)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.50013 -> 5.50013)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.50013 -> 5.50013)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.60468 -> 3.60468)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.60468 -> 3.60468)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.17365 -> 4.17365)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.17365 -> 4.17365)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.40158 -> 5.40158)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.40158 -> 5.40158)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24354 -> 4.24354)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.24354 -> 4.24354)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.20874 -> 4.20874)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.20874 -> 4.20874)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.33229 -> 4.33229)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.33229 -> 4.33229)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.9328 -> 4.9328)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.9328 -> 4.9328)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.56933 -> 4.56933)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.56933 -> 4.56933)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.77343 -> 4.77343)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.77343 -> 4.77343)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.36979 -> 5.36979)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.36979 -> 5.36979)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.99013 -> 4.99013)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.99013 -> 4.99013)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31743 -> 4.31743)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.31743 -> 4.31743)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.35502 -> 3.35502)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.35502 -> 3.35502)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.31702 -> 3.31702)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.31702 -> 3.31702)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.49106 -> 5.49106)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.49106 -> 5.49106)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.33497 -> 5.33497)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.33497 -> 5.33497)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.21298 -> 4.21298)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.21298 -> 4.21298)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.35925 -> 3.35925)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.35925 -> 3.35925)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.56081 -> 3.56081)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.56081 -> 3.56081)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.48154 -> 4.48154)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.48154 -> 4.48154)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.02134 -> 4.02134)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.02134 -> 4.02134)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.2394 -> 2.2394)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.2394 -> 2.2394)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.83742 -> 4.83742)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.83742 -> 4.83742)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.72352 -> 2.72352)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (2.72352 -> 2.72352)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.81516 -> 3.81516)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.81516 -> 3.81516)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.09426 -> 3.09426)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (3.09426 -> 3.09426)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51901 -> 4.51901)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (4.51901 -> 4.51901)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.36848 -> 5.36848)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMat(x$address, i, j, value): At least one value changed (5.36848 -> 5.36848)
#>   while converting from R type 'double' to C type 'float'.
#> Warning in replaceMatOne(x$address, i, j, value[1]): At least one value changed (3.78913 -> 3.78913)
#>   while converting from R type 'double' to C type 'float'.

#> Warning in replaceMatOne(x$address, i, j, value[1]): At least one value changed (3.78913 -> 3.78913)
#>   while converting from R type 'double' to C type 'float'.
#> Completed!
#> ----
temp
#> $fbm
#> A Filebacked Big Matrix of type 'float' with 1000 rows and 1000 columns.
#> 
#> attr(,"class")
#> [1] "bigdist"
temp$fbm$backingfile
#> [1] "/tmp/RtmpGJ6Yae/tempfile_1000_float.bk"
temp$fbm[1, 2]
#> [1] 4.093935

# connect to FBM on disk as a bigdist object
temp2 <- bigdist(file = file.path(td, "tempfile_1000_float"))
temp2
#> $fbm
#> A Filebacked Big Matrix of type 'float' with 1000 rows and 1000 columns.
#> 
#> attr(,"class")
#> [1] "bigdist"
temp2$fbm[1,2]
#> [1] 4.093935

# check the size of bigdist object
bigdist_size(temp)
#> [1] 1000

# bigdist accessors

# ij
bigdist_extract(temp, 1, 2)
#>          [,1]
#> [1,] 4.093935
bigdist_extract(temp, 1:2, 3:4)
#>          [,1]     [,2]
#> [1,] 5.046114 5.403577
#> [2,] 5.129808 5.016995
bigdist_extract(temp, 1:2, 3:4, product = "inner")
#> [1] 5.046114 5.016995
dim(bigdist_extract(temp, 1:2, ))
#> [1]    2 1000
dim(bigdist_extract(temp, , 3:4))
#> [1] 1000    2

# k (lower trianle indexing)
bigdist_extract(temp, k = 3:7)
#> [1] 5.403577 4.887118 4.752646 2.917587 6.052156

# bigdist replacers

# ij
bigdist_replace(temp, 1, 2, 10)
#> $fbm
#> A Filebacked Big Matrix of type 'float' with 1000 rows and 1000 columns.
#> 
#> attr(,"class")
#> [1] "bigdist"
bigdist_extract(temp, 1, 2)
#>      [,1]
#> [1,]   10
bigdist_replace(temp, 1:2, 3:4, 11:12)
#> $fbm
#> A Filebacked Big Matrix of type 'float' with 1000 rows and 1000 columns.
#> 
#> attr(,"class")
#> [1] "bigdist"
bigdist_extract(temp, 1:2, 3:4, product = "inner")
#> [1] 11 12

# k (lower trianle indexing)
bigdist_replace(temp, k = 3:7, value = 51:55)
#> $fbm
#> A Filebacked Big Matrix of type 'float' with 1000 rows and 1000 columns.
#> 
#> attr(,"class")
#> [1] "bigdist"
bigdist_extract(temp, k = 3:7)
#> [1] 51 52 53 54 55

# subset a bigdist object
temp_subset <- bigdist_subset(temp, index = 201:300, file = file.path(td, "tempfile2"))
temp_subset
#> $fbm
#> A Filebacked Big Matrix of type 'float' with 100 rows and 100 columns.
#> 
#> attr(,"class")
#> [1] "bigdist"
temp_subset$fbm$backingfile
#> [1] "/tmp/RtmpGJ6Yae/tempfile2_100_float.bk"

# convert a dist object(in memory) to a bigdist object
temp3 <- as_bigdist(dist(mtcars), file = file.path(td, "tempfile3"))
#> ----
#> Location: /tmp/RtmpGJ6Yae/tempfile3_32.bk
#> Size on disk: 0 GB
#> completed!
#> ----
temp3
#> $fbm
#> A Filebacked Big Matrix of type 'double' with 32 rows and 32 columns.
#> 
#> attr(,"class")
#> [1] "bigdist"

# remove the FBM from disk
unlink(td, recursive = TRUE)
```
