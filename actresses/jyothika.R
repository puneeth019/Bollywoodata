# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Jyothika'
# Assign the wiki url to `file_url`

table_jyothika <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_jyothika <- table_jyothika[[1]]
  # convert `table_jyothika` from `list` into `data.frame`

names(table_jyothika) <- c("Year", "Film", "Role", "Language", "Notes")
# rename columns

# clean text in column-1
table_jyothika$Year <- gsub(pattern = "^$", replacement = NA_integer_, x = table_jyothika$Year)
table_jyothika$Year <- str_trim(string = table_jyothika$Year)

# clean text in column-2
table_jyothika$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_jyothika$Film)
table_jyothika$Film <- str_trim(string = table_jyothika$Film)

# clean text in column-3
table_jyothika$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_jyothika$Role)
table_jyothika$Role <- str_trim(string = table_jyothika$Role)

# clean text in column-4
table_jyothika$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_jyothika$Language)
table_jyothika$Language <- str_trim(string = table_jyothika$Language)

# clean text in column-5
table_jyothika$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_jyothika$Notes)
table_jyothika$Notes <- gsub(pattern = "(.*)\\[.*", replacement = "\\1", x = table_jyothika$Notes)
table_jyothika$Notes <- str_trim(string = table_jyothika$Notes)

table_jyothika <- select(table_jyothika, Year, Film, Role, Notes, Language)
table_jyothika <- arrange(table_jyothika, Year, Film)

write.csv(x =  table_jyothika, file = "jyothika.csv")
