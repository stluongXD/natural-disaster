# homicide server

library(dplyr)
source("scripts/race_vs_murder.R")
source("scripts/overview_chart.R")
source("scripts/intro_page.R")

shinyServer(
  function(input, output) {

    # calls function to create scatter plot
    output$scatter <- renderPlotly({
      return(
        affected_parties_age_plot(
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
