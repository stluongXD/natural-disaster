# homicide server

library(dplyr)
source("scripts/age.R")
source("scripts/overview_chart.R")
source("scripts/intro_page.R")
source("scripts/relationship_chart.R")

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
        case_info, input$state_name, input$years_input
      )
    })

    output$pie <- renderPlotly({
      pie_graph(homicide_circumstance, input$age, input$relation)
    })
  }
)
