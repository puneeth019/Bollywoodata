# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Zeenat_Aman"
# Assign the wiki url to `file_url`

table_zeenataman <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_zeenataman <- table_zeenataman[[1]]
  # convert `table_zeenataman` from `list` into `data.frame`

# clean text in column-2
table_zeenataman$Film <- gsub(pattern = "\\.\\.\\.", replacement = "", x = table_zeenataman$Film)
table_zeenataman$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_zeenataman$Film)
table_zeenataman$Film <- str_trim(string = table_zeenataman$Film)

# clean text in column-3
table_zeenataman$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_zeenataman$Role)
table_zeenataman$Role <- str_trim(string = table_zeenataman$Role)

# clean text in column-4
table_zeenataman$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_zeenataman$Notes)
table_zeenataman$Notes <- str_trim(string = table_zeenataman$Notes)

write.csv(x =  table_zeenataman, file = "zeenat_aman.csv")
