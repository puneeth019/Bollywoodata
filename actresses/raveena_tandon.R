# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Raveena_Tandon_filmography'
# Assign the wiki url to `file_url`

table_raveenatandon <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_raveenatandon <- table_raveenatandon[[1]]
  # convert `table_raveenatandon` from `list` into `data.frame`

names(table_raveenatandon) <- c("Film", "Year", "Role", "Directors", "Notes")
# rename columns

# clean text in column-1
table_raveenatandon$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_raveenatandon$Film)
table_raveenatandon$Film <- str_trim(string = table_raveenatandon$Film)

# clean text in column-2
table_raveenatandon$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_raveenatandon$Year)
table_raveenatandon$Year <- str_trim(string = table_raveenatandon$Year)

# clean text in column-3
table_raveenatandon$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_raveenatandon$Role)
table_raveenatandon$Role <- str_trim(string = table_raveenatandon$Role)

# clean text in column-4
table_raveenatandon$Directors <- gsub(pattern = ".*!(.*)", replacement = "\\1", x = table_raveenatandon$Directors)
table_raveenatandon$Directors <- gsub(pattern = "^$", replacement = NA_character_, x = table_raveenatandon$Directors)
table_raveenatandon$Directors <- str_trim(string = table_raveenatandon$Directors)

# clean text in column-5
table_raveenatandon$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_raveenatandon$Notes)
table_raveenatandon$Notes <- str_trim(string = table_raveenatandon$Notes)

table_raveenatandon <- select(table_raveenatandon, Year, Film, Role, Notes, Directors)

write.csv(x =  table_raveenatandon, file = "raveena_tandon.csv")
