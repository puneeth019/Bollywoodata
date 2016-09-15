# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Rajshree"
# Assign the wiki url to `file_url`

Film <- file_url %>%
  read_html() %>%
  html_nodes(css = 'ol:nth-child(13) a') %>%
  html_text()

Film <- gsub(pattern = "\n|/I", replacement = "", x = Film)
Film <- str_trim(string = Film)

Year <- file_url %>%
  read_html() %>%
  html_nodes(css = 'ol:nth-child(13) li') %>%
  html_text()

Year <- str_extract(string = Year, pattern = "[0-9]{4}")
Year <- str_trim(string = Year)

table_aishwarya  <- data.frame(Year, Film, stringsAsFactors = F)

write.csv(x = table_aishwarya, file = "rajshree.csv")
