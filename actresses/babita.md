# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Babita'
# Assign the wiki url to `file_url`

table_babita <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_babita <- table_babita[[1]]
  # convert `table_babita` from `list` into `data.frame`

names(table_babita) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_babita$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_babita$Year)
table_babita$Year <- str_trim(string = table_babita$Year)

# clean text in column-2
table_babita$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_babita$Film)
table_babita$Film <- str_trim(string = table_babita$Film)

# clean text in column-3
table_babita$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_babita$Role)
table_babita$Role <- str_trim(string = table_babita$Role)

# clean text in column-4
table_babita$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_babita$Notes)
table_babita$Notes <- str_trim(string = table_babita$Notes)

table_babita <- select(table_babita, Year, Film, Role, Notes)
table_babita <- arrange(table_babita, Year, Film)

write.csv(x =  table_babita, file = "babita.csv")
