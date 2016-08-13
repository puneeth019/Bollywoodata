#  Bollywood Actress  list, source - wikipedia
library(XML)
file_url <- "https://en.wikipedia.org/wiki/List_of_Bollywood_actresses"
if(!file.exists("List_of_Bollywood_actresses.html")){
  download.file(url = file_url, destfile = "List_of_Bollywood_actresses.html")
}
main_doc <- htmlTreeParse(file = "List_of_Bollywood_actresses.html", useInternalNodes = TRUE)
jewels <- xpathSApply(doc = main_doc, "//tr//td//a[@title]",xmlValue)
