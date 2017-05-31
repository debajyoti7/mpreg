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
