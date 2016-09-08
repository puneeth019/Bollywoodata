# Scrape Bollywood Actress data from wiki
library(rvest) # Load `XML` package
library(dplyr) # Load `dplyr` package
library(stringr) # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Meena_Kumari"
# Assign the wiki url to `file_url`

table_meenakumari <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/blockquote[4]/table[1]') %>%
  html_table(header = T, trim = T, fill = T)

table_meenakumari <- table_meenakumari[[1]]
table_meenakumari <- as.data.frame(table_meenakumari)
  # convert `table_meenakumari` `list` into `data.frame`

names(table_meenakumari) <- c("Year", "Film", "Role", "Notes")
  # rename columns of `text.nargis`

table_meenakumari <- select(.data = table_meenakumari, (Year:Role))

# clean text in column-1
table_meenakumari$Year <- gsub(pattern = '^$', replacement = NA_character_, x = table_meenakumari$Year)
table_meenakumari$Year <- str_trim(string = table_meenakumari$Year)

# clean text in column-2
table_meenakumari$Film <- gsub(pattern = '^$', replacement = NA_character_, x = table_meenakumari$Film)
table_meenakumari$Film <- str_trim(string = table_meenakumari$Film)

# clean text in column-3
table_meenakumari$Role <- gsub(pattern = '^$', replacement = NA_character_, x = table_meenakumari$Role)
table_meenakumari$Role <- str_trim(string = table_meenakumari$Role)

write.csv(x = table_meenakumari, file = "meena_kumari.csv")
