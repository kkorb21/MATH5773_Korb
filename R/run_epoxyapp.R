#' Launch the Epoxy App
#'
#' Runs the interactive Shiny application that visualizes epoxy data.
#'
#' @export
#' @importFrom shiny shinyAppDir
#'
#' @examples
#' \dontrun{
#' run_epoxyapp()
#' }

run_epoxyapp <- function() {
  app_dir <- system.file('epoxyapp', package = "MATH5773Lab8KORB")
  shiny::shinyAppDir(appDir = app_dir)
}
