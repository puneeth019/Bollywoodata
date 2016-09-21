# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Parveen_Babi"
# Assign the wiki url to `file_url`

table_praveenbabi <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_praveenbabi <- table_praveenbabi[[1]]
  # convert `table_praveenbabi` from `list` into `data.frame`

# clean text in column-2
table_praveenbabi$Film <- gsub(pattern = ".*(Hindi.*)", replacement = "\\1", x = table_praveenbabi$Film)
table_praveenbabi$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_praveenbabi$Film)
table_praveenbabi$Film <- str_trim(string = table_praveenbabi$Film)

# clean text in column-3
table_praveenbabi$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_praveenbabi$Role)
table_praveenbabi$Role <- str_trim(string = table_praveenbabi$Role)

write.csv(x =  table_praveenbabi, file = "praveen_babi.csv")
