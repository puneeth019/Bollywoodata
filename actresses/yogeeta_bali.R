# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Yogeeta_Bali'
# Assign the wiki url to `file_url`

table_yogeeta <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_yogeeta <- table_yogeeta[[1]]
  # convert `table_yogeeta` from `list` into `data.frame`

# clean text in column-1
table_yogeeta$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_yogeeta$Year)
table_yogeeta$Year <- str_trim(string = table_yogeeta$Year)

# clean text in column-2
table_yogeeta$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_yogeeta$Film)
table_yogeeta$Film <- str_trim(string = table_yogeeta$Film)

# clean text in column-3
table_yogeeta$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_yogeeta$Role)
table_yogeeta$Role <- str_trim(string = table_yogeeta$Role)

table_yogeeta <- select(table_yogeeta, Year, Film, Role)

write.csv(x =  table_yogeeta, file = "yogeeta_bali.csv")
