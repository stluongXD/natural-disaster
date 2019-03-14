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
        tags$h2("About us"),
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
            # Enter State Name
            textInput(
              "state_name",
              label = "Type Full State Name",
              value = "Washington"
            ),

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
        tags$h2("Murder's Relationship with victim Vs. The Weapon"),
        sidebarLayout(

          # Side panel to select race
          sidebarPanel(

            # select relationship
            selectInput(
              "relation",
              label = "Murder's Relationship",
              choices = unique(homicide_circumstance$Relationship),
              selected = "Husband"
            ),

            # select age range
            sliderInput(
              "age",
              label = "Murder's age",
              min = range(homicide_circumstance$OffAge)[1],
              max = range(homicide_circumstance$OffAge)[2],
              value = range(homicide_circumstance$OffAge)
            ),
            weapon_relationship_insight # insight gained from weapon pie chart
          ),

          mainPanel(
            plotlyOutput("pie")
          )
        )
      )
    )
  )
)
