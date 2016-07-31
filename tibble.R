#  This code demonstrates usage of `tibble` package instead of `dplyr`

library(tibble) #Load `tibble` package
iris_tibble <- as_data_frame(mtcars) #convert `mtcars` `data.frame` into `tibble`
