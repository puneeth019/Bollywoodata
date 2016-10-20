# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Nandita_Das'
# Assign the wiki url to `file_url`

table_nanditadas <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_nanditadas <- table_nanditadas[[1]]
  # convert `table_nanditadas` from `list` into `data.frame`

names(table_nanditadas) <- c("Year", "Film", "Role", "Language", "Notes")
# rename columns

# clean text in column-1
table_nanditadas$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_nanditadas$Year)
table_nanditadas$Year <- str_trim(string = table_nanditadas$Year)

# clean text in column-2
table_nanditadas$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_nanditadas$Film)
table_nanditadas$Film <- str_trim(string = table_nanditadas$Film)

# clean text in column-3
table_nanditadas$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_nanditadas$Role)
table_nanditadas$Role <- str_trim(string = table_nanditadas$Role)

# clean text in column-4
table_nanditadas$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_nanditadas$Language)
table_nanditadas$Language <- str_trim(string = table_nanditadas$Language)

# clean text in column-5
table_nanditadas$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_nanditadas$Notes)
table_nanditadas$Notes <- str_trim(string = table_nanditadas$Notes)

table_nanditadas <- select(table_nanditadas, Year, Film, Role, Notes, Language)

write.csv(x =  table_nanditadas, file = "nandita_das.csv")
