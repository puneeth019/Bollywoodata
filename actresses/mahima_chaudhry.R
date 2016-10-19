# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Mahima_Chaudhry'
# Assign the wiki url to `file_url`

table_mahimachaudhry <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_mahimachaudhry <- table_mahimachaudhry[[1]]
  # convert `table_mahimachaudhry` from `list` into `data.frame`

names(table_mahimachaudhry) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_mahimachaudhry$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_mahimachaudhry$Year)
table_mahimachaudhry$Year <- str_trim(string = table_mahimachaudhry$Year)

# clean text in column-2
table_mahimachaudhry$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_mahimachaudhry$Film)
table_mahimachaudhry$Film <- str_trim(string = table_mahimachaudhry$Film)

# clean text in column-3
table_mahimachaudhry$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_mahimachaudhry$Role)
table_mahimachaudhry$Role <- str_trim(string = table_mahimachaudhry$Role)

# clean text in column-4
table_mahimachaudhry$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_mahimachaudhry$Notes)
table_mahimachaudhry$Notes <- str_trim(string = table_mahimachaudhry$Notes)

table_mahimachaudhry <- select(table_mahimachaudhry, Year, Film, Role, Notes)
table_mahimachaudhry <- arrange(table_mahimachaudhry, Year, Film)

write.csv(x =  table_mahimachaudhry, file = "mahima_chaudhry.csv")
