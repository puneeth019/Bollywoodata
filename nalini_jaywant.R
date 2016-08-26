# Scrape Bollywood Actress data from wiki
library(rvest) # Load `XML` package
library(dplyr) # Load `dplyr` package
library(stringr) # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Nalini_Jaywant"
# Assign the wiki url to `file_url`

table_nalinijaywant <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/ul[1]') %>%
  html_text(trim = T)

# text cleaning
table_nalinijaywant <- str_split(string = table_nalinijaywant, pattern = "\n")

table_nalinijaywant <- table_nalinijaywant[[1]]
table_nalinijaywant <- as.character(table_nalinijaywant)
table_nalinijaywant <- as.data.frame(table_nalinijaywant)
  # convert `table_nalinijaywant` `list` into `data.frame`

table_nalinijaywant[2] <- NA
  # Initialize 2nd column of `text.nargis`

names(table_nalinijaywant) <- c("Year", "Film")
  # rename columns of `text.nargis`

table_nalinijaywant$Film <- table_nalinijaywant$Year
  # copy column-1 data to column-2

# clean text in column-1
table_nalinijaywant$Year <- gsub(pattern = '.*\\((.*)\\).*', replacement = '\\1', x = table_nalinijaywant$Year)
table_nalinijaywant$Year <- str_trim(string = table_nalinijaywant$Year)

# clean text in column-2
table_nalinijaywant$Film <- gsub(pattern = '(.*)\\(.*\\).*', replacement = '\\1', x = table_nalinijaywant$Film)
table_nalinijaywant$Film <- str_trim(table_nalinijaywant$Film)

write.csv(x = table_nalinijaywant, file = "nalini_jaywant.csv")
