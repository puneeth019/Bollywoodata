###Differences between [`dplyr`](https://cran.r-project.org/web/packages/dplyr/index.html) and [`tibble`](https://cran.r-project.org/web/packages/tibble/index.html) packages to convert `data.frame` into `tibble`

In [dplyr.R](https://github.com/puneeth019/playground/blob/master/dplyr.R), `dplyr` package is used to convert the dataset `mtcars` from `data.frame` into `tibble`

```R
library(dplyr) #load `dplyr` package
mtcars_dplyr <- tbl_df(data = mtcars) #convert the class of `mtcars` into `tibble`
mtcars_dplyr

# A tibble: 32 x 11
     mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
*  <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
1   21.0     6 160.0   110  3.90 2.620 16.46     0     1     4     4
2   21.0     6 160.0   110  3.90 2.875 17.02     0     1     4     4
3   22.8     4 108.0    93  3.85 2.320 18.61     1     1     4     1
4   21.4     6 258.0   110  3.08 3.215 19.44     1     0     3     1
5   18.7     8 360.0   175  3.15 3.440 17.02     0     0     3     2
6   18.1     6 225.0   105  2.76 3.460 20.22     1     0     3     1
7   14.3     8 360.0   245  3.21 3.570 15.84     0     0     3     4
8   24.4     4 146.7    62  3.69 3.190 20.00     1     0     4     2
9   22.8     4 140.8    95  3.92 3.150 22.90     1     0     4     2
10  19.2     6 167.6   123  3.92 3.440 18.30     1     0     4     4
# ... with 22 more rows
```
In [tibble.R](https://github.com/puneeth019/playground/blob/master/tibble.R), `tibble` package is used to convert the dataset `mtcars` from `data.frame` into `tibble`

```R
library(tibble) #load `tibble` package
mtcars_tibble <- as_data_frame(x = mtcars) #convert the class of `mtcars` into `tibble`
mtcars_tibble

# A tibble: 32 x 11
     mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
*  <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
1   21.0     6 160.0   110  3.90 2.620 16.46     0     1     4     4
2   21.0     6 160.0   110  3.90 2.875 17.02     0     1     4     4
3   22.8     4 108.0    93  3.85 2.320 18.61     1     1     4     1
4   21.4     6 258.0   110  3.08 3.215 19.44     1     0     3     1
5   18.7     8 360.0   175  3.15 3.440 17.02     0     0     3     2
6   18.1     6 225.0   105  2.76 3.460 20.22     1     0     3     1
7   14.3     8 360.0   245  3.21 3.570 15.84     0     0     3     4
8   24.4     4 146.7    62  3.69 3.190 20.00     1     0     4     2
9   22.8     4 140.8    95  3.92 3.150 22.90     1     0     4     2
10  19.2     6 167.6   123  3.92 3.440 18.30     1     0     4     4
# ... with 22 more rows
```
Check if `mtcars_dplyr` & `mtcars_tibble` are identical

```R
identical(x = mtcars_dplyr, y = mtcars_tibble)
# [1] TRUE
```
