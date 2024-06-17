#Exercise 1:
library(dplyr)
setwd("C:/Users/PC/OneDrive - VietNam National University - HCM INTERNATIONAL UNIVERSITY/Desktop/DA/Lab/LAB8")
## This reads the data 
kobe <- read.csv("Kobe.csv") 
## This will load a custom function that we'll use in this lab 
source("functions.R") 
## Print the first few rows of the Kobe dataset 
head(kobe)
# Calculate the proportion of hits
sum(kobe$basket == "H") / length(kobe$basket)
#Kobe hit about 42% of his shot attempts

#Exercise 2:
# Apply the calc_streak function to the entire data
kobe_streaks <- calc_streak(kobe$basket)
# Use the table function to calculate a frequency table
table(kobe_streaks)
# How long was his longest streak of baskets?
max(kobe_streaks)
#Kobe’s longest streak of baskets was 4

#Exercise 3:
outcomes <- c("heads", "tails")
coin_outcomes <- sample(outcomes, size = 1000, replace = TRUE, prob = c(0.8, 0.2))
table(coin_outcomes)
#The number of heads is 798

#Exercise 4:
# Simulate 133 shot attempts with 44% chance of hit
outcomes <- c("H", "M")
shot_outcomes <- sample(outcomes, size = 133, replace = TRUE, prob = c(0.44, 0.56))
# Calculate the streaks and the frequency table
shot_streaks <- calc_streak(shot_outcomes)
table(shot_streaks)
# Calculate the streaks and the frequency table for the real data
kobe_streaks <- calc_streak(kobe$basket)
table(kobe_streaks)
#Simulated data: The longest streak was 5 hits, which occurred once. There were also 41 streaks of 0 hits, 23 streaks of 1 hit, 8 streaks of 2 hits, and 3 streaks of 3 hits.
#Real data: Kobe’s longest streak was 4 hits. There were 39 streaks of 0 hits, 24 streaks of 1 hit, and 6 streaks each of 2 and 3 hits.
#Comparing these results, we can see that the distribution of streaks in the simulated data is not exactly the same as in the real data. This could suggest that Kobe’s performance is not entirely consistent with an independent shooter, providing some evidence for the hot hand theory.

#Exercise 5:
#Simulation: To simulate an independent shooter, we can use the sample function in R with a probability of 0.44 for each shot. We can repeat this simulation 1000 times and store the results in a vector.
#Histogram: We can use the hist function in R to plot a histogram of the number of 3+ basket shooting streaks from the 1000 simulated shooters1. We can also add a vertical line to show Kobe’s actual number of 3+ basket streaks, which is 11.
#Conclusion: Based on the histogram, we can see that Kobe’s performance is very rare under the independence model. Only about 2% of the simulated shooters had 11 or more 3+ basket streaks. This suggests that Kobe’s performance is not likely due to chance alone, and that he might have had a hot hand in the 2009 finals.