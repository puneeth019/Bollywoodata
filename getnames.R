## Get Bollywood Actresses names as character vector

names <- as.character(NULL) # Initialise `names` character vector

# Function `getnames` to get names of Bollywood Actresses

getnames <- function(x){
  
  table_temp <- x # Assign `x` to variable `table_temp`
  table_temp_df <- as.data.frame(x = table_temp)  # Convert `table_temp` into a `data.frame`
  names_temp <- unlist(x = table_temp_df[1], use.names = F) # Unlist & extract first column of `table_temp_df`
  names_char_temp <- as.character(x = names_temp) # Convert the `factor`s in `names_temp` into `character
  names <- append(x = names, values = names_char_temp)  # Append the character vectors `names` & `names_char_temp` into single vector
  names # Retun the character vector `names`
  
}

names <- unlist(x = sapply(X = table[5:14], FUN = getnames), use.names =  F)
  # Apply fucntion `getnames` on the other `data.frame`s of `table`
names <- unique(x = names)
