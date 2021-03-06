# homicide ui
library(shiny)
library(plotly)
source("scripts/html_texts.R")

shinyUI(
  fluidPage(
    includeCSS("style.css"),
    navbarPage(
      tags$h1("Homicide Report"),
      tabPanel(
        tags$h2("Introduction"),
        intro, # prints intro to shiny
        our_questions, # prints our questions to shiny
        targeted_audience, # prints who our target audience is
        purpose # prints our purpose for using this dataset
      ),
      tabPanel(
        tags$h2("About Us"),
        # Information about each of our members
        about_steven,
        about_maya,
        about_terra,
        about_kirara
      ),

      tabPanel(
        tags$h2("Overview of Homicides"),
        # Side panel to select state and years
        sidebarLayout(
          sidebarPanel(
            # Select state to view
            selectInput(
              "state_name",
              label = "Select State Name",
              choices = sort(unique(case_info$State)),
              selected = "Washington",
              multiple = FALSE,
              selectize = TRUE),

            # Slider to select years
            sliderInput("years_input",
              label = "Timeline to Graph", min = 1976,
              max = 2017, value = c(1990, 2010), sep = ""
            )
          ),

          # shows bar plot
          mainPanel(
            plotlyOutput("overview"),
            homicide_overview_insight # insight gained from overview
          )
        )
      ),

      # creates a new tab
      tabPanel(
        tags$h2("Age Distribution of Offender and Victim"),
        sidebarLayout(

          # Side panel to select race
          sidebarPanel(
            # drop down menu to select race
            selectInput(
              "race",
              label = "Offender's Race",
              choices = sort(unique(homicide_circumstance$OffRace)),
              selected = "White"
            ),

            # drop down menu to select circumstances
            selectInput(
              "circumstances",
              label = "Circumstances of Homicide",
              choices = sort(unique(homicide_circumstance$Circumstance)),
              selected = "Lovers triangle"
            )
          ),

          # shows scatter plot displaying age
          mainPanel(
            plotlyOutput("scatter"),
            age_relationship_insight # insight gained from age plot
          )
        )
      ),
      # creates a new tab
      tabPanel(
        tags$h2("Murderer's Relationship With Victim Vs. The Weapon"),
        sidebarLayout(

          # Side panel to select race
          sidebarPanel(

            # select relationship
            selectInput(
              "relation",
              label = "Murderer's Relationship",
              choices = unique(homicide_circumstance$Relationship),
              selected = "Husband"
            ),

            age_range_error,

            # select age range
            sliderInput(
              "age",
              label = "Murderer's Age",
              min = range(homicide_circumstance$OffAge)[1],
              max = range(homicide_circumstance$OffAge)[2],
              value = range(homicide_circumstance$OffAge)
            )
          ),

          mainPanel(
            plotlyOutput("pie"),
            weapon_relationship_insight # insight gained from weapon pie chart
          )
        )
      )
    )
  )
)
