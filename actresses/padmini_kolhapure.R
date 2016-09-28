# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Padmini_Kolhapure"
# Assign the wiki url to `file_url`

table_padmini <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_padmini <- table_padmini[[1]]
  # convert `table_padmini` from `list` into `data.frame`

# clean text in column-2
table_padmini$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = table_padmini$Film)
table_padmini$Film <- str_trim(string = table_padmini$Film)

# clean text in column-3
table_padmini$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_padmini$Role)
table_padmini$Role <- str_trim(string = table_padmini$Role)

# clean text in column-4
table_padmini$Notes <- gsub(pattern = "(.*)\\[.*", replacement = "\\1", x = table_padmini$Notes)
table_padmini$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_padmini$Notes)
table_padmini$Notes <- str_trim(string = table_padmini$Notes)

write.csv(x =  table_padmini, file = "padmini_kolhapure.csv")
