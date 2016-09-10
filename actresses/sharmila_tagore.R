# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Sharmila_Tagore"
# Assign the wiki url to `file_url`

table_sharmilatagore <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_sharmilatagore <- table_sharmilatagore[[1]]
  # Convert `table_sharmilatagore` from `list` into `data.frame`

names(table_sharmilatagore) <- c("Year", "Film", "Director", "Role", "Language")
  # rename columns

# Clean text in column-2
table_sharmilatagore$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = table_sharmilatagore$Film)
table_sharmilatagore$Film <- str_trim(string = table_sharmilatagore$Film)

# clean text in column-3
table_sharmilatagore$Director <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = table_sharmilatagore$Director)
table_sharmilatagore$Director <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = table_sharmilatagore$Director)
table_sharmilatagore$Director <- str_trim(string = table_sharmilatagore$Director)

# clean text in column-4
table_sharmilatagore$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_sharmilatagore$Role)
table_sharmilatagore$Role <- str_trim(string = table_sharmilatagore$Role)

# clean text in column-5
table_sharmilatagore$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_sharmilatagore$Language)
table_sharmilatagore$Language <- str_trim(string = table_sharmilatagore$Language)

write.csv(x =  table_sharmilatagore, file = "sharmila_tagore.csv")
