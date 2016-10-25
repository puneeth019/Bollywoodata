# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("C:/Users/lc067/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'C:/Users/lc067/Documents/DA/projects/Project1/actresses/Preity Zinta filmography - Wikipedia.html'
# Assign the wiki url to `file_url`

table_preityzinta <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[1]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_preityzinta <- table_preityzinta[[1]]
  # convert `table_preityzinta` from `list` into `data.frame`

names(table_preityzinta) <- c("Film", "Year", "Role", "Director", "Notes", "Ref")
# rename columns

# clean text in column-1
table_preityzinta$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_preityzinta$Film)
table_preityzinta$Film <- str_trim(string = table_preityzinta$Film)

# clean text in column-2
table_preityzinta$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_preityzinta$Year)
table_preityzinta$Year <- str_trim(string = table_preityzinta$Year)

# clean text in column-3
table_preityzinta$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_preityzinta$Role)
table_preityzinta$Role <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_preityzinta$Role)
table_preityzinta$Role <- str_trim(string = table_preityzinta$Role)

# clean text in column-4
table_preityzinta$Director <- gsub(pattern = "^$", replacement = NA_character_, x = table_preityzinta$Director)
table_preityzinta$Director <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_preityzinta$Director)
table_preityzinta$Director <- str_trim(string = table_preityzinta$Director)

# clean text in column-5
table_preityzinta$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_preityzinta$Notes)
table_preityzinta$Notes <- str_trim(string = table_preityzinta$Notes)

table_preityzinta <- select(table_preityzinta, Year, Film, Role, Notes, Director)
table_preityzinta <- arrange(table_preityzinta, Year, Film)

write.csv(x =  table_preityzinta, file = "preity_zinta.csv")