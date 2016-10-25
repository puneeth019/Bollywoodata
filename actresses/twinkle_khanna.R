# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Twinkle_Khanna'
# Assign the wiki url to `file_url`

table_twinklekhanna <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_twinklekhanna <- table_twinklekhanna[[1]]
  # convert `table_twinklekhanna` from `list` into `data.frame`

names(table_twinklekhanna) <- c("Film", "Year", "Role", "Notes", "Ref")
# rename columns

# clean text in column-1
table_twinklekhanna$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_twinklekhanna$Film)
table_twinklekhanna$Film <- str_trim(string = table_twinklekhanna$Film)

# clean text in column-2
table_twinklekhanna$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_twinklekhanna$Year)
table_twinklekhanna$Year <- str_trim(string = table_twinklekhanna$Year)

# clean text in column-3
table_twinklekhanna$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_twinklekhanna$Role)
table_twinklekhanna$Role <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_twinklekhanna$Role)
table_twinklekhanna$Role <- str_trim(string = table_twinklekhanna$Role)

# clean text in column-4
table_twinklekhanna$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_twinklekhanna$Notes)
table_twinklekhanna$Notes <- str_trim(string = table_twinklekhanna$Notes)

# clean text in column-5
table_twinklekhanna$Ref <- gsub(pattern = "^$", replacement = NA_character_, x = table_twinklekhanna$Ref)
table_twinklekhanna$Ref <- str_trim(string = table_twinklekhanna$Ref)

table_twinklekhanna <- select(table_twinklekhanna, Year, Film, Role, Notes)
table_twinklekhanna <- arrange(table_twinklekhanna, Year, Film)

write.csv(x =  table_twinklekhanna, file = "twinkle_khanna.csv")
