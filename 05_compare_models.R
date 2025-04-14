# 05_compare_models.R
# Compare baseline and Random Forest models for animal outcome prediction

# Load required packages
library(tidyverse)
library(scales)

# Accuracy values from previous scripts
baseline_accuracy <- 0.4218
rf_accuracy <- 0.5804

# Calculate improvements
accuracy_difference <- rf_accuracy - baseline_accuracy
relative_improvement <- accuracy_difference / baseline_accuracy

# Print results in compact format
cat("Baseline Accuracy:     ", round(baseline_accuracy, 4), "\n")
cat("Random Forest Accuracy:", round(rf_accuracy, 4), "\n")
cat("Absolute Improvement:  ", round(accuracy_difference, 4), "\n")
cat("Relative Improvement:  ", percent(relative_improvement, accuracy = 0.1), "\n")

# Create a comparison table
model_comparison <- tibble(
  Model = c("Baseline", "Random Forest"),
  Accuracy = c(baseline_accuracy, rf_accuracy)
)

print(model_comparison)

# Optional: accuracy comparison bar chart
model_comparison %>%
  ggplot(aes(x = Model, y = Accuracy, fill = Model)) +
  geom_col(width = 0.6) +
  labs(title = "Model Accuracy Comparison",
       y = "Accuracy",
       x = "") +
  theme_minimal() +
  scale_fill_manual(values = c("Baseline" = "gray70", "Random Forest" = "steelblue")) +
  theme(legend.position = "none")

