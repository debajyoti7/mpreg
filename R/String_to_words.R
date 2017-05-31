String_to_words <- function(string){
  # Lowercase
  temp <- tolower(string)

  #' Remove everything that is not a number or letter
  temp <- stringr::str_replace_all(temp,"[^a-zA-Z\\s]", "")

  #remove "motors"
  temp <- stringr::str_replace_all(temp,"moto(r|rs)", "")

  #remove whitespace
  temp <- stringr::str_replace_all(temp," ", "")

  # Shrink down to just one white space
  #temp <- stringr::str_replace_all(temp,"[\\s]+", " ")

  # Split it
  temp <- stringr::str_split(temp, " ")[[1]]
  # Get rid of trailing "" if necessary
  indexes <- which(temp == "")
  if(length(indexes) > 0){
    temp <- temp[-indexes]
  }
  return(temp)
}
