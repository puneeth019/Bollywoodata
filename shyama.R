# Scrape Bollywood Actress data from wiki
library(rvest) # Load `XML` package
library(dplyr) # Load `dplyr` package
library(stringr) # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Shyama"
# Assign the wiki url to `file_url`

table_shyama <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/ul[1]') %>%
  html_text(trim = T)

# text cleaning
table_shyama <- str_split(string = table_shyama, pattern = "\n")

table_shyama <- table_shyama[[1]]
table_shyama <- as.character(table_shyama)
table_shyama <- as.data.frame(table_shyama)
  # convert `table_shyama` `list` into `data.frame`

table_shyama[2] <- NA
  # Initialize 2nd column of `text.nargis`

names(table_shyama) <- c("Year", "Film")
  # rename columns of `text.nargis`

table_shyama$Film <- table_shyama$Year
  # copy column-1 data to column-2

# clean text in column-1
table_shyama$Year <- gsub(pattern = '[a-zA-Z]|\\(|\\)|-|,|\'|\\.', replacement = '', x = table_shyama$Year)
table_shyama$Year <- str_trim(string = table_shyama$Year)
table_shyama$Year <- substr(x = table_shyama$Year, start = 1, stop = 4)

# clean text in column-2
table_shyama$Film <- str_extract(string = table_shyama$Film, pattern = '.*[0-9]')
table_shyama$Film <- gsub(pattern = '\\(|[0-9]*|\\).*', replacement = '', x = table_shyama$Film)
table_shyama$Film <- str_trim(string = table_shyama$Film)

write.csv(x = table_shyama, file = "shyama.csv")
