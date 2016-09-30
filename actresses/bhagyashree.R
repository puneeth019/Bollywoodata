# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Bhagyashree'
# Assign the wiki url to `file_url`

table_bhagyashree <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_bhagyashree <- table_bhagyashree[[1]]
  # convert `table_bhagyashree` from `list` into `data.frame`

names(table_bhagyashree) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_bhagyashree$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_bhagyashree$Year)
table_bhagyashree$Year <- str_trim(string = table_bhagyashree$Year)

# clean text in column-2
table_bhagyashree$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_bhagyashree$Film)
table_bhagyashree$Film <- str_trim(string = table_bhagyashree$Film)

# clean text in column-3
table_bhagyashree$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_bhagyashree$Role)
table_bhagyashree$Role <- str_trim(string = table_bhagyashree$Role)

# clean text in column-4
table_bhagyashree$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_bhagyashree$Notes)
table_bhagyashree$Notes <- str_trim(string = table_bhagyashree$Notes)

table_bhagyashree <- select(table_bhagyashree, Year, Film, Role, Notes)

write.csv(x =  table_bhagyashree, file = "bhagyashree.csv")
