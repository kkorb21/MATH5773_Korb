#' Plot Corrosion Data and Return Confidence Intervals
#'
#' Fits a linear model to the epoxy corrosion dataset and produces a boxplot of corrosion rate by exposure time.
#' Also returns a named list of (1 - alpha)100% confidence intervals for the model coefficients.
#'
#' @name gginterval
#' @param df A data frame containing the epoxy data with factors `SYSTEM` and `EXP-TIME`.
#' @param alpha Significance level for the confidence intervals (default is 0.05).
#'
#' @return A named list of lower and upper confidence bounds for each model coefficient.
#' @export
#'
#' @importFrom stats lm confint
#' @importFrom ggplot2 ggplot aes geom_boxplot geom_point labs theme_minimal position_jitter
#' @importFrom dplyr %>%
#'
#' @examples
#' # Example depends on the `myrebase()` function to set factor reference levels
#' dfr <- myrebase(df = epoxy, SYSTEM_base = 2, EXP_base = 60)
#' gginterval(dfr, alpha = 0.05)
utils::globalVariables(c("CORRATE", "EXP-TIME"))

gginterval <- function(df, alpha = 0.05) {
  model <- lm(CORRATE ~ SYSTEM + `EXP-TIME`, data = df)

  p <- df %>%
    ggplot(aes(x = `EXP-TIME`, y = CORRATE, fill = `EXP-TIME`)) +
    geom_boxplot() +
    geom_point(position = position_jitter(width = 0.1), size = 2) +
    theme_minimal() +
    labs(title = paste0((1 - alpha) * 100, "% Confidence Intervals for Beta Estimates"))

  ci <- confint(model, level = 1 - alpha)
  ci_df <- as.data.frame(ci)
  names(ci_df) <- c("Lower", "Upper")

  return(list(plot = p, intervals = ci_df))
}
