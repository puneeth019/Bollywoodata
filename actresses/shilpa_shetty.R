# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Shilpa_Shetty'
# Assign the wiki url to `file_url`

table_shilpashetty <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[4]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_shilpashetty <- table_shilpashetty[[1]]
  # convert `table_shilpashetty` from `list` into `data.frame`

names(table_shilpashetty) <- c("Year", "Film", "Role", "Language", "Notes")
# rename columns

# clean text in column-1
table_shilpashetty$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_shilpashetty$Year)
table_shilpashetty$Year <- str_trim(string = table_shilpashetty$Year)

# clean text in column-2
table_shilpashetty$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_shilpashetty$Film)
table_shilpashetty$Film <- gsub(pattern = "\\.\\.\\.", replacement = " ", x = table_shilpashetty$Film)
table_shilpashetty$Film <- str_trim(string = table_shilpashetty$Film)

# clean text in column-3
table_shilpashetty$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_shilpashetty$Role)
table_shilpashetty$Role <- str_trim(string = table_shilpashetty$Role)

# clean text in column-4
table_shilpashetty$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_shilpashetty$Language)
table_shilpashetty$Language <- str_trim(string = table_shilpashetty$Language)

# clean text in column-5
table_shilpashetty$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_shilpashetty$Notes)
table_shilpashetty$Notes <- str_trim(string = table_shilpashetty$Notes)

table_shilpashetty <- select(table_shilpashetty, Year, Film, Role, Notes, Language)
table_shilpashetty <- arrange(table_shilpashetty, Year, Film)

write.csv(x =  table_shilpashetty, file = "shilpa_shetty.csv")
