# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("C:/Users/lc067/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Ayesha_Jhulka'
# Assign the wiki url to `file_url`

table_ayeshajhulka <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_ayeshajhulka <- table_ayeshajhulka[[1]]
  # convert `table_ayeshajhulka` from `list` into `data.frame`

names(table_ayeshajhulka) <- c("Year", "Film", "Role", "Notes")
# rename columns

# clean text in column-1
table_ayeshajhulka$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_ayeshajhulka$Year)
table_ayeshajhulka$Year <- str_trim(string = table_ayeshajhulka$Year)

# clean text in column-2
table_ayeshajhulka$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_ayeshajhulka$Film)
table_ayeshajhulka$Film <- gsub(pattern = "\\.\\.\\.", replacement = " ", x = table_ayeshajhulka$Film)
table_ayeshajhulka$Film <- str_trim(string = table_ayeshajhulka$Film)

# clean text in column-3
table_ayeshajhulka$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_ayeshajhulka$Role)
table_ayeshajhulka$Role <- str_trim(string = table_ayeshajhulka$Role)

# clean text in column-4
table_ayeshajhulka$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_ayeshajhulka$Notes)
table_ayeshajhulka$Notes <- str_trim(string = table_ayeshajhulka$Notes)

table_ayeshajhulka <- select(table_ayeshajhulka, Year, Film, Role, Notes)
table_ayeshajhulka <- arrange(table_ayeshajhulka, Year, Film)

write.csv(x =  table_ayeshajhulka, file = "ayesha_jhulka.csv")