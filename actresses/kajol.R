# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Kajol_filmography'
# Assign the wiki url to `file_url`

table_kajol <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[1]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_kajol <- table_kajol[[1]]
  # convert `table_kajol` from `list` into `data.frame`

names(table_kajol) <- c("Film", "Year", "Role", "Director", "Genre", "Notes")
# rename columns

# clean text in column-1
table_kajol$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_kajol$Film)
table_kajol$Film <- str_trim(string = table_kajol$Film)

# clean text in column-2
table_kajol$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_kajol$Year)
table_kajol$Year <- str_trim(string = table_kajol$Year)

# clean text in column-3
table_kajol$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_kajol$Role)
table_kajol$Role <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_kajol$Role)
table_kajol$Role <- gsub(pattern = "(.*)\\[d\\]", replacement = "\\1", x = table_kajol$Role)
table_kajol$Role <- str_trim(string = table_kajol$Role)

# clean text in column-4
table_kajol$Director <- gsub(pattern = "^$", replacement = NA_character_, x = table_kajol$Director)
table_kajol$Director <- str_trim(string = table_kajol$Director)

# clean text in column-5
table_kajol$Genre <- gsub(pattern = "^$", replacement = NA_character_, x = table_kajol$Genre)
table_kajol$Genre <- str_trim(string = table_kajol$Genre)

# clean text in column-6
table_kajol$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_kajol$Notes)
table_kajol$Notes <- str_trim(string = table_kajol$Notes)

table_kajol <- select(table_kajol, Year, Film, Role, Notes)

write.csv(x =  table_kajol, file = "kajol.csv")
