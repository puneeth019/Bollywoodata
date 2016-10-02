# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Kimi_Katkar'
# Assign the wiki url to `file_url`

table_kimikatkar <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_kimikatkar <- table_kimikatkar[[1]]
  # convert `table_kimikatkar` from `list` into `data.frame`

names(table_kimikatkar) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_kimikatkar$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_kimikatkar$Year)
table_kimikatkar$Year <- str_trim(string = table_kimikatkar$Year)

# clean text in column-2
table_kimikatkar$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_kimikatkar$Film)
table_kimikatkar$Film <- str_trim(string = table_kimikatkar$Film)

# clean text in column-3
table_kimikatkar$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_kimikatkar$Role)
table_kimikatkar$Role <- str_trim(string = table_kimikatkar$Role)

table_kimikatkar <- select(table_kimikatkar, Year, Film, Role)

write.csv(x =  table_kimikatkar, file = "kimi_katkar.csv")
