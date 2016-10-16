# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- ''
# Assign the wiki url to `file_url`

table_meenakshi <- file_url %>%
  read_html() %>%
  html_nodes(xpath='') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_meenakshi <- table_meenakshi[[1]]
  # convert `table_meenakshi` from `list` into `data.frame`

names(table_meenakshi) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_meenakshi$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_meenakshi$Year)
table_meenakshi$Year <- str_trim(string = table_meenakshi$Year)

# clean text in column-2
table_meenakshi$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_meenakshi$Film)
table_meenakshi$Film <- str_trim(string = table_meenakshi$Film)

# clean text in column-3
table_meenakshi$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_meenakshi$Role)
table_meenakshi$Role <- str_trim(string = table_meenakshi$Role)

# clean text in column-4
table_meenakshi$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_meenakshi$Notes)
table_meenakshi$Notes <- str_trim(string = table_meenakshi$Notes)

table_meenakshi <- select(table_meenakshi, Year, Film, Role, Notes)

write.csv(x =  table_meenakshi, file = "meenakshi.csv")
