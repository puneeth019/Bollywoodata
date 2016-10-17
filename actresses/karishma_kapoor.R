# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Karisma_Kapoor_filmography'
# Assign the wiki url to `file_url`

table_karishma <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[1]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_karishma <- table_karishma[[1]]
  # convert `table_karishma` from `list` into `data.frame`

names(table_karishma) <- c("Year", "Film", "Role", "Director", "Notes", "Ref")
# rename columns

# clean text in column-1
table_karishma$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_karishma$Year)
table_karishma$Year <- str_trim(string = table_karishma$Year)

# clean text in column-2
table_karishma$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_karishma$Film)
table_karishma$Film <- str_trim(string = table_karishma$Film)

# clean text in column-3
table_karishma$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_karishma$Role)
table_karishma$Role <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_karishma$Role)
table_karishma$Role <- gsub(pattern = "(.*)\\[.*", replacement = "\\1", x = table_karishma$Role)
table_karishma$Role <- str_trim(string = table_karishma$Role)

# clean text in column-4
table_karishma$Director <- gsub(pattern = "^$", replacement = NA_character_, x = table_karishma$Director)
table_karishma$Director <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_karishma$Director)
table_karishma$Director <- gsub(pattern = "(.*)\\[.*", replacement = "\\1", x = table_karishma$Director)
table_karishma$Director <- str_trim(string = table_karishma$Director)

# clean text in column-5
table_karishma$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_karishma$Notes)
table_karishma$Notes <- str_trim(string = table_karishma$Notes)

table_karishma <- select(table_karishma, Year, Film, Role, Notes, Director)

write.csv(x =  table_karishma, file = "karishma_kapoor.csv")
