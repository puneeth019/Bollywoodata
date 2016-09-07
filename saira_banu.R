# Scrape Bollywood Actress data from wiki
library(rvest) # Load `XML` package
library(dplyr) # Load `dplyr` package
library(stringr) # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Saira_Banu"
# Assign the wiki url to `file_url`

text_sairabanu <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/ul[1]') %>%
  html_text(trim = T)

# text cleaning
text_sairabanu <- str_split(string = text_sairabanu, pattern = "\n")

text_sairabanu <- text_sairabanu[[1]]
text_sairabanu <- as.data.frame(text_sairabanu)
  # convert `text_sairabanu` `list` into `data.frame`

text_sairabanu[2] <- NA
  # Initialize 2nd column of `text.sairabanu`

names(text_sairabanu) <- c("Year", "Film")
  # rename columns of `text.sairabanu`

text_sairabanu$Film <- text_sairabanu$Year
  # copy column-1 data to column-2

# clean text in column-1
text_sairabanu$Year <- gsub(pattern = ".*\\((.*)\\).*", replacement = "\\1", x = text_sairabanu$Year)
text_sairabanu$Year <- substr(x = text_sairabanu$Year, start = 1, stop = 4)
text_sairabanu$Year <- str_trim(string = text_sairabanu$Year)

# clean text in column-2
text_sairabanu$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = text_sairabanu$Film)
text_sairabanu$Film <- str_trim(string = text_sairabanu$Film)

write.csv(x = text_sairabanu, file = "saira_banu.csv")
