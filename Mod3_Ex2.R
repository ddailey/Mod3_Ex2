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
