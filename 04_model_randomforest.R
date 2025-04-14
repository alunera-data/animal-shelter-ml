# 04_model_randomforest.R
# Train a Random Forest model to predict animal outcomes

# Load required packages
library(tidyverse)
library(caret)
library(randomForest)

# Prepare dataset: remove missing outcome_type values
rf_data <- data %>%
  filter(!is.na(outcome_type)) %>%
  mutate(outcome_type = as.factor(outcome_type)) %>%
  select(outcome_type, animal_type, intake_type, sex_upon_intake, intake_condition) %>%
  drop_na()

# Split data into training and testing sets (80/20)
set.seed(42)
train_index <- createDataPartition(rf_data$outcome_type, p = 0.8, list = FALSE)
train_rf <- rf_data[train_index, ]
test_rf  <- rf_data[-train_index, ]

# Set up 5-fold cross-validation
rf_control <- trainControl(method = "cv", number = 5)

# Train Random Forest model using caret
set.seed(42)
rf_model <- train(
  outcome_type ~ .,
  data = train_rf,
  method = "rf",
  trControl = rf_control,
  importance = TRUE
)

# Predict outcomes on test set
rf_predictions <- predict(rf_model, newdata = test_rf)

# Calculate accuracy
rf_accuracy <- mean(rf_predictions == test_rf$outcome_type)

# Generate confusion matrix
rf_confusion <- confusionMatrix(rf_predictions, test_rf$outcome_type)

# Calculate variable importance
importance_plot <- varImp(rf_model)

# Output all results
print(rf_model)
print(paste("Random Forest Accuracy:", round(rf_accuracy, 4)))
print(rf_confusion)
print(importance_plot)

# Plot model performance and feature importance
print(plot(rf_model))           # tuning curve
print(plot(importance_plot))    # variable importance

