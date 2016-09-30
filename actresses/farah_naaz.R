# Sample script to scrape text from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Farah_(actress)'
# Assign the wiki url to `file_url`

Year <- file_url %>%
  read_html() %>%
  html_nodes(css = 'ul:nth-child(15) li') %>%
  html_text()

Year <- str_extract(string = Year, pattern = "[0-9]{4}")
Year <- gsub(pattern = "^$", replacement = NA_integer_, x = Year)
Year <- str_trim(string = Year)

Film <- file_url %>%
  read_html() %>%
  html_nodes(css = 'ul i , ul i a') %>%
  html_text()

Film <- gsub(pattern = "^$", replacement = NA_character_, x = Film)
Film <- str_trim(string = Film)
Film <- unique(x = Film)

table_farah  <- data.frame(Year, Film, stringsAsFactors = F)

write.csv(x = table_farah, file = "farah_nazz.csv")
