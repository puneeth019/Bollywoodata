# Scrape Bollywood Actress data from wiki
library(rvest) # Load `XML` package
library(dplyr) # Load `dplyr` pacakge

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Madhubala"
# Assign the wiki url to `file_url`

table_madhubala <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_madhubala <- table_madhubala[[1]]
  # Convert `table_madhubala` from `list` into `data.frame`

names(table_madhubala) <- c("Year", "Film", "Director", "Other_notes")
  # rename columns
table_madhubala <- select(table_madhubala, -Other_notes)
  # remove unnecessary columns

# Clean text
table_madhubala$Year <- ifelse(table_madhubala$Year %in% c(''), NA_character_, table_madhubala$Year)
table_madhubala$Film <- ifelse(table_madhubala$Film %in% c(''), NA_character_, table_madhubala$Film)
table_madhubala$Director <- ifelse(table_madhubala$Director %in% c('', "-"), NA_character_, table_madhubala$Director)

table_madhubala$Film <- gsub(pattern = '[(0-9)+ | \\(+ | \\)+ | \'$]', replacement = '', table_madhubala$Film)
  # Cleaning text using `regular expressions`

write.csv(x =  table_madhubala, file = "madhubala.csv")
