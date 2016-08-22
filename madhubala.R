# Scrape Bollywood Actress data from wiki
library("rvest") # Load `XML` package
library("dplyr") # Load `dplyr` pacakge

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Madhubala"
# Assign the wiki url to `file_url`

table_madhubala <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_madhubala <- table_madhubala[[1]]

names(table_madhubala) <- c("Year", "Film", "Director", "Other_notes")
table_madhubala <- select(table_madhubala, -Other_notes)

table_madhubala$Year <- ifelse(table_madhubala$Year %in% c('', "-", " -", "- ", "_"), NA_character_, table_madhubala$Year)
table_madhubala$Film <- ifelse(table_madhubala$Film %in% c('', "-", " -", "- ", "_"), NA_character_, table_madhubala$Film)
table_madhubala$Director <- ifelse(table_madhubala$Director %in% c('', "-", " -", "- ", "_"), NA_character_, table_madhubala$Director)


write.csv(x =  table_madhubala, file = "madhubala.csv")
