# homicide ui
library(shiny)

shinyUI(
  navbarPage(
    "Homicides in America",

    # creates a new tab
    tabPanel(
      "Race Vs. Homicide circumstances",
      sidebarLayout(

        # Side panel to select race
        sidebarPanel(
          # check box to select race
          checkboxGroupInput(
            "race",
            label = "Race",
            choices = unique(homicide_circumstance$OffRace),
            selected = "White"
          ),

          # drop down menu to select circumstances
          selectInput(
            "circumstances",
            label = "Circumstances of Homicide",
            choices = sort(unique(homicide_circumstance$Circumstance))
          )
        ),

        # shows bar plot
        mainPanel(
          plotOutput("bar")
        )
      )
    )
  )
)
