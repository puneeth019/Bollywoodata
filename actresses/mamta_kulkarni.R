# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Mamta_Kulkarni'
# Assign the wiki url to `file_url`

table_mamtakulkarni <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_mamtakulkarni <- table_mamtakulkarni[[1]]
  # convert `table_mamtakulkarni` from `list` into `data.frame`

names(table_mamtakulkarni) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_mamtakulkarni$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_mamtakulkarni$Year)
table_mamtakulkarni$Year <- str_trim(string = table_mamtakulkarni$Year)

# clean text in column-2
table_mamtakulkarni$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_mamtakulkarni$Film)
table_mamtakulkarni$Film <- str_trim(string = table_mamtakulkarni$Film)

# clean text in column-3
table_mamtakulkarni$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_mamtakulkarni$Role)
table_mamtakulkarni$Role <- gsub(pattern = "—", replacement = NA_character_, x = table_mamtakulkarni$Role)
table_mamtakulkarni$Role <- str_trim(string = table_mamtakulkarni$Role)

# clean text in column-4
table_mamtakulkarni$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_mamtakulkarni$Notes)
table_mamtakulkarni$Notes <- str_trim(string = table_mamtakulkarni$Notes)

table_mamtakulkarni <- select(table_mamtakulkarni, Year, Film, Role, Notes)

write.csv(x =  table_mamtakulkarni, file = "mamta_kulkarni.csv")
