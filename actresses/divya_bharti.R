# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Divya_Bharti'
# Assign the wiki url to `file_url`

table_divyabharti <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_divyabharti <- table_divyabharti[[1]]
  # convert `table_divyabharti` from `list` into `data.frame`

names(table_divyabharti) <- c("Year", "Film", "Role","Language", "Notes")
# rename columns

# clean text in column-1
table_divyabharti$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_divyabharti$Year)
table_divyabharti$Year <- str_trim(string = table_divyabharti$Year)

# clean text in column-2
table_divyabharti$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_divyabharti$Film)
table_divyabharti$Film <- str_trim(string = table_divyabharti$Film)

# clean text in column-3
table_divyabharti$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_divyabharti$Role)
table_divyabharti$Role <- str_trim(string = table_divyabharti$Role)

# clean text in column-4
table_divyabharti$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_divyabharti$Language)
table_divyabharti$Language <- str_trim(string = table_divyabharti$Language)

# clean text in column-5
table_divyabharti$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_divyabharti$Notes)
table_divyabharti$Notes <- str_trim(string = table_divyabharti$Notes)

table_divyabharti <- select(table_divyabharti, Year, Film, Role, Notes)

write.csv(x =  table_divyabharti, file = "divya_bharti.csv")
