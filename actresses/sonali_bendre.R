# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("C:/Users/lc067/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'C:/Users/lc067/Documents/DA/projects/Project1/actresses/Sonali Bendre - Wikipedia.html'
# Assign the wiki url to `file_url`

table_sonalibendre <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_sonalibendre <- table_sonalibendre[[1]]
  # convert `table_sonalibendre` from `list` into `data.frame`

names(table_sonalibendre) <- c("Year", "Film", "Role", "Language", "Notes")
# rename columns

# clean text in column-1
table_sonalibendre$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_sonalibendre$Year)
table_sonalibendre$Year <- str_trim(string = table_sonalibendre$Year)

# clean text in column-2
table_sonalibendre$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_sonalibendre$Film)
table_sonalibendre$Film <- str_trim(string = table_sonalibendre$Film)

# clean text in column-3
table_sonalibendre$Role <- gsub(pattern = "-", replacement = "", x = table_sonalibendre$Role)
table_sonalibendre$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_sonalibendre$Role)
table_sonalibendre$Role <- str_trim(string = table_sonalibendre$Role)

# clean text in column-4
table_sonalibendre$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_sonalibendre$Language)
table_sonalibendre$Language <- str_trim(string = table_sonalibendre$Language)

# clean text in column-5
table_sonalibendre$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_sonalibendre$Notes)
table_sonalibendre$Notes <- str_trim(string = table_sonalibendre$Notes)

table_sonalibendre <- select(table_sonalibendre, Year, Film, Role, Notes, Language)
table_sonalibendre <- arrange(table_sonalibendre, Year, Film)

write.csv(x =  table_sonalibendre, file = "sonali_bendre.csv")