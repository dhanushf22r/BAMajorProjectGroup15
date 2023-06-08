# Read data from CSV file
data <- read.csv("/Users/dhanushkumark/Desktop/majorProject/forexFinal.csv", header = TRUE, stringsAsFactors = FALSE)

# Filter data by currency
data_filtered <- data[data$currency == "AED" & data$slug == "EUR/AED",]

# Convert the date column to a date format
data_filtered$date <- as.Date(data_filtered$date, format = "%d/%m/%y")

# Extract year from date column
data_filtered$year <- as.numeric(format(data_filtered$date, "%Y"))

# Plot the continuous graph of the 'close' column yearwise
library(ggplot2)
ggplot(data_filtered, aes(x = date, y = close)) + 
  geom_line() + 
  scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
  labs(title = "Yearwise trend of 'close' column for EUR/AED (AED)", x = "Year", y = "Close")
