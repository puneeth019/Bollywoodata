# Sample script to scrape text from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Poonam_Dhillon"
# Assign the wiki url to `file_url`

Year <- file_url %>%
  read_html() %>%
  html_nodes(css = 'ul:nth-child(17) li') %>%
  html_text()

Year <- str_extract(string = Year, pattern = "[0-9]{4}")
Year <- str_trim(string = Year)

Film <- file_url %>%
  read_html() %>%
  html_nodes(css = 'ul:nth-child(17) i , li:nth-child(2) i a, li:nth-child(1) i a') %>%
  html_text()

Film <- unique(x = Film)
Film <- str_trim(string = Film)
Film[72] <-  NA_character_

table_poonamdhillon  <- data.frame(Year, Film, stringsAsFactors = F)

write.csv(x = table_poonamdhillon, file = "poonam_dhillon.csv")
