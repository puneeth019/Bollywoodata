# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Devayani_(actress)'
# Assign the wiki url to `file_url`

table_devayani <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_devayani <- table_devayani[[1]]
  # convert `table_devayani` from `list` into `data.frame`

names(table_devayani) <- c("Year", "Film", "Role", "Language", "Notes")
# rename columns

# clean text in column-1
table_devayani$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_devayani$Year)
table_devayani$Year <- str_trim(string = table_devayani$Year)

# clean text in column-2
table_devayani$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_devayani$Film)
table_devayani$Film <- str_trim(string = table_devayani$Film)

# clean text in column-3
table_devayani$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_devayani$Role)
table_devayani$Role <- str_trim(string = table_devayani$Role)

# clean text in column-4
table_devayani$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_devayani$Language)
table_devayani$Language <- str_trim(string = table_devayani$Language)

# clean text in column-5
table_devayani$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_devayani$Notes)
table_devayani$Notes <- str_trim(string = table_devayani$Notes)

table_devayani <- select(table_devayani, Year, Film, Role, Notes, Language)

write.csv(x =  table_devayani, file = "devayani.csv")
