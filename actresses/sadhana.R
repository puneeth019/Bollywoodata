# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Sadhana_Shivdasani"
# Assign the wiki url to `file_url`

table_sadhana <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_sadhana <- table_sadhana[[1]]
  # Convert `table_sadhana` from `list` into `data.frame`

names(table_sadhana) <- c("Year", "Film", "Role", "notes")
  # rename columns

# clean text in column-1
table_sadhana$Year <- str_trim(string = table_sadhana$Year)

# clean text in column-2
table_sadhana$Film <- table_sadhana$Film
table_sadhana$Film <- gsub(pattern = "(.*)\\[.*", replacement = "\\1", x = table_sadhana$Film)
table_sadhana$Film <- gsub(pattern = "(.*)\\?.*", replacement = "\\1", x = table_sadhana$Film)
table_sadhana$Film <- str_trim(string = table_sadhana$Film)

# clean text in column-3
table_sadhana$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_sadhana$Role)
table_sadhana$Role <- str_trim(string = table_sadhana$Role)

# clean text in column-4
table_sadhana$notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_sadhana$notes)
table_sadhana$notes <- str_trim(string = table_sadhana$notes)

write.csv(x =  table_sadhana, file = "sadhana.csv")
