# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Nutan"
# Assign the wiki url to `file_url`

table_nutan <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_nutan <- table_nutan[[1]]
  # Convert `table_nutan` from `list` into `data.frame`

names(table_nutan) <- c("Year", "Film", "Role", "Notes")
  # rename columns

# replace missing values with `NA`s
table_nutan$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_nutan$Year)
table_nutan$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_nutan$Film)
table_nutan$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_nutan$Role)
table_nutan$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_nutan$Notes)

# clean text
table_nutan$Year <- str_trim(string = table_nutan$Year)
table_nutan$Film <- str_trim(string = table_nutan$Film)
table_nutan$Role <- str_trim(string = table_nutan$Role)
table_nutan$Notes <- str_trim(string = table_nutan$Notes)

write.csv(x =  table_nutan, file = "nutan.csv")
