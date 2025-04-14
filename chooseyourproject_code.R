# chooseyourproject_code.R
# Reproducible ML pipeline: Predict shelter animal outcomes (Austin Animal Center)
# Part of the HarvardX "Choose Your Own" capstone project

# Load required packages
library(tidyverse)
library(caret)
library(randomForest)

# Load the dataset
data <- read_csv("data/archive/aac_intakes_outcomes.csv")

# Prepare dataset: filter and select relevant features
rf_data <- data %>%
  filter(!is.na(outcome_type)) %>%
  mutate(outcome_type = as.factor(outcome_type)) %>%
  select(outcome_type, animal_type, intake_type, sex_upon_intake, intake_condition) %>%
  drop_na()

# Split data into training (80%) and test (20%) sets
set.seed(42)
train_index <- createDataPartition(rf_data$outcome_type, p = 0.8, list = FALSE)
train_rf <- rf_data[train_index, ]
test_rf  <- rf_data[-train_index, ]

# Train final Random Forest model (no CV, full train set)
final_rf_model <- randomForest(
  outcome_type ~ .,
  data = train_rf,
  importance = TRUE
)

# Predict outcomes on test set
final_predictions <- predict(final_rf_model, newdata = test_rf)

# Evaluate model accuracy
final_accuracy <- mean(final_predictions == test_rf$outcome_type)
final_confusion <- confusionMatrix(final_predictions, test_rf$outcome_type)

# Print results
cat("Final Random Forest Accuracy:", round(final_accuracy, 4), "\n")
print(final_confusion)

# Display variable importance
importance_plot <- varImp(final_rf_model)
print(importance_plot)