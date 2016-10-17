# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Karisma_Kapoor_filmography'
# Assign the wiki url to `file_url`

table_karisma <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[1]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_karisma <- table_karisma[[1]]
  # convert `table_karisma` from `list` into `data.frame`

names(table_karisma) <- c("Year", "Film", "Role", "Director", "Notes", "Ref")
# rename columns

# clean text in column-1
table_karisma$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_karisma$Year)
table_karisma$Year <- str_trim(string = table_karisma$Year)

# clean text in column-2
table_karisma$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_karisma$Film)
table_karisma$Film <- str_trim(string = table_karisma$Film)

# clean text in column-3
table_karisma$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_karisma$Role)
table_karisma$Role <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_karisma$Role)
table_karisma$Role <- gsub(pattern = "(.*)\\[.*", replacement = "\\1", x = table_karisma$Role)
table_karisma$Role <- str_trim(string = table_karisma$Role)

# clean text in column-4
table_karisma$Director <- gsub(pattern = "^$", replacement = NA_character_, x = table_karisma$Director)
table_karisma$Director <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_karisma$Director)
table_karisma$Director <- gsub(pattern = "(.*)\\[.*", replacement = "\\1", x = table_karisma$Director)
table_karisma$Director <- str_trim(string = table_karisma$Director)

# clean text in column-5
table_karisma$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_karisma$Notes)
table_karisma$Notes <- str_trim(string = table_karisma$Notes)

table_karisma <- select(table_karisma, Year, Film, Role, Notes, Director)

write.csv(x =  table_karisma, file = "karisma_kapoor.csv")
