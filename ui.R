# homicide ui
library(shiny)
library(plotly)

shinyUI(
  fluidPage(
    includeCSS("style.css"),
    navbarPage(
      tags$h1("Homicide Report"),
      tabPanel(
        tags$h2("Introduction"),
        tags$h3("Overview of Homicide Report"),
        tags$p("This website contains the data from the", 
               tags$a(herf = "http://www.murderdata.org", "Murder Accountability Project"),
               "This data includes unsolved homicides from the federal, state, and local government.
                This data exist because America do a terrible job at accounting and documenting unsolved
                homicides within the U.S. The organization of the Murder Accountability Project wanted to
                collect this data in order to create a more accurate record of unsolved murders. 
                We accessed this data through a csv file which the Murder Accountability Project has published.
                The data is updated by retired law enforcement investigators, investigative journalists,
               criminologists and other experts on various aspects of homicide who work for the organization."),
        tags$div(),
        tags$p("Through the charts, you would be able to answer the following questions."),
        tags$ol(
         tags$li("What is the preferred weapon of choice in murders?"),
         tags$li("Which race is more likely to experience a certain type of murder?"),
        tags$li("Do people with specific race tend to share a similar incident?
                (For example, do white people experience death because of a love triangle?)"),
        tags$li("Is gender connected to type of murder committed?"),
        tags$li("Does one gender experience a specific type of death?
                  (For example, do women experience deaths related to robbery often?)")
        ),
        tags$div(),
        tags$p("By recognizing the data analyzation above following people may have a greater impact;
               The city officials can use this to look at the homicide trends across the country.
               This data provides information on the relationship between victim and their killers and also the intent of the murder.
               This will help city officials establish list of potential signs/cues to spot future murders,
               which then help lower crime rates in cities. By understanding the data, city officials can develop a program that can potentially
               help people get out of those situations.")
        
        ),
    tabPanel(
      tags$h2("Overview of Homicides"),
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
      tags$h2("Race Vs. Homicide Circumstances"),
      sidebarLayout(
        
        # Side panel to select race
        sidebarPanel(
          # check box to select race
          selectInput(
            "race",
            label = "Race",
            choices = sort(unique(homicide_circumstance$OffRace))
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
          plotlyOutput("scatter")
        )
      )
    )
  )
)
)
