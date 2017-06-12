#' check_Regex
#'
#' @param makeRex regex to be checked
#' @param dfeng_clean subsetted dataframe to be checked for matches
#' @param mk make of car being checked for, defaults to maruti
#' @param nc length of engineId, defaults to 11
#'
#' @return
#' @export
#'
#' @examples
check_regex <- function(makeRex, dfeng_clean, mk = "maruti", nc = 11){
  out <- dfeng_clean %>%
    filter(InsurerMakeName == mk, nchar(EngineNumber) == nc) %>%
    mutate(k = re_matches(EngineNumber, makeRex)) %>%
    group_by(InsurerMakeName) %>%
    summarise(match_pct = sum(k)*100/length(k))

  return(out$match_pct)

}




#' Find failing cases
#'
#' @param makeRex regex to test
#' @param dfeng_clean dataset, specific format
#' @param mk make to test against
#' @param nc number of characters to test against
#'
#' @return rows of dataset that fail to match the regex
#' @export find_Fails
#'
#' @examples
find_Fails <- function(makeRex, dfeng_clean, mk = "maruti", nc = 11){
  dfeng_clean %>%
    filter(InsurerMakeName == mk, nchar(EngineNumber) == nc) %>%
    mutate(k = re_matches(EngineNumber, makeRex)) %>%
    filter( k == FALSE) %>%
    as.data.frame() %>%
    return()
}







#' Check Chassis regex
#'
#' @param makeRex
#' @param dfchassis_clean
#' @param mk
#' @param nc
#'
#' @return
#' @export
#'
#' @examples
check_regex_chassis <- function(makeRex, dfchassis_clean, mk = "maruti", nc = 11){
  out <- dfchassis_clean %>%
    filter(InsurerMakeName == mk, nchar(ChasisNumber) == nc) %>%
    mutate(k = re_matches(ChasisNumber, makeRex)) %>%
    group_by(InsurerMakeName) %>%
    summarise(match_pct = sum(k)*100/length(k))

  return(out$match_pct)

}




#' Title
#'
#' @param makeRex
#' @param dfchassis_clean
#' @param mk
#' @param nc
#'
#' @return
#' @export
#'
#' @examples
find_Fails_chassis <- function(makeRex, dfchassis_clean, mk = "maruti", nc = 11){
  dfchassis_clean %>%
    filter(InsurerMakeName == mk, nchar(ChasisNumber) == nc) %>%
    mutate(k = re_matches(ChasisNumber, makeRex)) %>%
    filter( k == FALSE) %>%
    as.data.frame() %>%
    return()
}
