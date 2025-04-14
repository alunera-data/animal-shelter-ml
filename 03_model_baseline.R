# 03_model_baseline.R
# Baseline model: always predict the most frequent outcome

# Load required packages
library(tidyverse)
library(caret)

# Count outcome types to identify the most frequent
outcome_counts <- data %>%
  count(outcome_type) %>%
  arrange(desc(n))

print(outcome_counts)

# Extract the most common outcome type
most_common_outcome <- outcome_counts %>%
  slice(1) %>%
  pull(outcome_type)

print(paste("Most common outcome:", most_common_outcome))

# Split the data into training and testing sets (80/20)
set.seed(42)
train_index <- createDataPartition(data$outcome_type, p = 0.8, list = FALSE)

train_set <- data[train_index, ]
test_set  <- data[-train_index, ]

# Remove rows with missing outcome_type in test set
test_set <- test_set %>%
  filter(!is.na(outcome_type))

# Predict the most frequent outcome for all test samples
baseline_predictions <- rep(most_common_outcome, nrow(test_set))

# Calculate baseline accuracy
baseline_accuracy <- mean(baseline_predictions == test_set$outcome_type)
print(paste("Baseline model accuracy:", round(baseline_accuracy, 4)))

# Optional: Confusion matrix
conf_mat <- table(Predicted = baseline_predictions,
                  Actual = test_set$outcome_type)
print(conf_mat)

