# Project Proposal

## Project Description
We will be working with Homicide Reports from 1980-2017. The data comes from a non-profit group called the [Murder Accountability Project](https://www.google.com/url?q=http://www.murderdata.org/&sa=D&ust=1551846904135000&usg=AFQjCNE4VMjLHtt3KRptrZ-mb94n9bsp2g) which tracks unsolved homicides from the federal, state, and local government. The data can be downloaded [here](https://www.dropbox.com/s/5jewp8kf2kui42z/SHR76_17.csv.zip?dl=1). This data exist because America do a terrible job at accounting and documenting unsolved homicides within the U.S. The organization of the Murder Accountability Project wanted to collect this data in order to create a more accurate record of unsolved murders. We will be accessing this data through a csv file which the Murder Accountability Project has published. The data is updated by retired law enforcement investigators, investigative journalists, criminologists and other experts on various aspects of homicide who work for the organization.  

## Target Audience
The city officials can use this to look at the homicide trends across the country. This data provides information on the relationship between victim and their killers and also the intent of the murder. This will help city officials establish list of potential signs/cues to spot future murders, which then help lower crime rates in cities. By understanding the data, city officials can develop a programs that can potentially help people get out of those situations. 

## Three questions our project will answer are…
1. What is the general trend in homicides? Is the homicide rate decreasing?
2. Does age relate to the type of death they experience? 
3. What is the preferred weapon of choice in murders?

## Technical Description
We will be in our data with a CSV file. I noticed that some of the data cells are are empty or have “Unknown” in them so I anticipate that we will need to clean the data. We anticipate we will use leaflet to create maps and ggplot to create the charts. We will also need to use Shiny to create the rendered page for our project. We anticipate a major challenge is wrangling and cleaning the data because there is so much recorded and the CSV file is very large which will make it slightly difficult to analyze. 

Rendered version of project can be seen [here](https://stluongxd.shinyapps.io/homicide-report/)