# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Sushmita_Sen'
# Assign the wiki url to `file_url`

table_sushmitasen <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_sushmitasen <- table_sushmitasen[[1]]
  # convert `table_sushmitasen` from `list` into `data.frame`

names(table_sushmitasen) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_sushmitasen$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_sushmitasen$Year)
table_sushmitasen$Year <- str_trim(string = table_sushmitasen$Year)

# clean text in column-2
table_sushmitasen$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_sushmitasen$Film)
table_sushmitasen$Film <- gsub(pattern = "\\.\\.\\.", replacement = "", x = table_sushmitasen$Film)
table_sushmitasen$Film <- gsub(pattern = "?", replacement = "", x = table_sushmitasen$Film)
table_sushmitasen$Film <- str_trim(string = table_sushmitasen$Film)

# clean text in column-3
table_sushmitasen$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_sushmitasen$Role)
table_sushmitasen$Role <- str_trim(string = table_sushmitasen$Role)

# clean text in column-4
table_sushmitasen$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_sushmitasen$Notes)
table_sushmitasen$Notes <- str_trim(string = table_sushmitasen$Notes)

table_sushmitasen <- select(table_sushmitasen, Year, Film, Role, Notes)
table_sushmitasen <- arrange(table_sushmitasen, Year, Film)

write.csv(x =  table_sushmitasen, file = "sushmita_sen.csv")
