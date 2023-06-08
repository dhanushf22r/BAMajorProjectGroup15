# Read the dataset
df <- read.csv("/Users/dhanushkumark/Desktop/majorProject/Submission1/forexFinal.csv")

# Convert date column to date format
df$date <- as.Date(df$date, format = "%d/%m/%y")

# Filter for EUR/USD
df <- subset(df, currency == "BRL" & slug == "EUR/BRL")

# Find all-time high and low prices
all_time_high <- max(df$high)
all_time_high_row <- df[df$high == all_time_high,]
all_time_low <- min(df$close)  # Modified to find the all-time low of the "close" price
all_time_low_row <- df[df$close == all_time_low,]  # Modified to find the row with the all-time low of the "close" price

# Print the results
cat("All-time high:", all_time_high, "\n")
cat("Row with all-time high price:\n")
print(all_time_high_row)
cat("All-time low:", all_time_low, "\n")
cat("Row with all-time low price:\n")
print(all_time_low_row)


# Load the ggplot2 library
library(ggplot2)

# Plotting the high and low prices over time
ggplot(df, aes(x = date)) +
  geom_line(aes(y = high, color = "High")) +
  geom_line(aes(y = low, color = "Low")) +
  labs(title = "EUR/AED High and Low Prices",
       x = "Date",
       y = "Price") +
  scale_color_manual(values = c("High" = "blue", "Low" = "red")) +
  theme_minimal()
