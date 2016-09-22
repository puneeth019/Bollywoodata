# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Smita_Patil"
# Assign the wiki url to `file_url`

table_smitapatil <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_smitapatil <- table_smitapatil[[1]]
  # convert `table_smitapatil` from `list` into `data.frame`

names(table_smitapatil) <- c("Year", "Film", "Role", "Notes")
  # rename columns

# clean text in column-2
table_smitapatil$Film <- gsub(pattern = "(.*)\\(.*\\).*", replacement = "\\1", x = table_smitapatil$Film)
table_smitapatil$Film <- gsub(pattern = "(.*)\\[.*\\].*", replacement = "\\1", x = table_smitapatil$Film)
table_smitapatil$Film <- gsub(pattern = "(.*)\\[.*\\].*", replacement = "\\1", x = table_smitapatil$Film)
table_smitapatil$Film <- gsub(pattern = "\\?", replacement = "", x = table_smitapatil$Film)
table_smitapatil$Film <- str_trim(string = table_smitapatil$Film)

# clean text in column-3
table_smitapatil$Role <- gsub(pattern = "(.*)\\(.*\\).*", replacement = "\\1", x = table_smitapatil$Role)
table_smitapatil$Role <- gsub(pattern = "(.*)\\[.*\\].*", replacement = "\\1", x = table_smitapatil$Role)
table_smitapatil$Role <- gsub(pattern = "(.*)\\[.*\\].*", replacement = "\\1", x = table_smitapatil$Role)
table_smitapatil$Role <- gsub(pattern = "\\-", replacement = "", x = table_smitapatil$Role)
table_smitapatil$Role <- gsub(pattern = "^$", replacement = NA_character_ ,x = table_smitapatil$Role)
table_smitapatil$Role <- str_trim(string = table_smitapatil$Role)

# clean text in column-4
table_smitapatil$Notes <- gsub(pattern = "^$", replacement = NA_character_, x = table_smitapatil$Notes)
table_smitapatil$Notes <- str_trim(string = table_smitapatil$Notes)

write.csv(x =  table_smitapatil, file = "smita_patil.csv")
