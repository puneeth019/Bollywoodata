###Difference between using `dplyr` and `tibble` packages to convert `data.frame` into `tibble`.

In [dplyr.R](https://github.com/puneeth019/playground/blob/master/dplyr.R), `dplyr` package is used to convert the class of `mtcars` from `data.frame` into `tibble` using the following commands.

library(dplyr) #Load `dplyr` package
iris_tibble <- tbl_df(mtcars) #convert `mtcars` `data.frame` into `tibble`



library(tibble) #Load `tibble` package
iris_tibble <- as_data_frame(mtcars) #convert `mtcars` `data.frame` into `tibble`
