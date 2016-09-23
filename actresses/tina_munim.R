# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Tina_Ambani"
# Assign the wiki url to `file_url`

table_tinamunim <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_tinamunim <- table_tinamunim[[1]]
  # convert `table_tinamunim` from `list` into `data.frame`

# clean text in column-2
table_tinamunim$Film <- gsub(pattern = "\\?", replacement = "", x = table_tinamunim$Film)
table_tinamunim$Film <- str_trim(string = table_tinamunim$Film)

# clean text in column-3
table_tinamunim$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_tinamunim$Role)
table_tinamunim$Role <- str_trim(string = table_tinamunim$Role)

# clean text in column-4
table_tinamunim$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_tinamunim$Notes)
table_tinamunim$Notes <- str_trim(string = table_tinamunim$Notes)

write.csv(x =  table_tinamunim, file = "tina_munim.csv")
