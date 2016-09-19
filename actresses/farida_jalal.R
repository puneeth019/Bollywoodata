# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Farida_Jalal"
# Assign the wiki url to `file_url`

table_faridajalal <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_faridajalal <- table_faridajalal[[1]]
  # convert `table_faridajalal` from `list` into `data.frame`

# clean text in column-2
table_faridajalal$Film <- gsub(pattern = "(.*)\\(.*\\).*", replacement = "\\1", x = table_faridajalal$Film)
table_faridajalal$Film <- gsub(pattern = "\\.\\.\\.", replacement = "", x = table_faridajalal$Film)
table_faridajalal$Film <- str_trim(string = table_faridajalal$Film)

# clean text in column-3
table_faridajalal$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_faridajalal$Role)
table_faridajalal$Role <- str_trim(string = table_faridajalal$Role)

# clean text in column-4
table_faridajalal$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_faridajalal$Notes)
table_faridajalal$Notes <- str_trim(string = table_faridajalal$Notes)

write.csv(x =  table_faridajalal, file = "farida_jalal.csv")
