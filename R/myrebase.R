#' Relevel Factors in Epoxy Dataset
#'
#' Reassigns the reference levels for the `SYSTEM` and `EXP-TIME` factors in the epoxy dataset.
#' This is useful for customizing baseline comparisons in linear models, especially when aligning with external software like SAS.
#'
#' @name myrebase
#' @param df A data frame containing the epoxy data, with `SYSTEM` and `EXP-TIME` as factors or character vectors.
#' @param SYSTEM_base A value indicating the desired reference level for the `SYSTEM` factor.
#' @param EXP_base A value indicating the desired reference level for the `EXP-TIME` factor.
#'
#' @return A modified data frame with `SYSTEM` and `EXP-TIME` re-leveled to the specified baselines.
#' @export
#'
#' @importFrom stats relevel
#'
#' @examples
#' df <- myrebase(df = epoxy, SYSTEM_base = 2, EXP_base = 60)
#' ylm <- lm(CORRATE ~ SYSTEM + `EXP-TIME`, data = df)
#' summary(ylm)

myrebase <- function(df, SYSTEM_base, EXP_base) {

  df$SYSTEM <- factor(df$SYSTEM)
  df$`EXP-TIME` <- factor(df$`EXP-TIME`)

  df$SYSTEM <- relevel(df$SYSTEM, ref = as.character(SYSTEM_base))

  df$`EXP-TIME` <- relevel(df$`EXP-TIME`, ref = as.character(EXP_base))

  return(df)
}
