# Scrape Indian Film `Producion Houses` names from wiki
library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` pacakge

WorkDir <- "~/DA/projects/Bollywoodata/production_houses/"
setwd(dir = WorkDir)

file_url <- "https://en.wikipedia.org/wiki/Category:Film_production_companies_of_India"
# Assign the wiki url to `file_url`

names <- file_url %>%
  read_html() %>%
  html_nodes(css = '#mw-pages .mw-category-group a') %>%
  html_text(trim = TRUE)

links <- file_url %>%
  read_html() %>%
  html_nodes(css = '#mw-pages .mw-category-group a') %>%
  html_attr(name = 'href') %>% 
  unlist(use.names = F)

production_houses <- data.frame(name = names, http_link = links, row.names = NULL, stringsAsFactors = F)

write.csv(x = production_houses, file = 'indian_film_production_houses.csv')
