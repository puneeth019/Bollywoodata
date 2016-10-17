# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Tabu_filmography'
# Assign the wiki url to `file_url`

table_tabu <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_tabu <- table_tabu[[1]]
  # convert `table_tabu` from `list` into `data.frame`

names(table_tabu) <- c("Film", "Year", "Role", "Language", "Director", "Notes", "Ref")
# rename columns

# clean text in column-1
table_tabu$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_tabu$Film)
table_tabu$Film <- gsub(pattern = "(.*)!.*", replacement = "\\1", x = table_tabu$Film)
table_tabu$Film <- str_trim(string = table_tabu$Film)

# clean text in column-2
table_tabu$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_tabu$Year)
table_tabu$Year <- str_trim(string = table_tabu$Year)

# clean text in column-3
table_tabu$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_tabu$Role)
table_tabu$Role <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_tabu$Role)
table_tabu$Role <- gsub(pattern = "(.*)\\[.*", replacement = "\\1", x = table_tabu$Role)
table_tabu$Role <- str_trim(string = table_tabu$Role)

# clean text in column-4
table_tabu$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_tabu$Language)
table_tabu$Language <- str_trim(string = table_tabu$Language)

# clean text in column-5
table_tabu$Director <- gsub(pattern = "^$", replacement = NA_character_, x = table_tabu$Director)
table_tabu$Director <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_tabu$Director)
table_tabu$Director <- gsub(pattern = "(.*)\\[.*", replacement = "\\1", x = table_tabu$Director)
table_tabu$Director <- str_trim(string = table_tabu$Director)

# clean text in column-6
table_tabu$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_tabu$Notes)
table_tabu$Notes <- str_trim(string = table_tabu$Notes)

table_tabu <- select(table_tabu, Year, Film, Role, Notes, Language, Director)

write.csv(x =  table_tabu, file = "tabu.csv")
