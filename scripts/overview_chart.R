library(dplyr)
library(plotly)

overview_graph <- function(dataset, state_input, year_inputs) {

  # filters data down to the years and state selected
  filter_data <- dataset %>%
    filter(State == state_input, Year >= year_inputs[1], Year <= year_inputs[2]) %>%
    group_by(Year) %>%
    count()

  # Creates bar chart based on inputs
  bar_graph <- plot_ly(filter_data,
    x = filter_data$Year,
    y = filter_data$n,
    type = "bar",
    opacity = .8,
    text = paste("Year:", filter_data$Year, "<br>Homicides:", filter_data$n),
    hoverinfo = "text",
    marker = list(color = "Steel Blue")
  ) %>%
    layout(
      title = paste0("Homicides in ", state_input, " from ", year_inputs[1], "-", year_inputs[2]),
      xaxis = list(
        title = "Year",
        showticklabels = TRUE
      ),
      yaxis = list(
        title = "Number of Homicides",
        showticklabels = TRUE
      )
    )
  
  bar_graph
}
