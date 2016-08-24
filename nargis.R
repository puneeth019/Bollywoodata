# Scrape Bollywood Actress data from wiki
library(rvest) # Load `XML` package
library(dplyr) # Load `dplyr` package
library(stringr) # Load `stringr` package

setwd("~Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Nargis"
# Assign the wiki url to `file_url`

text_nargis <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/div[4]') %>%
  html_text(trim = T)

# text cleaning
text_nargis <- str_split(string = text_nargis, pattern = "\n")

text_nargis <- text_nargis[[1]]
text_nargis <- as.data.frame(text_nargis)
  # convert `text_nargis` `list` into `data.frame`

text_nargis[2] <- NA
  # Initialize 2nd column of `text.nargis`

names(text_nargis) <- c("Year", "Film")
  # rename columns of `text.nargis`

text_nargis$Film <- text_nargis$Year
  # copy column-1 data to column-2

text_nargis$Year <- text_nargis$Film
text_nargis$Year <- gsub(pattern = '.*\\((.*?)\\)', replacement = '\\1', x = text_nargis$Year)
text_nargis$Year <- gsub(pattern = '[a-z]', replacement = NA_character_, x = text_nargis$Year)
text_nargis$Year

aa <- gsub(pattern = '.*\\((.*)\\)', replacement = ' ', x = text_nargis$Film)
aa
