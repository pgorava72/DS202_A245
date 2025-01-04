# Load the data
football_data <- read.csv("Players_Score.csv", stringsAsFactors = FALSE, dec = ".", header = TRUE)

# Rename columns for easier reference
names(football_data) <- c("Rank", "Player", "Club", "Age", "Apps", "Mins", "Goals", "Assists", "Yel", "Red", "SpG", "PS", "AerialsWon", "MotM", "Rating")

# Convert data types and handle non-numeric values
football_data$Goals <- as.numeric(gsub(",", ".", gsub("-", NA, football_data$Goals)))  # Replace "-" with NA and commas with "."
football_data$Age <- as.numeric(football_data$Age)
football_data$Apps <- as.numeric(gsub(",", ".", football_data$Apps))  # Ensure Apps is numeric as well
# Check for any NAs after conversion
sum(is.na(football_data$Goals))  # Check if any NAs exist in Goals
sum(is.na(football_data$Apps))   # Check if any NAs exist in Apps

# Create GoalsPerMatch column if Goals and Apps are numeric
football_data$GoalsPerMatch <- football_data$Goals / football_data$Apps  # Calculate Goals per match

# Remove rows with NA values
football_data <- na.omit(football_data)

# Load ggplot2
library(ggplot2)
