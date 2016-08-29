# Scrape Bollywood Actress data from wiki
library(rvest) # Load `XML` package
library(dplyr) # Load `dplyr` package
library(stringr) # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Bina_Rai"
# Assign the wiki url to `file_url`

text_binarai <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/ul[2]') %>%
  html_text(trim = T)

# text cleaning
text_binarai <- str_split(string = text_binarai, pattern = "\n")

text_binarai <- text_binarai[[1]]
text_binarai <- as.data.frame(text_binarai)
  # convert `text_binarai` `list` into `data.frame`

text_binarai[2] <- NA
  # Initialize 2nd column of `text.binarai`

names(text_binarai) <- c("Year", "Film")
  # rename columns of `text.binarai`

text_binarai$Film <- text_binarai$Year
  # copy column-1 data to column-2

# clean text to get 1st column
text_binarai$Year <- str_trim(string = text_binarai$Year)
text_binarai$Year <- substr(x = text_binarai$Year, start = 1, stop = 4)

# clean text to get 2nd column
text_binarai$Film <- substring(text = text_binarai$Film, first = 7)
text_binarai$Film <- gsub(pattern = "[0-9]|\\[|\\]", replacement = "", x = text_binarai$Film)
text_binarai$Film <- str_trim(string = text_binarai$Film)

write.csv(x = text_binarai, file = "bina_rai.csv")
