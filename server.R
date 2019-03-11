# homicide server

library(dplyr)
source("scripts/race_vs_murder_chart.R")
source("scripts/overview_chart.R")

shinyServer(
  function(input, output) {

    # calls function to create plot
    output$bar <- renderPlot({
      return(
        races_vs_homicide_circumstance_plot(
          homicide_circumstance, input$race, input$circumstances
        )
      )
    })
    # calls function to create plot
    output$overview <- renderPlotly({
      overview_graph(
        homicide_circumstance, input$state_name, input$years_input
      )
    })
  }
)
