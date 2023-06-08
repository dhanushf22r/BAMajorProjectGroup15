import pandas as pd

# Read the data from the CSV file
file_path = '/Users/dhanushkumark/Desktop/majorProject/Submission1/correlation/2020-21 close.csv'
data = pd.read_csv(file_path, header=None)

# Reshape the data into a proper format
reshaped_data = pd.DataFrame({
    'CurrencyPair': data.iloc[:, 0],
    'Date': pd.to_datetime(data.iloc[:, 1]),
    'ExchangeRate': data.iloc[:, 2].astype(float)
})

# Pivot the data to have currency pairs as columns and exchange rates as rows
pivot_data = reshaped_data.pivot(index='Date', columns='CurrencyPair', values='ExchangeRate')

# Calculate the correlation matrix
correlation_matrix = pivot_data.corr()

# Print the correlation matrix
print(correlation_matrix)
