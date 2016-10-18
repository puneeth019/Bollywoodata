# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Mumtaz_(actress)'
# Assign the wiki url to `file_url`

table_mumtaz <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_mumtaz <- table_mumtaz[[1]]
  # convert `table_mumtaz` from `list` into `data.frame`

names(table_mumtaz) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_mumtaz$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_mumtaz$Year)
table_mumtaz$Year <- str_trim(string = table_mumtaz$Year)

# clean text in column-2
table_mumtaz$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_mumtaz$Film)
table_mumtaz$Film <- str_trim(string = table_mumtaz$Film)

# clean text in column-3
table_mumtaz$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_mumtaz$Role)
table_mumtaz$Role <- str_trim(string = table_mumtaz$Role)

# clean text in column-4
table_mumtaz$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_mumtaz$Notes)
table_mumtaz$Notes <- str_trim(string = table_mumtaz$Notes)

table_mumtaz <- select(table_mumtaz, Year, Film, Role, Notes)
table_mumtaz <- arrange(table_mumtaz, Year, Film)

write.csv(x =  table_mumtaz, file = "mumtaz.csv")
