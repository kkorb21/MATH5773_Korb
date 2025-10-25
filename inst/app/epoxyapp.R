#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

ui <- fluidPage(
  titlePanel("Epoxy Corrosion Analysis"),

  sidebarLayout(
    sidebarPanel(
      selectInput("system_base", "Select SYSTEM baseline:",
                  choices = sort(unique(epoxy$SYSTEM))),
      selectInput("exp_base", "Select EXP-TIME baseline:",
                  choices = sort(unique(epoxy$`EXP-TIME`))),
      sliderInput("alpha", "Select alpha (significance level):",
                  min = 0.01, max = 0.20, value = 0.05, step = 0.01)
    ),

    mainPanel(
      plotOutput("corrosionPlot"),
      h4("Confidence Intervals for Model Coefficients"),
      tableOutput("intervalTable")
    )
  )
)

server <- function(input, output) {
  reactive_data <- reactive({
    MATH5773Lab8KORB::myrebase(epoxy, SYSTEM_base = input$system_base, EXP_base = input$exp_base)
  })

  reactive_model <- reactive({
    MATH5773Lab8KORB::gginterval(reactive_data(), alpha = input$alpha)
  })

  output$corrosionPlot <- renderPlot({
    reactive_model()$plot
  })

  output$intervalTable <- renderTable({
    reactive_model()$intervals
  }, rownames = TRUE)
}

shinyApp(ui = ui, server = server)
