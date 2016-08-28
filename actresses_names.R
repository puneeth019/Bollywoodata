# Scrape Bollywood Actress names from wiki
library(XML)    # Load `XML` package
library(dplyr)  # Load `dplyr` package
library(rvest)  # Load `rvest` package
library(stringr)# Load `stringr` package 

setwd("~/Documents/DA/Github/repos/Bollywoodata/")
# Set Working directory
file_url <- "https://en.wikipedia.org/wiki/List_of_Bollywood_actresses"
# Assign the wiki url to `file_url`

table_actresses_1940 <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
  html_table(header = TRUE, trim = TRUE, fill = TRUE)

table_actresses_1950 <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[3]') %>%
  html_table(header = TRUE, trim = TRUE, fill = TRUE)

table_actresses_1960 <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[4]') %>%
  html_table(header = TRUE, trim = TRUE, fill = TRUE)

table_actresses_1970 <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[5]') %>%
  html_table(header = TRUE, trim = TRUE, fill = TRUE)

table_actresses_1980 <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[6]') %>%
  html_table(header = TRUE, trim = TRUE, fill = TRUE)

table_actresses_1990_1 <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[7]') %>%
  html_table(header = TRUE, trim = TRUE, fill = TRUE)

table_actresses_1990_2 <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[8]') %>%
  html_table(header = TRUE, trim = TRUE, fill = TRUE)

table_actresses_2000 <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[9]') %>%
  html_table(header = TRUE, trim = TRUE, fill = TRUE)

table_actresses_2010_1 <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[10]') %>%
  html_table(header = TRUE, trim = TRUE, fill = TRUE)

table_actresses_2010_2 <- file_url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[11]') %>%
  html_table(header = TRUE, trim = TRUE, fill = TRUE)


# Convert `list`s into `data.frame`s
table_actresses_1940 <- table_actresses_1940[[1]]
table_actresses_1940 <- as.data.frame(x = table_actresses_1940)

table_actresses_1950 <- table_actresses_1950[[1]]
table_actresses_1950 <- as.data.frame(x = table_actresses_1950)

table_actresses_1960 <- table_actresses_1960[[1]]
table_actresses_1960 <- as.data.frame(x = table_actresses_1960)

table_actresses_1970 <- table_actresses_1970[[1]]
table_actresses_1970 <- as.data.frame(x = table_actresses_1970)

table_actresses_1980 <- table_actresses_1980[[1]]
table_actresses_1980 <- as.data.frame(x = table_actresses_1980)

table_actresses_1990_1 <- table_actresses_1990_1[[1]]
table_actresses_1990_1 <- as.data.frame(x = table_actresses_1990_1)

table_actresses_1990_2 <- table_actresses_1990_2[[1]]
table_actresses_1990_2 <- as.data.frame(x = table_actresses_1990_2)

table_actresses_2000 <- table_actresses_2000[[1]]
table_actresses_2000 <- as.data.frame(x = table_actresses_2000)

table_actresses_2010_1 <- table_actresses_2010_1[[1]]
table_actresses_2010_1 <- as.data.frame(x = table_actresses_2010_1)

table_actresses_2010_2 <- table_actresses_2010_2[[1]]
table_actresses_2010_2 <- as.data.frame(x = table_actresses_2010_2)

# Rename columns
names(table_actresses_1940) <- c("Name", "Film", "Year", "Film2", "Year2")
table_actresses_1940 <- select(.data = table_actresses_1940, (Name:Year))

names(table_actresses_1940) <- c("Name", "Film", "Year")
names(table_actresses_1950) <- c("Name", "Film", "Year")
names(table_actresses_1960) <- c("Name", "Film", "Year")
names(table_actresses_1970) <- c("Name", "Film", "Year")
names(table_actresses_1980) <- c("Name", "Film", "Year")
names(table_actresses_1990_1) <- c("Name", "Film", "Year")
names(table_actresses_1990_2) <- c("Name", "Film")
names(table_actresses_2000) <- c("Name", "Film", "Year")
names(table_actresses_2010_1) <- c("Name", "Film", "Year")
names(table_actresses_2010_2) <- c("Name", "Film", "Year")

# Convert `data.frame`s into  `tibble`s
table_actresses_1940 <- tbl_df(table_actresses_1940)
table_actresses_1950 <- tbl_df(table_actresses_1950)
table_actresses_1960 <- tbl_df(table_actresses_1960)
table_actresses_1970 <- tbl_df(table_actresses_1970)
table_actresses_1980 <- tbl_df(table_actresses_1980)
table_actresses_1990_1 <- tbl_df(table_actresses_1990_1)
table_actresses_1990_2 <- tbl_df(table_actresses_1990_2)
table_actresses_2000 <- tbl_df(table_actresses_2000)
table_actresses_2010_1 <- tbl_df(table_actresses_2010_1)
table_actresses_2010_2 <- tbl_df(table_actresses_2010_2)

# merge actresses names from all years into single `data.frame`
table_actresses_full <- full_join(x = table_actresses_1940, y =table_actresses_1950, by = NULL)
table_actresses_full <- full_join(x = table_actresses_full, y =table_actresses_1960, by = NULL)
table_actresses_full <- full_join(x = table_actresses_full, y =table_actresses_1970, by = NULL)
table_actresses_full <- full_join(x = table_actresses_full, y =table_actresses_1980, by = NULL)
table_actresses_full <- full_join(x = table_actresses_full, y =table_actresses_1990_1, by = NULL)
table_actresses_full <- full_join(x = table_actresses_full, y =table_actresses_1990_2, by = NULL)
table_actresses_full <- full_join(x = table_actresses_full, y =table_actresses_2000, by = NULL)
table_actresses_full <- full_join(x = table_actresses_full, y =table_actresses_2010_1, by = NULL)
table_actresses_full <- full_join(x = table_actresses_full, y =table_actresses_2010_2, by = NULL)

# remove repetitions
table_actresses_full <- table_actresses_full[!duplicated(x = table_actresses_full$Name),]

# clean text in column-1
table_actresses_full$Name <- table_actresses_full$Name
table_actresses_full$Name <- gsub(pattern = "(.*)\\(.*", replacement = '\\1', x = table_actresses_full$Name)
table_actresses_full$Name <- str_trim(string = table_actresses_full$Name)

# clean text in column-2
table_actresses_full$Film <- gsub(pattern = "(.*)[\n].*", replacement = '\\1', x = table_actresses_full$Film)
table_actresses_full$Film

write.csv(x = table_actresses_full, file = 'actresses_names.csv')
