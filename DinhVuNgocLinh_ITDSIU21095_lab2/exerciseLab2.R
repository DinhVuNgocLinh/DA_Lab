#Exercise 1:
library(dplyr)
setwd("C:/Users/PC/OneDrive - VietNam National University - HCM INTERNATIONAL UNIVERSITY/Desktop/DA/Lab/LAB2")
data <- read.csv("Zip_zhvi_4bd.csv")

# Keep only 'City', 'CountyName' and all date columns
data <- data %>% select(matches('City|CountyName|^X'))
# Remove the 'X' prefix from date columns
names(data) <- gsub('^X', '', names(data))
# Display the first 10 rows and columns
data[1:10, 1:10]

#Exercise 2: [20pts] Is this data tidy or untidy? Explain your reasoning. 

# -> data is tidy data if it satisfies three constraints:
#  1. each variable forms a column 
#  2. each observation forms a row 
#  3. each type of observational unit forms a table

# So we can see that from the given data, we have 286 total columns (variables) however for only 2 rows are about 2 variables that are
# CountryName and City and all 284 columns but the measurements taken at different times are essentially the same variable (the measurement)
# and they are spread across multiple columns like day by day( one for each day), This makes the data look messy and violates the first principle of tidy data, 
# which states that each variable should form a column, so we can represent it to 2 columns date (variable) and measurement (value) to make the data to tidy form

#Exercise 3:
library(tidyverse)
print(colnames(data))
# Pivot data from wide to long format
data_tidy <- data %>% pivot_longer(cols = -c(City, CountyName), names_to = "Date", values_to = "Measurement")

#Exercise 4:
data_tidy <- data_tidy %>% rename(monthly = Date, price = Measurement)

#Exercise 5:
# Convert 'monthly' to a date
data_tidy$monthly <- as.Date(data_tidy$monthly, format = "%Y.%m.%d")

# Filter data
data_filtered <- data_tidy %>% filter(City == "New York", price < 300000, monthly > as.Date("2010-08-31"))

#Exercise 6:
write.csv(data_filtered, file = "data_Exercise5.csv", row.names = FALSE)






