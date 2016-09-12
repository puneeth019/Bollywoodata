# Scrape Bollywood Actress data from wiki
library(rvest) # Load `XML` package
library(dplyr) # Load `dplyr` package
library(stringr) # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Tanuja"
# Assign the wiki url to `file_url`

text_tanuja <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/div[2]') %>%
  html_text(trim = T)

# text cleaning
text_tanuja <- str_split(string = text_tanuja, pattern = "\n")

text_tanuja <- text_tanuja[[1]]
text_tanuja <- as.data.frame(text_tanuja)
  # convert `text_tanuja` `list` into `data.frame`

text_tanuja[2] <- NA
  # Initialize 2nd column of `text_tanuja`

names(text_tanuja) <- c("Year", "Film")
  # rename columns of `text_tanuja`

text_tanuja$Film <- text_tanuja$Year
  # copy column-1 data to column-2

# clean text in cloumn-1
text_tanuja$Year <- gsub(pattern = ".*\\((.*)\\)", replacement = "\\1", x = text_tanuja$Year)
text_tanuja$Year <- gsub(pattern = "\\{|\\}", replacement = "", x = text_tanuja$Year)
text_tanuja$Year <- gsub(pattern = "[a-zA-Z]", replacement = "", x = text_tanuja$Year)
text_tanuja$Year <- str_trim(string = text_tanuja$Year)
text_tanuja$Year <- str_extract(string = text_tanuja$Year, pattern = "[0-9]*")
text_tanuja$Year <- str_trim(string = text_tanuja$Year)

# clean text in cloumn-2
text_tanuja$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = text_tanuja$Film)
text_tanuja$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1",x = text_tanuja$Film)
text_tanuja$Film <- gsub(pattern = "(.*)\\{.*", replacement = "\\1",x = text_tanuja$Film)
text_tanuja$Film <- str_trim(string = text_tanuja$Film)

write.csv(x = text_tanuja, file = "tanuja.csv")
