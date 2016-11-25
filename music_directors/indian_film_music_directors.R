# Scrape Indian Film `Music Directors` names from wiki
library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` package
library(stringr)  # Load `stringr` pacakge

WorkDir <- "~/DA/projects/Bollywoodata/music_directors/"
setwd(dir = WorkDir)

file_url <- "https://en.wikipedia.org/wiki/List_of_Indian_film_music_directors"
# Assign the wiki url to `file_url`

names <- file_url %>%
  read_html() %>%
  html_nodes(css = 'td:nth-child(1) a') %>%
  html_text(trim = TRUE)

links <- file_url %>%
  read_html() %>%
  html_nodes(css = 'td:nth-child(1) a') %>%
  html_attr(name = 'href') %>% 
  unlist(use.names = F)

music_directors <- data.frame(name = names, http_link = links, row.names = NULL, stringsAsFactors = F)

write.csv(x = music_directors, file = 'indian_film_music_directors.csv
