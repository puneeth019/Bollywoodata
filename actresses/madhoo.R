# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Madhoo'
# Assign the wiki url to `file_url`

table_madhoo <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_madhoo <- table_madhoo[[1]]
  # convert `table_madhoo` from `list` into `data.frame`

names(table_madhoo) <- c("Year", "Film", "Role", "Language", "Notes")
# rename columns

# clean text in column-1
table_madhoo$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_madhoo$Year)
table_madhoo$Year <- str_trim(string = table_madhoo$Year)

# clean text in column-2
table_madhoo$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_madhoo$Film)
table_madhoo$Film <- gsub(pattern = "\\.\\.\\.", replacement = " ", x = table_madhoo$Film)
table_madhoo$Film <- gsub(pattern = "(.*)\\[.*", replacement = "\\1", x = table_madhoo$Film)
table_madhoo$Film <- str_trim(string = table_madhoo$Film)

# clean text in column-3
table_madhoo$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_madhoo$Role)
table_madhoo$Role <- str_trim(string = table_madhoo$Role)

# clean text in column-4
table_madhoo$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_madhoo$Language)
table_madhoo$Language <- str_trim(string = table_madhoo$Language)

# clean text in column-5
table_madhoo$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_madhoo$Notes)
table_madhoo$Notes <- str_trim(string = table_madhoo$Notes)

table_madhoo <- select(table_madhoo, Year, Film, Role, Notes, Language)
table_madhoo <- arrange(table_madhoo, Year, Film)

write.csv(x =  table_madhoo, file = "madhoo.csv")
