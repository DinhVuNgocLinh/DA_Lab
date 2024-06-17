#Exercise 1:
library(dplyr)
setwd("C:/Users/PC/OneDrive - VietNam National University - HCM INTERNATIONAL UNIVERSITY/Desktop/DA/Lab/LAB7")
data <- read.csv("AgeofInventory.csv")
# Keep only 'City', 'CountyName' and all date columns
data <- data %>% select(matches('RegionName|^X'))
# Remove the 'X' prefix from date columns
names(data) <- gsub('^X', '', names(data))
# Display the first 10 rows and columns
data[1:10, 1:10]

#Exercise 2:
# Reshape the data from wide to long format
library(tidyr)
data_long <- data %>% 
  pivot_longer(cols = -c(RegionName), names_to = "month", values_to = "age")
# Convert the 'month' column to Date format
data_long$month <- as.Date(data_long$month, format = "%Y.%m.%d")
# Display the first 10 rows
head(data_long, 10)

#Exercise 3:
library(ggplot2)
data_long %>% ggplot(aes(month, age)) + geom_line()
basic_plot <- data_long %>% ggplot(aes(month, age, group = RegionName)) + geom_line(alpha = 0.1)

#Exercise 4:
# Filter the data to keep only Washington, DC and the rest
data_long_wa <- data_long %>%
  mutate(RegionName = ifelse(RegionName == "Washington, DC", "Washington, DC", "Rest"))
# Plot the data with different colors and sizes for Washington, DC and the rest
basic_plot_wa <- ggplot(data_long_wa, aes(month, age, color = RegionName, linewidth = RegionName)) +
  geom_line() +
  scale_color_manual(values = c("Rest" = "grey", "Washington, DC" = "blue")) +
  scale_linewidth_manual(values = c("Rest" = 0.5, "Washington, DC" = 0.5)) +
  theme(legend.position = "none")
# Print the plot
print(basic_plot_wa)

#Exercise 5:
install.packages("ggthemes")
library(ggthemes)
# Plot the data with the Economist theme
basic_plot_wa <- ggplot(data_long_wa, aes(month, age, color = RegionName, linewidth = RegionName)) +
  geom_line() +
  scale_color_manual(values = c("Rest" = "lightblue", "Washington, DC" = "black")) +
  scale_linewidth_manual(values = c("Rest" = 0.5, "Washington, DC" = 0.5)) +
  theme_economist() +
  theme(legend.position = "none")
# Print the plot
print(basic_plot_wa)

#Exercise 6:
# Plot the data with the Economist theme and a title
basic_plot_wa <- ggplot(data_long_wa, aes(month, age, color = RegionName, linewidth = RegionName)) +
  geom_line() +
  scale_color_manual(values = c("Rest" = "lightblue", "Washington, DC" = "black")) +
  scale_linewidth_manual(values = c("Rest" = 0.5, "Washington, DC" = 0.5)) +
  theme_economist() +
  theme(legend.position = "none") +
  ggtitle("Median Days Listed by Metro Area")

# Print the plot
print(basic_plot_wa)
