# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "http://www.imdb.com/name/nm0004564/"
# Assign the wiki url to `file_url`

Year <- file_url %>%
  read_html() %>%
  html_nodes(css = '#filmography :nth-child(2) .filmo-row .year_column') %>%
  html_text()

Year <- str_extract(string = Year, pattern = "[0-9]{4}")
Year <- str_trim(string = Year)

Film <- file_url %>%
  read_html() %>%
  html_nodes(css = '#filmography :nth-child(2) .filmo-row b a') %>%
  html_text()

Film <- gsub(pattern = "\\.\\.\\.", replacement = "", Film)
Film <- gsub(pattern = "(.*)\\(.*\\).*", replacement = "\\1", Film)
Film <- str_trim(string = Film)

table_mailini  <- data.frame(Year, Film, stringsAsFactors = F)

write.csv(x = table_mailini, file = "hema_malini.csv")
