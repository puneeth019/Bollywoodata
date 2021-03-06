# Scrape Bollywood `Actor` names from wiki
library(rvest)  # Load `rvest` package

WorkDir <- "~/DA/Projects/Bollywoodata/actors/"
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
  lapply(FUN = function(x) paste0("https://en.wikipedia.org", x)) %>%
  unlist(use.names = F)

actors <- data.frame(Actor = names, Link = links, row.names = NULL, stringsAsFactors = F)

write.csv(x = actors, file = 'indian_film_actors.csv')
