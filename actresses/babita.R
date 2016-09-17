# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Babita"
# Assign the wiki url to `file_url`

table_babita <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_babita <- table_babita[[1]]
  # convert `table_babita` from `list` into `data.frame`

# clean text in column-2
table_babita$Film <- gsub(pattern = "\\?", replacement = "", x = table_babita$Film)
table_babita$Film <- str_trim(string = table_babita$Film)

# clean text in column-3
table_babita$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_babita$Role)
table_babita$Role <- str_trim(string = table_babita$Role)

write.csv(x =  table_babita, file = "babita.csv")
