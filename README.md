###Differences between [`dplyr`](https://cran.r-project.org/web/packages/dplyr/index.html) and [`tibble`](https://cran.r-project.org/web/packages/tibble/index.html) packages to convert `data.frame` into `tibble`

In [dplyr.R](https://github.com/puneeth019/playground/blob/master/dplyr.R), `dplyr` package is used to convert the class of dataset `mtcars` from `data.frame` into `tibble` using the following commands:

```R
library(dplyr) #load `dplyr` package
mtcars_dplyr <- tbl_df(data = mtcars) #convert the class of `mtcars` into `tibble`
```
In [tibble.R](https://github.com/puneeth019/playground/blob/master/tibble.R), `tibble` package is used to convert the class of dataset `mtcars` from `data.frame` into `tibble` using the following commands:

```R
library(tibble) #load `tibble` package
mtcars_tibble <- as_data_frame(x = mtcars) #convert the class of `mtcars` into `tibble`
```
Check if `mtcars_dplyr` & `mtcars_tibble` are identical

```R
identical(x = mtcars_dplyr, y = mtcars_tibble)
[1] TRUE
```
