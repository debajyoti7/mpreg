## Read in the definitions
def = "data/input/posix_definitions.xlsx"
sheets = excel_sheets(def)

dfposix <- read_excel(def, sheets[1])



#' Substitute the definitions
#'
#' @param x
#' @param b
#'
#' @return
#' @export
#'
#' @examples
convert <- function(x, b = b1) {
  map <- b
  for (i in seq_along(map)) {
    x <- gsub(names(map)[[i]], map[[i]], x)
  }
  x
}




#' Transform rex to conventional regex
#'
#' @param makeRex
#'
#' @return
#' @export
#'
#' @examples
reg_to_norm <- function(makeRex = maruti11){

  #TO DO: add check for start and end characters

  #remove start and end characters
  makeRex <- substr(makeRex, 2, nchar(makeRex) - 1)[1]

  a <- unlist(dfposix$POSIX)
  b <- unlist(dfposix$ASCII)

  a1 <- gsub("\\]","", gsub("\\[","", a))
  b1 <- gsub("\\]","", gsub("\\[","", b))
  names(b1) <- a1

  out <- convert(makeRex, b = b1)

  gsub("\\]\\]","\\]", gsub("\\[\\[","\\[", out))

  return(out)

}





