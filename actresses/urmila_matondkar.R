# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Urmila_Matondkar_filmography'
# Assign the wiki url to `file_url`

table_urmila <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[1]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_urmila <- table_urmila[[1]]
  # convert `table_urmila` from `list` into `data.frame`

names(table_urmila) <- c("Film", "Year", "Role", "Director", "Notes")
# rename columns

# clean text in column-1
table_urmila$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_urmila$Film)
table_urmila$Film <- str_trim(string = table_urmila$Film)

# clean text in column-2
table_urmila$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_urmila$Year)
table_urmila$Year <- str_trim(string = table_urmila$Year)

# clean text in column-3
table_urmila$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_urmila$Role)
table_urmila$Role <- str_trim(string = table_urmila$Role)

# clean text in column-4
table_urmila$Director <- gsub(pattern = "^$", replacement = NA_character_, x = table_urmila$Director)
table_urmila$Director <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_urmila$Director)
table_urmila$Director <- str_trim(string = table_urmila$Director)

# clean text in column-5
table_urmila$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_urmila$Notes)
table_urmila$Notes <- str_trim(string = table_urmila$Notes)

table_urmila <- select(table_urmila, Year, Film, Role, Notes, Director)

write.csv(x =  table_urmila, file = "urmila_matondkar.csv")
