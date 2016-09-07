# Scrape Bollywood Actress data from wiki
library(rvest) # Load `XML` package
library(dplyr) # Load `dplyr` package
library(stringr) # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Asha_Parekh"
# Assign the wiki url to `file_url`

text_ashaparekh <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/ul[1]') %>%
  html_text(trim = T)

# text cleaning
text_ashaparekh <- str_split(string = text_ashaparekh, pattern = "\n")

text_ashaparekh <- text_ashaparekh[[1]]
text_ashaparekh <- as.data.frame(text_ashaparekh)
  # convert `text_ashaparekh` `list` into `data.frame`

text_ashaparekh[2] <- NA
  # Initialize 2nd column of `text.ashaparekh`

names(text_ashaparekh) <- c("Year", "Film")
  # rename columns of `text.ashaparekh`

text_ashaparekh$Film <- text_ashaparekh$Year
  # copy column-1 data to column-2

# clean text to get 1st column
aa <- text_ashaparekh$Year
aa <- str_trim(string = aa)

# clean text to get 2nd column
text_ashaparekh$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = text_ashaparekh$Film)
text_ashaparekh$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = text_ashaparekh$Film)
text_ashaparekh$Film <- str_trim(string = text_ashaparekh$Film)

write.csv(x = text_ashaparekh, file = "asha_parekh.csv")
