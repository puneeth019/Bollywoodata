# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Jaya_Prada'
# Assign the wiki url to `file_url`

table_jayaprada <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_jayaprada <- table_jayaprada[[1]]
  # convert `table_jayaprada` from `list` into `data.frame`

names(table_jayaprada) <- c("Year", "Film", "Language", "Notes")
  # rename columns

# clean text in column-2
table_jayaprada$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_jayaprada$Film)
table_jayaprada$Film <- str_trim(string = table_jayaprada$Film)

# clean text in column-3
table_jayaprada$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_jayaprada$Language)
table_jayaprada$Language <- str_trim(string = table_jayaprada$Language)
  
# clean text in column-4
table_jayaprada$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_jayaprada$Notes)
table_jayaprada$Notes <- str_trim(string = table_jayaprada$Notes)

write.csv(x =  table_jayaprada, file = "jaya_prada.csv")
