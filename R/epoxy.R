#' Epoxy Coating Corrosion Data
#'
#' A dataset containing corrosion rate measurements for four epoxy coating systems exposed to water for varying durations. The data is used to evaluate the effect of coating type and exposure time on corrosion performance.
#'
#' @name epoxy
#' @docType data
#'
#' @format A data frame with 12 rows and 3 columns:
#' \describe{
#'   \item{SYSTEM}{Factor indicating the epoxy coating system (levels 1–4)}
#'   \item{EXP-TIME}{Factor indicating the exposure time in hours (levels 1, 60, 120)}
#'   \item{CORRATE}{Numeric corrosion rate measured for each panel}
#' }
#'
#' @importFrom MATH5773Lab8KORB
#'
#' @source https://www.amazon.com/Statistics-Engineering-Sciences-William-Mendenhall/dp/1498728855
"epoxy"
