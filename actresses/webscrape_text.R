# Sample script to scrape text from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- ''
# Assign the wiki url to `file_url`

Year <- file_url %>%
  read_html() %>%
  html_nodes(css = '') %>%
  html_text()

Year <- gsub(pattern = "^$", replacement = NA_integer_, x = Year)
Year <- str_trim(string = Year)

Film <- file_url %>%
  read_html() %>%
  html_nodes(css = '') %>%
  html_text()

Film <- gsub(pattern = "^$", replacement = NA_character_, x = Film)
Film <- str_trim(string = Film)

table_aishwarya  <- data.frame(Year, Film, stringsAsFactors = F)

write.csv(x = table_aishwarya, file = "aishwarya.csv")
