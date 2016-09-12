# Scrape Bollywood Actress data from wiki
library(rvest) # Load `XML` package
library(dplyr) # Load `dplyr` package
library(stringr) # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Mumtaz_Shanti"
# Assign the wiki url to `file_url`

table_mumtazshanti <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/ol') %>%
  html_text(trim = T)

# text cleaning
table_mumtazshanti <- str_split(string = table_mumtazshanti, pattern = "\n")

table_mumtazshanti <- table_mumtazshanti[[1]]
table_mumtazshanti <- as.character(table_mumtazshanti)
table_mumtazshanti <- as.data.frame(table_mumtazshanti)
  # convert `table_mumtazshanti` `list` into `data.frame`

table_mumtazshanti[2] <- NA
  # Initialize 2nd column of `text.nargis`

names(table_mumtazshanti) <- c("Year", "Film")
  # rename columns of `text.nargis`

table_mumtazshanti$Film <- table_mumtazshanti$Year
  # copy column-1 data to column-2

# clean text in column-1
table_mumtazshanti$Year <- gsub(pattern = '[a-zA-Z]', replacement = '', x = table_mumtazshanti$Year)
table_mumtazshanti$Year <- gsub(pattern = '\\(|\\)', replacement = '', x = table_mumtazshanti$Year)
table_mumtazshanti$Year <- str_trim(string = table_mumtazshanti$Year)

# clean text in column-2
table_mumtazshanti$Film <- gsub(pattern = '[0-9]|\\(|\\)', replacement = '', x = table_mumtazshanti$Film)
table_mumtazshanti$Film <- str_trim(string = table_mumtazshanti$Film)

write.csv(x = table_mumtazshanti, file = "mumtaz_shanti.csv")
