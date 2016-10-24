# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Simran_(actress)'
# Assign the wiki url to `file_url`

table_simran <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_simran <- table_simran[[1]]
  # convert `table_simran` from `list` into `data.frame`

names(table_simran) <- c("Year", "Film", "Role", "Language", "Notes")
# rename columns

# clean text in column-1
table_simran$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_simran$Year)
table_simran$Year <- str_trim(string = table_simran$Year)

# clean text in column-2
table_simran$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_simran$Film)
table_simran$Film <- str_trim(string = table_simran$Film)

# clean text in column-3
table_simran$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_simran$Role)
table_simran$Role <- str_trim(string = table_simran$Role)

# clean text in column-4
table_simran$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_simran$Language)
table_simran$Language <- str_trim(string = table_simran$Language)

# clean text in column-5
table_simran$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_simran$Notes)
table_simran$Notes <- str_trim(string = table_simran$Notes)

table_simran <- select(table_simran, Year, Film, Role, Notes, Language)
table_simran <- arrange(table_simran, Year, Film)

write.csv(x =  table_simran, file = "simran.csv")
