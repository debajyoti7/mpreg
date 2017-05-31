Clean_String <- function(string){
  # Lowercase
  temp <- tolower(string)

  #' Remove everything that is not a number or letter (may want to keep more later)
  temp <- stringr::str_replace_all(temp,"[^a-zA-Z\\s]", " ")


  #remove "motors"
  temp <- stringr::str_replace_all(temp,"moto(r|rs)", "")


  # Shrink down to just one white space
  temp <- stringr::str_replace_all(temp,"[\\s]+", " ")

  # Get rid of trailing "" if necessary
  indexes <- which(temp == "")
  if(length(indexes) > 0){
    temp <- temp[-indexes]
  }
  return(temp)
}
