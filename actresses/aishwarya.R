# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "http://www.imdb.com/name/nm0706787/"
# Assign the wiki url to `file_url`

Year <- file_url %>%
  read_html() %>%
  html_nodes(css = '#filmography :nth-child(2) .filmo-row .year_column') %>%
  html_text()

Year <- gsub(pattern = "\n|/I", replacement = "", x = Year)
Year <- str_trim(string = Year)

Film <- file_url %>%
  read_html() %>%
  html_nodes(css = '#filmography :nth-child(2) .filmo-row b a') %>%
  html_text()

Film <- gsub(pattern = "\\.\\.\\.", replacement = "", Film)
Film <- str_trim(string = Film)

table_aishwarya  <- data.frame(Year, Film, stringsAsFactors = F)

write.csv(x = table_aishwarya, file = "aishwarya.csv")
