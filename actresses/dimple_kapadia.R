# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Dimple_Kapadia"
# Assign the wiki url to `file_url`

table_dimple <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_dimple <- table_dimple[[1]]
  # convert `table_dimple` from `list` into `data.frame`

# clean text in column-2
table_dimple$Film <- gsub(pattern = "\\.\\.\\.", replacement = "", x = table_dimple$Film)
table_dimple$Film <- gsub(pattern = "\\?", replacement = "", x = table_dimple$Film)
table_dimple$Film <- str_trim(string = table_dimple$Film)

# clean text in column-3
table_dimple$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_dimple$Role)
table_dimple$Role <- str_trim(string = table_dimple$Role)

# clean text in column-4
table_dimple$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_dimple$Notes)
table_dimple$Notes <- str_trim(string = table_dimple$Notes)

write.csv(x =  table_dimple, file = "dimple_kapadia.csv")
