#Mod3_Ex2 Clean up Titanic Data
#Install and load Libraries
library(plyr)
library(dplyr)
library(dbplyr)
library(tidyverse)
library(data.table)

#Import dataset
titanic_original <- read_csv("~/Documents/DataScienceSpringboard/Mod3_Ex2/titanic_original.csv")

#Replace empty embarkation fields with S for Southampton
titanic_embarked <- titanic_original %>% mutate(embarked = ifelse(is.na(titanic_original$embarked), "S", embarked))
View(titanic_embarked)

#Calculate mean of known passenger ages
mean(titanic_embarked$age, na.rm=TRUE)

#Replace unknown ages with the mean
titanic_ages <- titanic_embarked %>% mutate(age = ifelse(is.na(titanic_original$age), "30", age))

#Replace empty fields in the boat column with "None"
titanic_boats <- titanic_ages %>% mutate(boat = ifelse(is.na(titanic_original$boat), "None", boat))
View(titanic_boats)

#Create new binary column to indicate cabin assignment
#First create new column with cabin data
titanic_hascabin <- mutate(titanic_boats, has_cabin = cabin)

#Then change cabin data to 0 and 1
titanic_hascabin <- titanic_hascabin %>% mutate(has_cabin = ifelse(is.na(titanic_hascabin$has_cabin), "0", 1))

#Write new csv
write_csv(titanic_hascabin, "titanic_clean.csv")