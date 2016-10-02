# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Pooja_Bhatt'
# Assign the wiki url to `file_url`

table_pooja <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[4]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_pooja <- table_pooja[[1]]
  # convert `table_pooja` from `list` into `data.frame`

# clean text in column-1
table_pooja$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_pooja$Year)
table_pooja$Year <- str_trim(string = table_pooja$Year)

# clean text in column-2
table_pooja$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_pooja$Film)
table_pooja$Film <- gsub(pattern = "(.*)\\(.*\\).*", replacement = "\\1", x = table_pooja$Film)
table_pooja$Film <- str_trim(string = table_pooja$Film)

# clean text in column-3
table_pooja$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_pooja$Role)
table_pooja$Role <- str_trim(string = table_pooja$Role)

table_pooja <- select(table_pooja, Year, Film, Role)

write.csv(x =  table_pooja, file = "pooja_bhatt.csv")
