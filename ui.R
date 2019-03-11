# homicide ui
library(shiny)

shinyUI(
  navbarPage(
    "Homicides in America",
    tabPanel(
      "Overview of Homicides",
      # Side panel to select state and years
      sidebarLayout(
        sidebarPanel(
          # Enter State Name
          textInput("state_name", label = "Type Full State Name", value = "California"),

          # Slider to select years
          sliderInput("years_input",
            label = "Timeline to Graph", min = 1976,
            max = 2017, value = c(2000, 2009), sep = ""
          )
        ),

        # shows bar plot
        mainPanel(
          plotlyOutput("overview")
        )
      )
    ),
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
