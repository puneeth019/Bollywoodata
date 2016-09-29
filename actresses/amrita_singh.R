# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Amrita_Singh"
# Assign the wiki url to `file_url`

table_amritasingh <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_amritasingh <- table_amritasingh[[1]]
  # convert `table_amritasingh` from `list` into `data.frame`

names(table_amritasingh) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_amritasingh$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_amritasingh$Year)
table_amritasingh$Year <- str_trim(string = table_amritasingh$Year)

# clean text in column-2
table_amritasingh$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_amritasingh$Film)
table_amritasingh$Film <- str_trim(string = table_amritasingh$Film)

# clean text in column-3
table_amritasingh$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_amritasingh$Role)
table_amritasingh$Role <- str_trim(string = table_amritasingh$Role)

# clean text in column-4
table_amritasingh$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_amritasingh$Notes)
table_amritasingh$Notes <- str_trim(string = table_amritasingh$Notes)

write.csv(x =  table_amritasingh, file = "amrita_singh.csv")
