# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Mala_Sinha"
# Assign the wiki url to `file_url`

text_malasinha <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/ul[3]') %>%
  html_text(trim = T)

# clean text
text_malasinha <- str_split(string = text_malasinha, pattern = "\n")

text_malasinha <- text_malasinha[[1]]
text_malasinha <- as.data.frame(text_malasinha)
  # convert `text_malasinha` `list` into `data.frame`

text_malasinha[2] <- NA
  # Initialize 2nd column of `text_malasinha`

text_malasinha[3] <- NA
# Initialize 3rd column of `text_malasinha`

names(text_malasinha) <- c("Year", "Film", "Acted_with")
  # rename columns of `text_malasinha`

text_malasinha$Film <- text_malasinha$Year
  # copy column-1 data to column-2

text_malasinha$Acted_with <- text_malasinha$Year
# copy column-1 data to column-3

# clean text in column-1
text_malasinha$Year <- gsub(pattern = ".*([0-9]{4}).*", replacement = "\\1", x = text_malasinha$Year)
text_malasinha$Year <- str_trim(string = text_malasinha$Year)

# clean text in column-2
text_malasinha$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = text_malasinha$Film)
text_malasinha$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = text_malasinha$Film)
text_malasinha$Film <- gsub(pattern = "(.*)\\'\\'", replacement = "\\1", x = text_malasinha$Film)
text_malasinha$Film <- str_trim(string = text_malasinha$Film)

# clean text in column-3
text_malasinha$Acted_with <- gsub(pattern = ".*\\({1}(.*)", replacement = "\\1", x = text_malasinha$Acted_with)
text_malasinha$Acted_with <- gsub(pattern = "[0-9]*", replacement = "", x = text_malasinha$Acted_with)
text_malasinha$Acted_with <- gsub(pattern = "\\)", replacement = "", x = text_malasinha$Acted_with)
text_malasinha$Acted_with <- gsub(pattern = "(.*)N{1}.*", replacement = "\\1", x = text_malasinha$Acted_with)
text_malasinha$Acted_with <- str_trim(string = text_malasinha$Acted_with)
text_malasinha$Acted_with <- gsub(pattern = "[^a-zA-Z]$", replacement = "", x = text_malasinha$Acted_with)
text_malasinha$Acted_with <- str_trim(string = text_malasinha$Acted_with)

write.csv(x = text_malasinha, file = "mala_sinha.csv")
