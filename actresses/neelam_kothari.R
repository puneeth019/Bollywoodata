# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Neelam_Kothari'
# Assign the wiki url to `file_url`

table_neelam <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_neelam <- table_neelam[[1]]
  # convert `table_neelam` from `list` into `data.frame`

names(table_neelam) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_neelam$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_neelam$Year)
table_neelam$Year <- str_trim(string = table_neelam$Year)

# clean text in column-2
table_neelam$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_neelam$Film)
table_neelam$Film <- str_trim(string = table_neelam$Film)

# clean text in column-3
table_neelam$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_neelam$Role)
table_neelam$Role <- str_trim(string = table_neelam$Role)

# clean text in column-4
table_neelam$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_neelam$Notes)
table_neelam$Notes <- str_trim(string = table_neelam$Notes)

table_neelam <- select(table_neelam, Year, Film, Role, Notes)

write.csv(x =  table_neelam, file = "neelam_kothari.csv")
