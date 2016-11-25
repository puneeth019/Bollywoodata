# Scrape Indian Film `Cinematographer` names from wiki
library(rvest)  # Load `rvest` package
library(dplyr)  # Load `dplyr` package

WorkDir <- "~/DA/projects/Bollywoodata/cinematographers/"
setwd(dir = WorkDir)

file_url <- "https://en.wikipedia.org/wiki/Indian_cinematographers"
# Assign the wiki url to `file_url`

names <- file_url %>%
  read_html() %>%
  html_nodes(css = '.column-count-3 a:nth-child(1)') %>%
  html_text(trim = TRUE)

links <- file_url %>%
  read_html() %>%
  html_nodes(css = '.column-count-3 a:nth-child(1)') %>%
  html_attr(name = 'href') %>% 
  unlist(use.names = F)

cinematographers <- data.frame(name = names, http_link = links, row.names = NULL, stringsAsFactors = F) %>%
  filter(name != "[1]")

write.csv(x = cinematographers, file = 'indian_film_cinematographers.csv')
