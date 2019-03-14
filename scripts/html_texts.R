# html texts

# background information of homicide data 
intro <- tags$div(
  tags$h4(tags$b("Overview of Homicide Report")),
  tags$p(
    "This website contains the data from the",
    tags$a(
      herf = "http://www.murderdata.org",
      "Murder Accountability Project"
    ),
    "This data includes unsolved homicides from the federal, state, and local
    government.This data exist because America do a terrible job at accounting
    and documenting unsolved homicides within the U.S. The organization of the
    Murder Accountability Project wanted to collect this data in order to 
    create a more accurate record of unsolved murders. We accessed this data 
    through a csv file which the Murder Accountability Project has published. 
    The data is updated by retired law enforcement investigators, investigative
    journalists, criminologists and other experts on various aspects of 
    homicide who work for the organization. This data is only based on the
    homicides that were reported or discovered so it is possible for the data
    to be bias."
  ),
  tags$img(src = "crime_scene.jpg", width = "250px", height = "250px")
)

# questions we are tryingt to solve with the data
our_questions <- tags$div(
  tags$h4("What questions will be answered"),
  tags$ol(
    tags$li("What is the general trend in homicides? 
            Is the homicide rate decreasing?"),
    tags$li("Does age relate to the type of death they experience? "),
    tags$li("What is the preferred weapon of choice in murders?")
  )
)

# Explains who our target audience is
targeted_audience <- tags$div(
  tags$h4("Who is this for?"),
  tags$p(
    "By recognizing the data analyzation above following people may have 
    a greater impact; The city officials can use this to look at the homicide 
    trends across the country. This data provides information on the 
    relationship between victim and their killers and also the intent of the 
    murder. This will help city officials establish list of potential 
    signs/cues to spot future murders, which then help lower crime rates in 
    cities. By understanding the data, city officials can develop a program
    that can potentially help people get out of those situations."
    )
)

# Explains why we want to use this data
purpose <- tags$div(
  tags$h4("Why are we doing this?"),
  tags$p(
    "By understanding this data, we wanted to learn about the relationships
    between homicides, and gun violence. In addition, by finding out what
    aspects create tendency among others, it could become a source to lessen a
    tragedy and improve the safety of others. Steven and Terra are especially 
    interested in this data because Steven is a big fan of How To Get Away With
    Murder while Terra is a big CSI fan; they enjoy the drama of homicide as 
    described in shows which is why we chose this dataset"
    )
)

# Information about each of our group members

about_steven <- tags$div(
  tags$h3(tags$b("Steven Luong")),
  tags$img(src = "steven_pic.JPG", width = "150px", height = "200px"),
  tags$p(tags$b("Intended Majors:"), "Informatics and Geography"),
  tags$p(tags$b("Year:"), "Sophomore"),
  tags$p(
    "I enjoyed Info 201 because it taught me new skills of data wrangling
    and data visualization. I now want to use these new skills I have learned
    and apply them to other data sets I am interested in."
    )
)

about_maya <- tags$div(
  tags$h3(tags$b("Maya Klitsner")),
  tags$img(src = "MayaPic.jpg", width = "150px", height = "150px"),
  tags$p(tags$b("Major:"), "Human Centered Design and Engineering"),
  tags$p(tags$b("Year:"), "Junior"),
  tags$p(
    "Info 201 reminded me why I like coding and how I can improve my own
    projects to have data driven visualizations")
)

about_terra <- tags$div(
  tags$h3(tags$b("Terra Huang")),
  tags$img(src = "TerraPic.jpg", width = "200px", height = "150px"),
  tags$p(tags$b("Year:"), "Communications"),
  tags$p(tags$b("Year:"), "Sophomore"),
  tags$p(
    "Info 201 has me the skills to create visualization for 
    my future projects.")
)

about_kirara <- tags$div(
  tags$h3(tags$b("Kirara Nagatsuka")),
  tags$img(src = "KiraraPic.jpg", width = "150px", height = "150px"),
  tags$p(tags$b("Year:"), "Communications"),
  tags$p(tags$b("Year:"), "Junior"),
  tags$p("Info 201 taught me how to visualize data.")
)

# Insight gained from looking at the overview bar chart
homicide_overview_insight <- tags$div(
  tags$h3("Insight"),
  tags$p(
    "While looking at the graph, in many states you can see that there is a
    slow decline starting in 1995. After doing some research, I discovered that
    President Bill Clinton created a bill that increased the funding of law
    enforcement across the country. This increase in funding was shown to
    decrease crime rates for multiple years.")
)

# Insight gained from age scatter plot
age_relationship_insight <- tags$div(
  tags$h3("Insight"),
  tags$p(
    "This plot exist because we were curious if there was a connection
    between the victim and offender's age. We also wanted to know if different
    factors such as race and and circumstances played a role in who gets killed.
    While looking at the graphs by changing the offender's race or the 
    circumstnaces of the murder, the points seem to be random which
    suggests that there is no visible correlation between the offender's age
    and victims age. However, I did noticed for homicides due to lovers 
    triangles, the victims and offenders are usually relatively close in age.
    There were many outliers, but the general trend suggests that as the 
    offenders' age goes up, so does the victims'. This makes sense because 
    usually people date others who are around the same age as them."
    )
)

# Insight gained from weapon pie chart
weapon_relationship_insight <- tags$div(
  tags$h3("Pie Display"),
  tags$p(
    "The chart display the percentage of weapon usage 
    and the number of people killed with those weapons"
    )
)
