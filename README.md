[![Travis build status](https://travis-ci.org/talegari/bigdist.svg?branch=master)](https://travis-ci.org/talegari/bigdist)

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
#> Warning in dir.create(td): '/tmp/Rtmpb4VkbR' already exists

# create a bigdist object with FBM(fle-baked matrix) on disk
temp <- bigdist(mat = amat, file = file.path(td, "tempfile"))
#> ----
#> Location: /tmp/Rtmpb4VkbR/tempfile_1000_float.bk
#> Size on disk: 0 GB
#> Computing distances ...
#> Completed!
#> ----
temp
#> $fbm
#> A Filebacked Big Matrix of type 'float' with 1000 rows and 1000 columns.
#> 
#> attr(,"class")
#> [1] "bigdist"
temp$fbm$backingfile
#> [1] "/tmp/Rtmpb4VkbR/tempfile_1000_float.bk"
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
#> [1] "/tmp/Rtmpb4VkbR/tempfile2_100_float.bk"

# convert a dist object(in memory) to a bigdist object
temp3 <- as_bigdist(dist(mtcars), file = file.path(td, "tempfile3"))
#> ----
#> Location: /tmp/Rtmpb4VkbR/tempfile3_32_double.bk
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
