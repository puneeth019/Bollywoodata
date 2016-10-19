# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Rani_Mukerji_filmography'
# Assign the wiki url to `file_url`

table_ranimukerji <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[1]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_ranimukerji <- table_ranimukerji[[1]]
  # convert `table_ranimukerji` from `list` into `data.frame`

names(table_ranimukerji) <- c("Film", "Year", "Role", "Director", "Notes", "Ref")
# rename columns

# clean text in column-1
table_ranimukerji$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_ranimukerji$Film)
table_ranimukerji$Film <- gsub(pattern = "\\.\\.\\.", replacement = "", x = table_ranimukerji$Film)
table_ranimukerji$Film <- str_trim(string = table_ranimukerji$Film)

# clean text in column-2
table_ranimukerji$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_ranimukerji$Year)
table_ranimukerji$Year <- str_trim(string = table_ranimukerji$Year)

# clean text in column-3
table_ranimukerji$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_ranimukerji$Role)
table_ranimukerji$Role <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_ranimukerji$Role)
table_ranimukerji$Role <- gsub(pattern = "(.*)\\[.*", replacement = "\\1", x = table_ranimukerji$Role)
table_ranimukerji$Role <- str_trim(string = table_ranimukerji$Role)

# clean text in column-4
table_ranimukerji$Director <- gsub(pattern = "^$", replacement = NA_character_, x = table_ranimukerji$Director)
table_ranimukerji$Director <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_ranimukerji$Director)
table_ranimukerji$Director <- gsub(pattern = "(.*)\\[.*", replacement = "\\1", x = table_ranimukerji$Director)
table_ranimukerji$Director <- str_trim(string = table_ranimukerji$Director)

# clean text in column-5
table_ranimukerji$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_ranimukerji$Notes)
table_ranimukerji$Notes <- str_trim(string = table_ranimukerji$Notes)

table_ranimukerji <- select(table_ranimukerji, Year, Film, Role, Notes, Director)
table_ranimukerji <- arrange(table_ranimukerji, Year, Film)

write.csv(x =  table_ranimukerji, file = "rani_mukerji.csv")
