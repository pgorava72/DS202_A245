# Load the data
football_data <- read.csv("Players_Score.csv", stringsAsFactors = FALSE, dec = ".", header = TRUE)

# Rename columns for easier reference
names(football_data) <- c("Rank", "Player", "Club", "Age", "Apps", "Mins", "Goals", "Assists", "Yel", "Red", "SpG", "PS", "AerialsWon", "MotM", "Rating")

# Convert data types and handle non-numeric values
football_data$Goals <- as.numeric(gsub(",", ".", gsub("-", NA, football_data$Goals)))  # Replace "-" with NA and commas with "."
football_data$Age <- as.numeric(football_data$Age)
football_data$Apps <- as.numeric(gsub(",", ".", football_data$Apps))  # Ensure Apps is numeric as well
