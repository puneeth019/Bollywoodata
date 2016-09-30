# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Juhi_Chawla'
# Assign the wiki url to `file_url`

table_juhichawla <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_juhichawla <- table_juhichawla[[1]]
  # convert `table_juhichawla` from `list` into `data.frame`

names(table_juhichawla) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_juhichawla$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_juhichawla$Year)
table_juhichawla$Year <- str_trim(string = table_juhichawla$Year)

# clean text in column-2
table_juhichawla$Film <- gsub(pattern = "\\.\\.\\.", replacement = "", x = table_juhichawla$Film)
table_juhichawla$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_juhichawla$Film)
table_juhichawla$Film <- str_trim(string = table_juhichawla$Film)

# clean text in column-3
table_juhichawla$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_juhichawla$Role)
table_juhichawla$Role <- str_trim(string = table_juhichawla$Role)

# clean text in column-4
table_juhichawla$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_juhichawla$Notes)
table_juhichawla$Notes <- str_trim(string = table_juhichawla$Notes)

table_juhichawla <- select(table_juhichawla, Year, Film, Role, Notes)

write.csv(x =  table_juhichawla, file = "juhi_chawla.csv")
