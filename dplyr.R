#  `dplyr` package to convert `data.frame` into `tibble`

library(dplyr) #load `dplyr` package
mtcars_dplyr <- tbl_df(data = mtcars) #change the class of `mtcars` into `tibble`
