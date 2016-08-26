# Scrape Bollywood Actress data from wiki
library(rvest) # Load `XML` package
library(dplyr) # Load `dplyr` package
library(stringr) # Load `stringr` package

setwd("~/Documents/DA/Projects/Bollywood_Jewels/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Nimmi"
# Assign the wiki url to `file_url`

table_nimmi <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/ul[1]') %>%
  html_text(trim = T)

# text cleaning
table_nimmi <- str_split(string = table_nimmi, pattern = "\n")

table_nimmi <- table_nimmi[[1]]
table_nimmi <- as.data.frame(table_nimmi)
  # convert `table_nimmi` `list` into `data.frame`

table_nimmi[2] <- NA
  # Initialize 2nd column of `text.nargis`

names(table_nimmi) <- c("Year", "Film")
  # rename columns of `text.nargis`

table_nimmi$Film <- table_nimmi$Year
  # copy column-1 data to column-2

# clean text in column1
table_nimmi$Year <- gsub(pattern = '.*\\((.*?)\\)', replacement = '\\1', x = table_nimmi$Year)
table_nimmi$Year <- gsub(pattern = '[$.]', replacement = '', x = table_nimmi$Year)
table_nimmi$Year <- str_trim(string = table_nimmi$Year)

# clean text in column2
table_nimmi$Film <- gsub(pattern = '\\((.*)\\)', replacement = '', x = table_nimmi$Film)
table_nimmi$Film <- gsub(pattern = '[$.]', replacement = '', x = table_nimmi$Film)
table_nimmi$Film <- str_trim(string = table_nimmi$Film)

write.csv(x = table_nimmi, file = "nimmi.csv")
