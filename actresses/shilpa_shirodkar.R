# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("C:/Users/lc067/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- 'https://en.wikipedia.org/wiki/Shilpa_Shirodkar'
# Assign the wiki url to `file_url`

table_shilpashirodkar <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_shilpashirodkar <- table_shilpashirodkar[[1]]
  # convert `table_shilpashirodkar` from `list` into `data.frame`

names(table_shilpashirodkar) <- c("Year", "Film", "Role", "Language")
# rename columns

# clean text in column-1
table_shilpashirodkar$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_shilpashirodkar$Year)
table_shilpashirodkar$Year <- str_trim(string = table_shilpashirodkar$Year)

# clean text in column-2
table_shilpashirodkar$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_shilpashirodkar$Film)
table_shilpashirodkar$Film <- str_trim(string = table_shilpashirodkar$Film)

# clean text in column-3
table_shilpashirodkar$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_shilpashirodkar$Role)
table_shilpashirodkar$Role <- str_trim(string = table_shilpashirodkar$Role)

# clean text in column-4
table_shilpashirodkar$Language <- gsub(pattern = "^$", replacement = NA_character_, x = table_shilpashirodkar$Language)
table_shilpashirodkar$Language <- str_trim(string = table_shilpashirodkar$Language)

table_shilpashirodkar <- select(table_shilpashirodkar, Year, Film, Role, Language)
table_shilpashirodkar <- arrange(table_shilpashirodkar, Year, Film)

write.csv(x =  table_shilpashirodkar, file = "shilpashirodkar.csv")