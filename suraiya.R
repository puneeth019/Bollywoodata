# Scrape Bollywood Actress names from wiki
library(stringr)# Load `stringr` package
library(rvest)  # Load `XML` package
library(dplyr)  # Load `dplyr` pacakge

setwd(dir = "~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Suraiya"
# Assign the wiki url to `file_url`

table_suraiya <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_suraiya <- table_suraiya[[1]]
  # Convert `table_suraiya` from list into `data.frame`

names(table_suraiya) <- c("Year", "Film", "Director", 
                          "Producer", "Role", "Cast", "Music_Director", "Other_notes")
  # rename the columns in `table_suraiya`

table_suraiya <- select(table_suraiya, -Other_notes, -Cast)
  # Remove unnecessary columns from `data.frame` `table_suraiya`

tmp <- table_suraiya$Director
  # Get "hyphen" directly from the `data.frame` as it is in different format

# Clean the data
table_suraiya$Year <- ifelse(table_suraiya$Year %in% c('', tmp), NA_character_, table_suraiya$Year)
table_suraiya$Film <- ifelse(table_suraiya$Film %in% c('', tmp), NA_character_, table_suraiya$Film)
table_suraiya$Director <- ifelse(table_suraiya$Director %in% c('', tmp), NA_character_, table_suraiya$Director)
table_suraiya$Producer <- ifelse(table_suraiya$Producer %in% c('', tmp), NA_character_, table_suraiya$Producer)
table_suraiya$Role <- ifelse(table_suraiya$Role %in% c('', tmp), NA_character_, table_suraiya$Role)
table_suraiya$Music_Director <- ifelse(table_suraiya$Music_Director %in% c('', tmp), NA_character_, table_suraiya$Music_Director)

# more cleaning
table_suraiya$Film <- gsub(pattern = 'film', replacement = '', x = table_suraiya$Film)
table_suraiya$Film <- gsub(pattern = '[\\( | \\)]', replacement = '', x = table_suraiya$Film)

write.csv(x =  table_suraiya, file = "suraiya.csv")
