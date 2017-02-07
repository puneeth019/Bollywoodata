# Scrape Bollywood Actress data
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` package

file_url <- "http://www.imdb.com/name/nm0706787/"
# Assign the wiki url to `file_url`

Year <- file_url %>%
  read_html() %>%
  html_nodes(css = '#filmography :nth-child(2) .filmo-row .year_column') %>%
  html_text() %>%
  gsub(pattern = "\n|/I", replacement = "") %>%
  str_trim()

Film <- file_url %>%
  read_html() %>%
  html_nodes(css = '#filmography :nth-child(2) .filmo-row b a') %>%
  html_text() %>%
  gsub(pattern = "\\.\\.\\.", replacement = "") %>%
  str_trim()

table_aishwarya  <- data.frame(Year, Film, stringsAsFactors = F)

write.csv(x = table_aishwarya, file = "aishwarya.csv")
