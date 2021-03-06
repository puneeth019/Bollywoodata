# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Asha_Parekh"
# Assign the wiki url to `file_url`

text_ashaparekh <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/ul[1]') %>%
  html_text(trim = T)

# clean text
text_ashaparekh <- str_split(string = text_ashaparekh, pattern = "\n")

text_ashaparekh <- text_ashaparekh[[1]]
text_ashaparekh <- as.data.frame(text_ashaparekh)
  # convert `text_ashaparekh` `list` into `data.frame`

text_ashaparekh[2] <- NA
  # Initialize 2nd column of `text_ashaparekh`

text_ashaparekh[3] <- NA
# Initialize 3rd column of `text_ashaparekh`

names(text_ashaparekh) <- c("Year", "Film", "Role")
  # rename columns of `text_ashaparekh`

text_ashaparekh$Film <- text_ashaparekh$Year
  # copy column-1 data to column-2

text_ashaparekh$Role <- text_ashaparekh$Year
# copy column-1 data to column-2

# clean text in column-1
text_ashaparekh$Year <- gsub(pattern = ".*([0-9]{4}).*", replacement = "\\1", x = text_ashaparekh$Year)
text_ashaparekh$Year <- str_trim(string = text_ashaparekh$Year)

# clean text in column-2
text_ashaparekh$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = text_ashaparekh$Film)
text_ashaparekh$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = text_ashaparekh$Film)
text_ashaparekh$Film <- str_trim(string = text_ashaparekh$Film)

# clean text in column-3
text_ashaparekh$Role <- gsub(pattern = ".*\\((.*)", replacement = "\\1", x = text_ashaparekh$Role)
text_ashaparekh$Role <- gsub(pattern = "[0-9]{4,}|\\)|(\\.\\.\\.\\.)", replacement = "", x = text_ashaparekh$Role)
text_ashaparekh$Role <- str_trim(string = text_ashaparekh$Role)
text_ashaparekh$Role <- gsub(pattern = "^$", replacement = NA_character_, x = text_ashaparekh$Role)
text_ashaparekh$Role <- gsub(pattern = '\\"|\\[|\\]|[0-9]*', replacement = "", x = text_ashaparekh$Role)

write.csv(x = text_ashaparekh, file = "asha_parekh.csv")
