# Scrape Bollywood Actress names from wiki
library(XML) # Load `XML` package

setwd("~/Documents/DA/Projects/Bollywood_Jewels/")
  # Set Working directory
file_url <- "https://en.wikipedia.org/wiki/List_of_Bollywood_actresses"
  # Assign the wiki url to `file_url`

if(!file.exists("List_of_Bollywood_actresses.html")){
  download.file(url = file_url, destfile = "List_of_Bollywood_actresses.html")
}
  # Check if the html file exists already. If not, download it.

main_doc <- htmlTreeParse(file = "List_of_Bollywood_actresses.html", useInternalNodes = TRUE)
  # Parse the html file

table <- readHTMLTable(doc =  main_doc, header = TRUE)
  # Read all the tables in the html file

jewels_list <- as.character(NULL)

getjewelslist <- function(x){
  
  table_temp <- x
  table_temp_df <- as.data.frame(x = table_temp)
  jewels_list_temp <- unlist(x = table_temp_df[1], use.names = F)
  jewels_list_char_temp <- as.character(x = jewels_list_temp)
  jewels_list <- append(x = jewels_list, values = jewels_list_char_temp)
  jewels_list
  
}

jewels_list <- unlist(x = sapply(X = table[5:14], FUN = getjewelslist), use.names =  F)
jewels_list <- unique(x = jewels_list)
