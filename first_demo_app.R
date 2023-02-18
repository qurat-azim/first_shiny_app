library(shiny)

ui <- fluidPage(
  sliderInput(
    inputId = "bins",
    label = "Number of bins",
    min = 2,
    max = 50,
    value = 30),
  plotOutput(outputId = 'distplot')
  
  
  
)

server <- function(input, output, session){
  
  output$distplot <- renderPlot({
  # generate bins based on input$bins from ui.R
  x    <- faithful[, 2]
  bins <- seq(min(x), max(x), length.out = input$bins + 1)
  
  # draw the histogram with the specified number of bins
  hist(x, breaks = bins, col = 'darkgray', border = 'white',
       xlab = 'Waiting time to next eruption (in mins)',
       main = 'Histogram of waiting times')
  })
  
}

shinyApp(ui, server)