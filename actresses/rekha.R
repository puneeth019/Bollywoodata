# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Rekha_filmography"
# Assign the wiki url to `file_url`

table_rekha <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_rekha <- table_rekha[[1]]
  # convert `table_rekha` from `list` into `data.frame`

# clean text in column-2
table_rekha$Film <- gsub(pattern = "\\.\\.\\.", replacement = "", x = table_rekha$Film)
table_rekha$Film <- str_trim(string = table_rekha$Film)

# clean text in column-3
table_rekha$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_rekha$Role)
table_rekha$Role <- str_trim(string = table_rekha$Role)

# clean text in column-4
table_rekha$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_rekha$Notes)
table_rekha$Notes <- str_trim(string = table_rekha$Notes)

write.csv(x =  table_rekha, file = "rekha.csv")
