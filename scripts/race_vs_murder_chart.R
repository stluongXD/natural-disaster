# race vs types of murder
library(dplyr)
library(ggplot2)
library(stringr)

races_vs_homicide_circumstance_plot <- function(
                                                dataset,
                                                selected_race,
                                                selected_circumstance) {

  # groups data by race and circumstances
  by_race <- dataset %>%
    group_by(OffRace, Circumstance) %>%
    count()

  # filters data to selected races and circumstance
  colnames(by_race)[colnames(by_race) == "n"] <- "occurance"
  filtered_info <- by_race %>%
    filter(Circumstance == selected_circumstance)
  row_index <- match(selected_race, filtered_info$OffRace, nomatch = 0)
  filtered_info <- filtered_info[row_index, ]

  # If there are no homicides conducted by a certain race for a specific homicide
  # creates a 0 value to display in chart
  if (length(selected_race) != nrow(filtered_info)) {
    no_value <- selected_race[!(selected_race %in% filtered_info$OffRace)]
    not_included <- data.frame(no_value, selected_circumstance, 0)
    colnames(not_included) <- c("OffRace", "Circumstance", "occurance")
    filtered_info <- bind_rows(filtered_info, not_included)
  }

  # wraps text so that labels won't overlap
  filtered_info$OffRace <- str_wrap(filtered_info$OffRace, width = 20)

  # creates bar chart
  bar_chart <- ggplot(
    data = filtered_info,
    aes(x = OffRace, y = occurance)
  ) +
    xlab("Offender Race") +
    ylab("Number of Homicide") +
    ggtitle(paste0("Homicide reason: ", selected_circumstance)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    geom_text(aes(label = occurance), vjust = -0.5, color = "black", size = 3.5)

  bar_chart
}
