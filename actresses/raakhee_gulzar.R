# Sample script to scrape text from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Rakhee_Gulzar"
# Assign the wiki url to `file_url`

Year <- file_url %>%
  read_html() %>%
  html_nodes(css = '.column-count-3 li') %>%
  html_text()

Year <- str_extract(string = Year, pattern = "[0-9]{4}")
Year <- str_trim(string = Year)

Film <- file_url %>%
  read_html() %>%
  html_nodes(css = '.column-count-3 a') %>%
  html_text()

Film <- gsub(pattern = "\\.\\.\\.", replacement = "", Film)
Film <- str_trim(string = Film)

table_raakhee  <- data.frame(Year, Film, stringsAsFactors = F)

write.csv(x = table_raakhee, file = "raakhee_gulzar.csv")
