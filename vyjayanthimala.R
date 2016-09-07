# Scrape Bollywood Actress data from wiki
library(rvest)    # Load `XML` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Vyjayanthimala"
# Assign the wiki url to `file_url`

table_vyjayanthimala <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_vyjayanthimala <- table_vyjayanthimala[[1]]
  # Convert `table_vyjayanthimala` from `list` into `data.frame`

# Replace empty strings with `NA`s
table_vyjayanthimala$`Notes and Awards` <- gsub(pattern = "^$", replacement = NA_character_, x = table_vyjayanthimala$`Notes and Awards`)

# Clean cloumns
table_vyjayanthimala$Year <- str_trim(string = table_vyjayanthimala$Year)
table_vyjayanthimala$Film <- str_trim(string = table_vyjayanthimala$Film)
table_vyjayanthimala$Role <- str_trim(string = table_vyjayanthimala$Role)
table_vyjayanthimala$Language <- str_trim(string = table_vyjayanthimala$Language)
table_vyjayanthimala$`Notes and Awards` <- str_trim(string = table_vyjayanthimala$`Notes and Awards`)

write.csv(x =  table_vyjayanthimala, file = "vyjayanthimala.csv")
