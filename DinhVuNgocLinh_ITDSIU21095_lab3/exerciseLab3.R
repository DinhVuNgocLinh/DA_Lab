#Exercise 1:
library(dplyr)
setwd("C:/Users/PC/OneDrive - VietNam National University - HCM INTERNATIONAL UNIVERSITY/Desktop/DA/Lab/LAB3")
ZipData <- read.csv("Zip_zhvi_4bd.csv")
MetroData <- read.csv("Metro_zhvi_4bd.csv")

#deal with metro data first
MetroData <- MetroData %>% select(matches('RegionID|SizeRank|RegionName|RegionType|StateName|^X'))
# Remove the 'X' prefix from date columns
names(MetroData) <- gsub('^X', '', names(MetroData))
#make data tidy
library(tidyverse)
# Pivot data from wide to long format
MetroData_tidy <- MetroData %>% pivot_longer(cols = -c(RegionID, SizeRank, RegionName, RegionType, StateName), names_to = "Date", values_to = "Value")

# deal with zip data
ZipData <- ZipData %>% select(matches('RegionID|SizeRank|RegionName|RegionType|StateName|State|City|Metro|CountyName|^X'))
# Remove the 'X' prefix from date columns
names(ZipData) <- gsub('^X', '', names(ZipData))
library(tidyverse)
#StateName  column and State column have the same value so make it become 1 columns only to make data tidy
ZipData <- ZipData %>% select(-State)
# Pivot data from wide to long format
ZipData_tidy <- ZipData %>% pivot_longer(cols = -c(RegionID, SizeRank, RegionName, RegionType,StateName, City, Metro, CountyName), names_to = "Date", values_to = "Value")

#Exercise 2:
common_metro_zip <- merge(MetroData_tidy, ZipData_tidy, by.x = c("RegionID", "StateName"),by.y = c("RegionID","StateName"))
print(common_metro_zip)
#Exercise 3:
data_metro_zip <- merge(MetroData_tidy, ZipData_tidy, by = c("RegionID","SizeRank","RegionName","RegionType","StateName","Date","Value"), all = TRUE)
