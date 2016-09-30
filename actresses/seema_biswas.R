# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Seema_Biswas'
# Assign the wiki url to `file_url`

table_seemabiswas <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_seemabiswas <- table_seemabiswas[[1]]
  # convert `table_seemabiswas` from `list` into `data.frame`

names(table_seemabiswas) <- c("Year", "Film", "Role", "Language", "Notes")
# rename columns

# clean text in column-1
table_seemabiswas$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_seemabiswas$Year)
table_seemabiswas$Year <- str_trim(string = table_seemabiswas$Year)

# clean text in column-2
table_seemabiswas$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_seemabiswas$Film)
table_seemabiswas$Film <- str_trim(string = table_seemabiswas$Film)

# clean text in column-3
table_seemabiswas$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_seemabiswas$Role)
table_seemabiswas$Role <- str_trim(string = table_seemabiswas$Role)

# clean text in column-4
table_seemabiswas$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_seemabiswas$Language)
table_seemabiswas$Language <- str_trim(string = table_seemabiswas$Language)

# clean text in column-5
table_seemabiswas$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_seemabiswas$Notes)
table_seemabiswas$Notes <- str_trim(string = table_seemabiswas$Notes)

table_seemabiswas <- select(table_seemabiswas, Year, Film, Role, Language, Notes)

write.csv(x =  table_seemabiswas, file = "seema_biswas.csv")
