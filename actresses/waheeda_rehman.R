# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Waheeda_Rehman"
# Assign the wiki url to `file_url`

table_waheedarehman <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="collapsibleTable0"]') %>%
  html_table(trim = T)

table_waheedarehman <- table_waheedarehman[[1]]
  # convert `table_waheedarehman` from `list` into `data.frame`

names(table_waheedarehman) <- c("Year", "Film", "Role", "Language")
  # rename columns

# clean text in column-1


# clean text in column-2


# clean text in column-3


# clean text in column-4

write.csv(x =  table_waheedarehman, file = "waheeda_rehman.csv")
