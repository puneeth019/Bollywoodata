# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Jaya_Bachchan"
# Assign the wiki url to `file_url`

table_jayabachchan <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_jayabachchan <- table_jayabachchan[[1]]
  # convert `table_jayabachchan` from `list` into `data.frame`

names(table_jayabachchan) <- c("Year", "Film", "Role", "Notes")
  # rename columns

# clean text in column-2
table_jayabachchan$Film <- gsub(pattern = "\\.\\.\\.", replacement = "", x = table_jayabachchan$Film)
table_jayabachchan$Film <- str_trim(string = table_jayabachchan$Film)

# clean text in column-3
table_jayabachchan$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_jayabachchan$Role)
table_jayabachchan$Role <- str_trim(string = table_jayabachchan$Role)

# clean text in column-4
table_jayabachchan$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_jayabachchan$Notes)
table_jayabachchan$Notes <- str_trim(string = table_jayabachchan$Notes)

write.csv(x =  table_jayabachchan, file = "jaya_bachchan.csv")
