library(dplyr)
library(plotly)

options(warn = -1)

pie_graph <- function(data, slider, selecter) {
  data <- homicide_circumstance %>%
    filter(OffAge > slider[1], OffAge < slider[2])
  
  type_occurence <- data %>%
    group_by(Relationship, Weapon) %>%
    count()
  
  # filter the relations and murders
  filtered_data <- type_occurence %>%
    filter(Relationship == selecter)
  
  pie <-
    plot_ly(filtered_data, labels = ~Weapon, values = ~n, type = "pie",
            textposition = "inside",
            text = ~ paste("Num killed:", n, "<br>")) %>%
    layout(
      title = "Percentage of Weapon Usage"
    )
  
  pie
}
