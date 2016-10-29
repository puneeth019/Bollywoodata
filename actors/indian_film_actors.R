# Scrape Bollywood Actress names from wiki
library(XML)    # Load `XML` package
library(dplyr)  # Load `dplyr` package
library(rvest)  # Load `rvest` package
library(stringr)# Load `stringr` package

WorkDir <- "C:/DA/Projects/Bollywoodata/actors/"
setwd(dir = WorkDir)

file_url <- "https://en.wikipedia.org/wiki/List_of_Indian_film_actors"
# Assign the wiki url to `file_url`

names <- file_url %>%
  read_html() %>%
  html_nodes(css = '.column-width a') %>%
  html_text(trim = TRUE)

links <- file_url %>%
  read_html() %>%
  html_nodes(css = '.column-width a') %>%
  html_attr(name = 'href') %>% 
  lapply(FUN = function(x) paste0("https://en.wikipedia.org/", x)) %>%
  unlist(use.names = F)

actors <- data.frame(actor_name = names, http_link = links, row.names = NULL, stringsAsFactors = F)

write.csv(x = actors, file = 'indian_film_actors.csv')