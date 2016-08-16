# Scrape Bollywood Jewels list from wiki
# Source - Wikipedia
library(XML)

setwd("C:/Users/lc067/Documents/DA/Projects/Bollywood_Jewels/")
file_url <- "https://en.wikipedia.org/wiki/List_of_Bollywood_actresses"

if(!file.exists("List_of_Bollywood_actresses.html")){
  download.file(url = file_url, destfile = "List_of_Bollywood_actresses.html")
}

main_doc <- htmlTreeParse(file = "List_of_Bollywood_actresses.html", useInternalNodes = TRUE)

# jewels <- xpathSApply(doc = main_doc, path = "//tr//td//a", xmlValue,"title")

table <- readHTMLTable(doc =  main_doc, header = TRUE)
# jewels  <- unlist(lapply(table[5:14], function(x) as.character(x[[1]])), use.names = FALSE)

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
