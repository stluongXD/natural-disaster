library(dplyr)
library(plotly)






overview_graph <- function(dataset, state_input, year_inputs) {
  filter_data <- homicide_data %>% 
    filter(State == state_input, Year > year_inputs[1], Year < year_inputs[2]) %>% 
    group_by(Year) %>% 
    count() 
  
  
  bar_graph <- plot_ly(filter_data,
                       x = filter_data$Year,
                       y = filter_data$n, 
                       type = "bar",
                       opacity = .8,
                       hoverinfo = "y" )

  bar_graph
}