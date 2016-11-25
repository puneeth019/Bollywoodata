# Scrape Indian Film `Female Screenwriter` names from wiki
library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` package

WorkDir <- "C:/Users/lc067/Documents/DA/projects/Bollywoodata/screenwriters/"
setwd(dir = WorkDir)

file_url <- "C:/Users/lc067/Documents/DA/projects/Bollywoodata/screenwriters/female.html"
# Assign the wiki url to `file_url`

names <- file_url %>%
  read_html() %>%
  html_nodes(css = '.mw-category-group a') %>%
  html_text(trim = TRUE)

links <- file_url %>%
  read_html() %>%
  html_nodes(css = '.mw-category-group a') %>%
  html_attr(name = 'href') %>% 
  unlist(use.names = F)

screenwriters_female <- data.frame(name = names, http_link = links, row.names = NULL, stringsAsFactors = F)

write.csv(x = screenwriters_female, file = 'indian_film_screenwriters_female.csv')