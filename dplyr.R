#  `dplyr` package to convert `data.frame` into `tibble`

library(dplyr) #load `dplyr` package
mtcars_tibble <- tbl_df(mtcars) #change the class of `mtcars` into `tibble`
