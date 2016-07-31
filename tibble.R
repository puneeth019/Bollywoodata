#  `tibble` package to convert `data.frame` into `tibble`

library(tibble) #load `tibble` package
iris_tibble <- as_data_frame(mtcars) #convert the class of `mtcars` into `tibble`
