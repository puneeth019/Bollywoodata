#  Bollywood Actress  list, source - wikipedia
library(XML)

file_url <- "https://en.wikipedia.org/wiki/List_of_Bollywood_actresses"

if(!file.exists("List_of_Bollywood_actresses.html")){
  download.file(url = file_url, destfile = "List_of_Bollywood_actresses.html")
}

main_doc <- htmlTreeParse(file = "List_of_Bollywood_actresses.html", useInternalNodes = TRUE)

#jewels <- xpathSApply(doc = main_doc, path = "//tr//td//a",xmlValue,"title")

table  <- readHTMLTable(doc =  main_doc, header = TRUE)

jewels  <- unlist(lapply(table[5:14], function(x) as.character(x[[1]])), use.names = FALSE)

function(x){
  x <- as.data.frame(x)
}

jewels  <- unlist(lapply(table[5:14], function(x), use.names = F))
jewels <- unique(jewels)
