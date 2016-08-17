## Get Bollywood Actresses names as character vector

names <- as.character(NULL) # Initialise `names` character vector

# Function `getnames` to get names of Bollywood Actresses

getnames <- function(x){
  
  table_temp <- x
  table_temp_df <- as.data.frame(x = table_temp)
  names_temp <- unlist(x = names_temp_df[1], use.names = F)
  names_char_temp <- as.character(x = names_temp)
  names <- append(x = names, values = names_char_temp)
  names
  
}

names <- unlist(x = sapply(X = table[5:14], FUN = getnames), use.names =  F)
names <- unique(x = names)
