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
        tags$h4(tags$b("Overview of Homicide Report")),
        tags$p(
          "This website contains the data from the",
          tags$a(herf = "http://www.murderdata.org", "Murder Accountability Project"),
          "This data includes unsolved homicides from the federal, state, and local government.
                This data exist because America do a terrible job at accounting and documenting unsolved
                homicides within the U.S. The organization of the Murder Accountability Project wanted to
                collect this data in order to create a more accurate record of unsolved murders.
                We accessed this data through a csv file which the Murder Accountability Project has published.
                The data is updated by retired law enforcement investigators, investigative journalists,
               criminologists and other experts on various aspects of homicide who work for the organization."
        ),
        tags$img(src = "http://static-29.sinclairstoryline.com/resources/media/143863df-44fd-413f-942a-21e09595fe8c-large16x9_crimescene.jpg?1551998679500", width = "250px", height = "250px"),
        tags$div(
          tags$h4("What questions will be answered"),
        tags$ol(
         tags$li("Does Age relate to the type of death they experience? "),
         tags$li("Which race is more likely to experience a certain type of murder?
                  Do people with specific race tend to share a similar incident?
                 (For example, do white people experience death because of a love triangle?)"),
        tags$li("What is the preferred weapon of choice in murders?")

        )),
        tags$div(
          tags$h4("Who is this for?"),
        tags$p("By recognizing the data analyzation above following people may have a greater impact;
               The city officials can use this to look at the homicide trends across the country.
               This data provides information on the relationship between victim and their killers and also the intent of the murder.
               This will help city officials establish list of potential signs/cues to spot future murders,
               which then help lower crime rates in cities. By understanding the data, city officials can develop a program that can potentially
               help people get out of those situations.")
      ),
      tags$div(
        tags$h4("Why are we doing this?"),
                tags$p("By understanding this data, we wanted to learn about the relationships between homicides,
                       and gun violence. In addition, by finding out what aspects create tendency among others,
                       it could become a source to lessen a tragedy and improve the safety of others.")
      )
      ),
      tabPanel(
        tags$h2("About us"),
       tags$div(tags$h3(tags$b("Steven Luong")),
                tags$img(),
                tags$p()),
       tags$div(tags$h3(tags$b("Maya Klitsner")),
                tags$img(),
                tags$p(tags$b("Major:"), "Human Centered Design and Engineering"),
                tags$p(tags$b("Year:"),  "Junior"),
                tags$p("Info 201 reminded me why I like coding and how I can improve my own
                       projects to have data driven visualizations")),
       tags$div(tags$h3(tags$b("Terra Huang")),
                tags$img(),
                tags$p()),
       tags$div(tags$h3(tags$b("Kirara Nagatsuka")),
                tags$img(src = "https://scontent-sea1-1.cdninstagram.com/vp/23cd4be8fc0f0e1f73fa23a28fddba0b/5CE665D9/t51.2885-19/s150x150/51439657_714727105587494_3301035323093417984_n.jpg?_nc_ht=scontent-sea1-1.cdninstagram.com", width = "150px", height = "150px"),
                tags$p(tags$b("Year:"), "Communications"),
                tags$p(tags$b("Year:"), "Junior"),
                tags$p("Info 201 taught me how to visualize data.")
                )),
      tabPanel(
        tags$h2("Overview of Homicides"),
        # Side panel to select state and years
        sidebarLayout(
          sidebarPanel(
            # Enter State Name
            textInput("state_name", label = "Type Full State Name", value = "Washington"),

            # Slider to select years
            sliderInput("years_input",
              label = "Timeline to Graph", min = 1976,
              max = 2017, value = c(1990, 2010), sep = ""
            )
          ),

          # shows bar plot
          mainPanel(
            plotlyOutput("overview"),
            tags$h3("Insight"),
            tags$p("While looking at the graph, in many states you can see that there is a slow decline
                    starting in 1995. After doing some research, I discovered that President Bill Clinton
                    created a bill that increased the funding of law enforcement across the country. This
                    increase in funding was shown to decrease crime rates for multiple years.")
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
              label = "Murder Relationship",
              choices = unique(homicide_circumstance$Relationship),
              selected = "Husband"
            ),

            # select age range
            sliderInput(
              "age",
              label = "Murder age",
              min = range(homicide_circumstance$OffAge)[1],
              max = range(homicide_circumstance$OffAge)[2],
              value = range(homicide_circumstance$OffAge)
            )
          ),

          mainPanel(
            plotlyOutput("pie")
          )
        )
      )
    )
  )
)
