#Exercise 1:
library(dplyr)
setwd("C:/Users/PC/OneDrive - VietNam National University - HCM INTERNATIONAL UNIVERSITY/Desktop/DA/Lab/LAB5")
data_houston <- read.csv("Zillow-Houston-TX.csv")
#remove all the prefix “results.”
names(data_houston) <- gsub("results.", "", names(data_houston))
write.csv(data_houston, "Zillow-Houston-TX.csv", row.names = FALSE)
# deal with the missing values
data_houston[is.na(data_houston)] <- 0
data_houston <- data_houston[data_houston$homeType != "", ]

#Exercise 2:
data_houston %>%group_by(homeType) %>%summarise(
  mean_price = mean(price[price != 0], na.rm = TRUE),
  median_price = median(price[price != 0], na.rm = TRUE),
  mode_price = names(which.max(table(price[price != 0])))
    )

#Exercise 3:
data_houston %>%group_by(homeType) %>%summarise(
  variance_price = var(price[price != 0], na.rm = TRUE),
  sd_price = sd(price[price != 0], na.rm = TRUE),
  IQR_price = IQR(price[price != 0], na.rm = TRUE)
  )

#Exercise 4:
data_houston %>%group_by(homeType) %>%summarise(
  ratio_90_10 = quantile(price[price != 0], 0.9, na.rm = TRUE) / quantile(price[price != 0], 0.1, na.rm = TRUE)
  )

#Exercise 5:
# Convert acres to square feet
data_houston$lotAreaValue[data_houston$lotAreaUnit == "acres"] <- data_houston$lotAreaValue[data_houston$lotAreaUnit == "acres"] * 43560
# Now all lotAreaValue is in square feet
data_houston$lotAreaUnit <- "sqft"
# Calculate covariance
cov_price_lotAreaValue <- cov(data_houston$price[data_houston$price != 0], data_houston$lotAreaValue[data_houston$price != 0], use = "na.or.complete")
print(paste("The covariance between price and lotAreaValue is", cov_price_lotAreaValue))

#Exercise 6:
# Calculate correlation
cor_price_lotAreaValue <- cor(data_houston$price[data_houston$price != 0], data_houston$lotAreaValue[data_houston$price != 0], use = "na.or.complete")
print(paste("The correlation between price and lotAreaValue is", cor_price_lotAreaValue))