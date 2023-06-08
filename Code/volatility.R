library(dplyr)
library(ggplot2)

# Read the CSV file
data <- read.csv("/Users/dhanushkumark/Desktop/majorProject/forexFinal.csv")

# Filter by slug and currency
data_filtered <- data %>%
  filter(slug == "EUR/BRL", currency == "BRL")

# Extract year from date
data_filtered$year <- as.numeric(format(as.Date(data_filtered$date, "%d/%m/%y"), "%Y"))

# Group by year and calculate volatility
data_grouped <- data_filtered %>%
  group_by(year) %>%
  summarize(volatility = (max(high) - min(low))/mean(close)*100)

# Create the plot
ggplot(data_grouped, aes(x = year, y = volatility)) + 
  geom_line() + 
  scale_x_continuous(breaks = seq(min(data_grouped$year), max(data_grouped$year), by = 1)) +
  labs(title = "Yearwise trend of volatility for EUR/BRL (BRL)", x = "Year", y = "Volatility")

