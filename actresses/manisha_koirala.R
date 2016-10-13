# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Manisha_Koirala_filmography'
# Assign the wiki url to `file_url`

table_manisha <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[1]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_manisha <- table_manisha[[1]]
  # convert `table_manisha` from `list` into `data.frame`

names(table_manisha) <- c("Film", "Year", "Role", "Director", "Language", "Notes")
# rename columns

# clean text in column-1
table_manisha$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_manisha$Film)
table_manisha$Film <- str_trim(string = table_manisha$Film)

# clean text in column-2
table_manisha$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_manisha$Year)
table_manisha$Year <- str_trim(string = table_manisha$Year)

# clean text in column-3
table_manisha$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_manisha$Role)
table_manisha$Role <- str_trim(string = table_manisha$Role)

# clean text in column-4
table_manisha$Director <- gsub(pattern = "^$", replacement = NA_character_, x = table_manisha$Director)
table_manisha$Director <- str_trim(string = table_manisha$Director)

# clean text in column-5
table_manisha$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_manisha$Language)
table_manisha$Language <- str_trim(string = table_manisha$Language)

# clean text in column-6
table_manisha$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_manisha$Notes)
table_manisha$Notes <- str_trim(string = table_manisha$Notes)

table_manisha <- select(table_manisha, Year, Film, Role, Notes, Director, Language)

write.csv(x =  table_manisha, file = "manisha_koirala.csv")
