# Scrape Bollywood Actress names from wiki
library(rvest)  # Load `rvest` package

WorkDir <- '~/DA/Projects/Bollywoodata/actresses/'
setwd(dir = WorkDir)

file_url <- 'https://en.wikipedia.org/wiki/List_of_Indian_film_actresses'
# Assign the wiki url to `file_url`

names <- file_url %>%
  read_html() %>%
  html_nodes(css = '#mw-content-text ul:nth-child(1) a:nth-child(1)') %>%
  html_text(trim = TRUE)

links <- file_url %>%
  read_html() %>%
  html_nodes(css = '#mw-content-text ul:nth-child(1) a:nth-child(1)') %>%
  html_attr(name = 'href') %>% 
  lapply(FUN = function(x) paste0("https://en.wikipedia.org", x)) %>%
  unlist(use.names = F)

actresses <- data.frame(actresses_name = names, http_link = links, row.names = NULL, stringsAsFactors = F)

write.csv(x = actresses, file = 'indian_film_actresses.csv')
