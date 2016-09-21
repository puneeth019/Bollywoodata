# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Reena_Roy"
# Assign the wiki url to `file_url`

table_reenaroy <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_reenaroy <- table_reenaroy[[1]]
  # convert `table_reenaroy` from `list` into `data.frame`

# clean text in column-2
table_reenaroy$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = table_reenaroy$Film)
table_reenaroy$Film <- str_trim(string = table_reenaroy$Film)

# clean text in column-3
table_reenaroy$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_reenaroy$Role)
table_reenaroy$Role <- str_trim(string = table_reenaroy$Role)

# clean text in column-4
table_reenaroy$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_reenaroy$Notes)
table_reenaroy$Notes <- str_trim(string = table_reenaroy$Notes)

write.csv(x =  table_reenaroy, file = "reena_roy.csv")
