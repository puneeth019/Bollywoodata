# Scrape Bollywood Actress names from wiki
library(XML) # Load `XML` package

setwd("C:/Users/lc067/Documents/DA/Projects/Project1/")
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
