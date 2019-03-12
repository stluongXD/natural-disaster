library(dplyr)
library(plotly)

options(warn = -1)

m <- list(
  l = 40,
  r = 40,
  b = 50,
  t = 50,
  pad = 0
)

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
    plot_ly(filtered_data, labels = ~Weapon, values = ~n, type = "pie") %>%
    layout(
      title = "Percentage of weapon usage",
      autosize = F, width = 800, height = 800, margin = m
    )
  
  pie
}
