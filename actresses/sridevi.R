# Sample script to scrape table from webpage

library(rvest)    # Load `rvest` package
library(dplyr)    # Load `dplyr` pacakge
library(stringr)  # Load `stringr` package

setwd("~/Documents/DA/Projects/Project1/actresses/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/Sridevi_filmography"
# Assign the wiki url to `file_url`

# Scrape `Tamil` movies

table_sridevi_tamil <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_sridevi_tamil <- table_sridevi_tamil[[1]]
  # convert `table_sridevi` from `list` into `data.frame`

# clean text in column-1
table_sridevi_tamil$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_tamil$Year)
table_sridevi_tamil$Year <- str_trim(string = table_sridevi_tamil$Year)

# clean text in column-2
table_sridevi_tamil$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_tamil$Film)
table_sridevi_tamil$Film <- str_trim(string = table_sridevi_tamil$Film)

# clean text in column-3
table_sridevi_tamil$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_tamil$Role)
table_sridevi_tamil$Role <- str_trim(string = table_sridevi_tamil$Role)

# clean text in column-4
table_sridevi_tamil$Source <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_tamil$Source)
table_sridevi_tamil$Source <- str_trim(string = table_sridevi_tamil$Source)

# Assign language in column-5
table_sridevi_tamil$Language <- "Tamil"


# Scrape `Malayalam` movies

table_sridevi_malayalam <- file_url %>%
  read_html() %>%
  html_nodes(xpath= '//*[@id="mw-content-text"]/table[3]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_sridevi_malayalam <- table_sridevi_malayalam[[1]]
# convert `table_sridevi` from `list` into `data.frame`

# clean text in column-1
table_sridevi_malayalam$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_malayalam$Year)
table_sridevi_malayalam$Year <- str_trim(string = table_sridevi_malayalam$Year)

# clean text in column-2
table_sridevi_malayalam$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_malayalam$Film)
table_sridevi_malayalam$Film <- str_trim(string = table_sridevi_malayalam$Film)

# clean text in column-3
table_sridevi_malayalam$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_malayalam$Role)
table_sridevi_malayalam$Role <- str_trim(string = table_sridevi_malayalam$Role)

# clean text in column-4
table_sridevi_malayalam$Source <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_malayalam$Source)
table_sridevi_malayalam$Source <- str_trim(string = table_sridevi_malayalam$Source)

# Assign language in column-5
table_sridevi_malayalam$Language <- "Malayalam"


# Scrape `Telugu` movies

table_sridevi_telugu <- file_url %>%
  read_html() %>%
  html_nodes(xpath= '//*[@id="mw-content-text"]/table[4]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_sridevi_telugu <- table_sridevi_telugu[[1]]
# convert `table_sridevi` from `list` into `data.frame`

# clean text in column-1
table_sridevi_telugu$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_telugu$Year)
table_sridevi_telugu$Year <- str_trim(string = table_sridevi_telugu$Year)

# clean text in column-2
table_sridevi_telugu$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_telugu$Film)
table_sridevi_telugu$Film <- str_trim(string = table_sridevi_telugu$Film)

# clean text in column-3
table_sridevi_telugu$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_telugu$Role)
table_sridevi_telugu$Role <- str_trim(string = table_sridevi_telugu$Role)

# clean text in column-4
table_sridevi_telugu$Source <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_telugu$Source)
table_sridevi_telugu$Source <- str_trim(string = table_sridevi_telugu$Source)

# Assign language in column-5
table_sridevi_telugu$Language <- "Telugu"


# Scrape `Kannada` movies

table_sridevi_kannada <- file_url %>%
  read_html() %>%
  html_nodes(xpath= '//*[@id="mw-content-text"]/table[5]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_sridevi_kannada <- table_sridevi_kannada[[1]]
# convert `table_sridevi` from `list` into `data.frame`

# clean text in column-1
table_sridevi_kannada$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_kannada$Year)
table_sridevi_kannada$Year <- str_trim(string = table_sridevi_kannada$Year)

# clean text in column-2
table_sridevi_kannada$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_kannada$Film)
table_sridevi_kannada$Film <- str_trim(string = table_sridevi_kannada$Film)

# clean text in column-3
table_sridevi_kannada$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_kannada$Role)
table_sridevi_kannada$Role <- str_trim(string = table_sridevi_kannada$Role)

# clean text in column-4
table_sridevi_kannada$Source <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_kannada$Source)
table_sridevi_kannada$Source <- str_trim(string = table_sridevi_kannada$Source)

# Assign language in column-5
table_sridevi_kannada$Language <- "Kannada"


# Scrape `Hindi` movies

table_sridevi_hindi <- file_url %>%
  read_html() %>%
  html_nodes(xpath= '//*[@id="mw-content-text"]/table[6]') %>%
  html_table(fill = TRUE, trim = TRUE, header = TRUE)

table_sridevi_hindi <- table_sridevi_hindi[[1]]
# convert `table_sridevi` from `list` into `data.frame`

table_sridevi_hindi <- select(table_sridevi_hindi, Year:Source)

# clean text in column-1
table_sridevi_hindi$Year <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_hindi$Year)
table_sridevi_hindi$Year <- str_trim(string = table_sridevi_hindi$Year)

# clean text in column-2
table_sridevi_hindi$Film <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_hindi$Film)
table_sridevi_hindi$Film <- str_trim(string = table_sridevi_hindi$Film)

# clean text in column-3
table_sridevi_hindi$Role <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_hindi$Role)
table_sridevi_hindi$Role <- str_trim(string = table_sridevi_hindi$Role)

# clean text in column-4
table_sridevi_hindi$Source <- gsub(pattern = "^$", replacement = NA_character_, x = table_sridevi_hindi$Source)
table_sridevi_hindi$Source <- str_trim(string = table_sridevi_hindi$Source)

# Assign language in column-5
table_sridevi_hindi$Language <- "Hindi"

table_sridevi <-  rbind(table_sridevi_tamil, table_sridevi_malayalam, table_sridevi_telugu, 
                        table_sridevi_kannada, table_sridevi_hindi)

write.csv(x =  table_sridevi, file = "sridevi.csv")
