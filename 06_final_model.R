# 06_final_model.R
# Apply final Random Forest model to predict animal outcomes

# Load required packages
library(tidyverse)
library(caret)
library(randomForest)

# Prepare dataset (same features as before)
rf_data <- data %>%
  filter(!is.na(outcome_type)) %>%
  mutate(outcome_type = as.factor(outcome_type)) %>%
  select(outcome_type, animal_type, intake_type, sex_upon_intake, intake_condition) %>%
  drop_na()

# Split into training and test sets (80/20)
set.seed(42)
train_index <- createDataPartition(rf_data$outcome_type, p = 0.8, list = FALSE)
train_final <- rf_data[train_index, ]
test_final  <- rf_data[-train_index, ]

# Train final Random Forest model (no CV, full training set)
set.seed(42)
final_rf_model <- randomForest(
  outcome_type ~ .,
  data = train_final,
  importance = TRUE
)

# Output model summary
print(final_rf_model)

# Print number of trees used
cat("Number of trees used:", final_rf_model$ntree, "\n")

# Predict on test set
final_predictions <- predict(final_rf_model, newdata = test_final)

# Calculate accuracy
final_accuracy <- mean(final_predictions == test_final$outcome_type)
cat("Final Random Forest Accuracy:", round(final_accuracy, 4), "\n")

# Generate confusion matrix
final_confusion <- confusionMatrix(final_predictions, test_final$outcome_type)
print(final_confusion)

# Display variable importance
importance_plot <- varImp(final_rf_model)
print(importance_plot)

# Plot importance using randomForest
varImpPlot(final_rf_model, main = "Variable Importance (Final RF Model)")

# Display comparison of predicted vs actual (for review/reporting)
final_results <- tibble(
  Predicted = final_predictions,
  Actual = test_final$outcome_type
)
print(head(final_results))

