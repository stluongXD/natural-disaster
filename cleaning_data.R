library(dplyr)

# assumes full homicide data is in data folder and reads in the data
homicide <- read.csv("data/SHR76_17.csv", stringsAsFactors = F)

unwanted_columns <- c("Ori", "StateName", "Incident", "Incident", 
                      "ActionType", "Situation", "VicCount", "OffCount",
                      "fstate", "MSA", "VicEthnic", "OffEthnic", "Source", 
                      "Subcircum", "CNTYFIPS")

# filters out stange data (extremely large age, 0 year old offenders)
cleaned_data <- homicide %>%
  select(-unwanted_columns) %>% # removes unwanted columns
  filter(VicAge != 999) %>% 
  filter(OffAge != 999) %>% 
  filter(OffAge != 0)

# splits the cleaned data into two separate files
case_info <- cleaned_data[, c(1:8, 18)]
homicide_circumstance <- cleaned_data[, c(1, 9:17)]

# writes two new csv file with cleaned data
write.csv(case_info, file = "data/case_info.csv")
write.csv(homicide_circumstance, file = "data/homicide_circumstance.csv")

