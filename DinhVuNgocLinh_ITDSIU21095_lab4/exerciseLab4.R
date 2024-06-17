#Exercise 1:
summarize(new_data_metro_zip, n = n(), na.rm = FALSE)
sum(is.na(new_data_metro_zip$Price))

#Exercise 2:
mean(new_data_metro_zip$Price, na.rm = TRUE)

#Exercise 3:
library(dplyr)
region_mean_price <- new_data_metro_zip %>% group_by(RegionType) %>% summarize(mean_price = mean(Price, na.rm = TRUE))
print(region_mean_price)

#Exercise 4:
#median
median_price <- median(new_data_metro_zip$Price, na.rm = TRUE)
print(median_price)
#standard deviation
sd_price <- sd(new_data_metro_zip$Price, na.rm = TRUE)
print(sd_price)

#Exercise 5:
region_percent <- new_data_metro_zip %>% group_by(RegionType) %>% summarize(n = n()) %>% mutate(freq = n / sum(n))
print(region_percent)

#Exercise 6:
region_state_summary <- new_data_metro_zip %>% group_by(RegionType, StateName) %>% summarize(n = n()) %>% mutate(freq = n / sum(n))
print(region_state_summary)

#Exercise 7:
state_mean_price <- new_data_metro_zip %>% group_by(StateName) %>% summarize(mean_price = mean(Price, na.rm = TRUE))
print(state_mean_price)

#Exercise 8:
my_table <- new_data_metro_zip %>% group_by(RegionType) %>% summarize(Mean = mean(Price, na.rm = TRUE), Median = median(Price, na.rm = TRUE), 'Standard Deviation' = sd(Price, na.rm = TRUE))
print(my_table)
#save as .png file
library(gridExtra)
library(grid)
grid_table <- tableGrob(my_table)
png(filename = "my_table.png")
grid.draw(grid_table)
dev.off()


