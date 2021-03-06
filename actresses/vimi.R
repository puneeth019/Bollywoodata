# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Vimi"
# Assign the wiki url to `file_url`

Year <- file_url %>%
  read_html() %>%
  html_nodes(css = 'ul:nth-child(17) li') %>%
  html_text()

Year <- str_extract(string = Year, pattern = "[0-9]{4}")
Year <- str_trim(string = Year)

Film <- file_url %>%
  read_html() %>%
  html_nodes(css = 'ul i , li i a') %>%
  html_text()

Film <- unique(x = Film)
Film <- str_trim(string = Film)

table_vimi  <- data.frame(Year, Film, stringsAsFactors = F)

write.csv(x = table_vimi, file = "vimi.csv")
