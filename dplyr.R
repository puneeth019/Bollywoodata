#  `dplyr` package to convert data.frame into tibble

library(dplyr) #Load `dplyr` package
iris_tibble <- tbl_df(mtcars) #convert `mtcars` `data.frame` into `tibble`
