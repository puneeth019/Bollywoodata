# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Madhuri_Dixit_filmography'
# Assign the wiki url to `file_url`

table_madhuri <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[1]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_madhuri <- table_madhuri[[1]]
  # convert `table_madhuri` from `list` into `data.frame`

names(table_madhuri) <- c("Film", "Year", "Role", "Director", "Notes")
# rename columns

# clean text in column-1
table_madhuri$Film <- gsub(pattern = "!", replacement = "", x = table_madhuri$Film)
table_madhuri$Film <- gsub(pattern = "\\.\\.", replacement = "", x = table_madhuri$Film)
table_madhuri$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_madhuri$Film)
table_madhuri$Film <- str_trim(string = table_madhuri$Film)

# clean text in column-2
table_madhuri$Year <- gsub(pattern = "!", replacement = "", x = table_madhuri$Year)
table_madhuri$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_madhuri$Year)
table_madhuri$Year <- str_trim(string = table_madhuri$Year)

# clean text in column-3
table_madhuri$Role <- gsub(pattern = "!", replacement = "", x = table_madhuri$Role)
table_madhuri$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_madhuri$Role)
table_madhuri$Role <- str_trim(string = table_madhuri$Role)

# clean text in column-4
table_madhuri$Director <- gsub(pattern = "!", replacement = "", x = table_madhuri$Director)
table_madhuri$Director <- gsub(pattern = "^$", replacement = NA_character_, x = table_madhuri$Director)
table_madhuri$Director <- str_trim(string = table_madhuri$Director)

# clean text in column-5.
table_madhuri$Notes <- gsub(pattern = "!", replacement = "", x = table_madhuri$Notes)
table_madhuri$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_madhuri$Notes)
table_madhuri$Notes <- str_trim(string = table_madhuri$Notes)

table_madhuri <- select(table_madhuri, Year, Film, Role, Notes, Director)

write.csv(x =  table_madhuri, file = "madhuri_dixit.csv")
