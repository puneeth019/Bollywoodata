# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- ''
# Assign the wiki url to `file_url`

table_mandakini <- file_url %>%
  read_html() %>%
  html_nodes(xpath='') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_mandakini <- table_mandakini[[1]]
  # convert `table_mandakini` from `list` into `data.frame`

names(table_mandakini) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_mandakini$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_mandakini$Year)
table_mandakini$Year <- str_trim(string = table_mandakini$Year)

# clean text in column-2
table_mandakini$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_mandakini$Film)
table_mandakini$Film <- str_trim(string = table_mandakini$Film)

# clean text in column-3
table_mandakini$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_mandakini$Role)
table_mandakini$Role <- str_trim(string = table_mandakini$Role)

# clean text in column-4
table_mandakini$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_mandakini$Notes)
table_mandakini$Notes <- str_trim(string = table_mandakini$Notes)

table_mandakini <- select(table_mandakini, Year, Film, Role, Notes)
table_mandakini <- arrange(table_mandakini, Year, Film)

write.csv(x =  table_mandakini, file = "mandakini.csv")
