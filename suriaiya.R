# Scrape Bollywood Actress names from wiki
library("rvest") # Load `XML` package
library("dplyr") # Load `dplyr` pacakge

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Suraiya"
# Assign the wiki url to `file_url`

table_suraiya <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_suraiya <- table_suraiya[[1]]

names(table_suraiya) <- c("Year", "Film", "Director", "Producer", "Role", "Cast", "Music_Director", "Other_notes")
table_suraiya <- select(table_suraiya, -Other_notes, -Cast)

table_suraiya$Role <- ifelse(table_suraiya$Role %in% c('', '_', "-", " -", "- ", "-"), NA_character_, table_suraiya$Role)
