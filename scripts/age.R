# interactive chart
library(dplyr)
library(plotly)

# wigit change race and circumstance of homicide
# plot victim age vs offender age


affected_parties_age_plot <- function(
                                      dataset,
                                      selected_race,
                                      selected_circumstance) {
  # filters the data to the selected race and circumstance
  filtered_info <- dataset %>%
    filter(OffRace == selected_race) %>%
    filter(Circumstance == selected_circumstance)

  # creates age plot based on the data
  scatter_plot <- plot_ly(
    filtered_info,
    x = ~OffAge,
    y = ~VicAge,
    type = "scatter",
    text = paste0("Relationship: ", filtered_info$Relationship,
      "<br>",
      "Victim Gender: ", filtered_info$VicSex,
      "<br>",
      "Offender Gender: ", filtered_info$OffSex,
      sep = "<br>"
    ),
    mode = "markers"
  ) %>%
    layout(
      title = "Age Distribution of Homicide Victims and Offenders",
      xaxis = list(title = "Offender's Age (Years)"),
      yaxis = list(title = "Victim's Age (Years)")
    )
  scatter_plot
}
