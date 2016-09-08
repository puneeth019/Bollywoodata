# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Madhubala"
# Assign the wiki url to `file_url`

table_madhubala <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_madhubala <- table_madhubala[[1]]
  # convert `table_madhubala` from `list` into `data.frame`

names(table_madhubala) <- c("Year", "Film", "Director", "Notes")
  # rename columns

# clean text in column-2
table_madhubala$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = table_madhubala$Film)
table_madhubala$Film <- str_trim(string = table_madhubala$Film)

# clean text in column-3
table_madhubala$Director <- str_trim(string = table_madhubala$Director)

# clean text in column-4
table_madhubala$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_madhubala$Notes)
table_madhubala$Notes <- str_trim(string = table_madhubala$Notes)

write.csv(x =  table_madhubala, file = "madhubala.csv")
