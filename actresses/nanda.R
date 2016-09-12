# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Nanda_(actress)"
# Assign the wiki url to `file_url`

table_nanda <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_nanda <- table_nanda[[1]]
  # convert `table_nanda` from `list` into `data.frame`

table_nanda[4] <- NA
  # initiate column-4 of `table_nanda`

table_nanda[4] <- table_nanda[1]
  # copy data from column-1 to column-2

names(table_nanda) <- c("Year", "Role", "Notes", "Film")
  # rename columns in `table_nanda`

table_nanda <- select(.data = table_nanda, Year, Film, Role, Notes)
  # rearragen columns in `table_nanda`

# clean text in column-1
table_nanda$Year <- gsub(pattern = ".*\\((.*)\\)", replacement = "\\1", x = table_nanda$Year)
table_nanda$Year <- str_trim(string = table_nanda$Year)

# clean text in column-2
table_nanda$Film <- gsub(pattern = "(.*)\\(.*", replacement = "\\1", x = table_nanda$Film)
table_nanda$Film <- str_trim(string = table_nanda$Film)

# clean text in column-3
table_nanda$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_nanda$Role)
table_nanda$Role <- str_trim(string = table_nanda$Role)

# clean text in column-4
table_nanda$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_nanda$Notes)
table_nanda$Notes <- str_trim(string = table_nanda$Notes)

write.csv(x =  table_nanda, file = "nanda.csv")
