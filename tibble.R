#  `tibble` package instead of `dplyr`

library(tibble) #load `tibble` package
iris_tibble <- as_data_frame(mtcars) #convert the class of `mtcars` into `tibble`
