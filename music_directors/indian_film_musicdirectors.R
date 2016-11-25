# Scrape Indian Film `Directors` names from wiki
library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` pacakge

WorkDir <- "C:/Users/lc067/Documents/DA/projects/Bollywoodata/directors/"
setwd(dir = WorkDir)

file_url <- "C:/Users/lc067/Documents/DA/projects/Bollywoodata/directors/aa.html"
# Assign the wiki url to `file_url`

names <- file_url %>%
  read_html() %>%
  html_nodes(css = '#mw-pages .mw-category-group a') %>%
  html_text(trim = TRUE) %>%
  gsub(pattern = "(.*)\\(.*", replacement = "\\1") %>%
  str_trim()

links <- file_url %>%
  read_html() %>%
  html_nodes(css = '#mw-pages .mw-category-group a') %>%
  html_attr(name = 'href') %>% 
  unlist(use.names = F)

directors <- data.frame(name = names, http_link = links, row.names = NULL, stringsAsFactors = F)

write.csv(x = directors, file = 'indian_film_directors.csv')