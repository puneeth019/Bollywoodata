# Scrape Bollywood Actress data from wiki
library(rvest) # Load `XML` package
library(dplyr) # Load `dplyr` package
library(stringr) # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Nargis"
# Assign the wiki url to `file_url`

text_nargis <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/div[4]') %>%
  html_text(trim = T)

# Clean the text

text_nargis_upd <- str_split(string = text_nargis, pattern = "\n")
text_nargis_upd <- text_nargis_upd[[1]]
