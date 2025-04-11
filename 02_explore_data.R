# 02_explore_data.R
# Basic exploratory data analysis of the shelter dataset

# Load required packages
library(tidyverse)

# Plot distribution of outcome types
# fct_infreq() sorts bars by frequency (most common first)
# theme_minimal() ensures a clean and minimal visual style
plot_outcomes <- data %>%
  count(outcome_type) %>%
  ggplot(aes(x = fct_infreq(outcome_type), y = n)) +
  geom_col(fill = "steelblue") +
  labs(title = "Distribution of Outcome Types",
       x = "Outcome Type",
       y = "Count") +
  theme_minimal()
print(plot_outcomes)

# Plot distribution of animal types
plot_animals <- data %>%
  count(animal_type) %>%
  ggplot(aes(x = fct_infreq(animal_type), y = n, fill = animal_type)) +
  geom_col() +
  labs(title = "Animal Types",
       x = "Animal Type",
       y = "Count") +
  theme_minimal()
print(plot_animals)

# Plot distribution of intake types
# fct_infreq() ensures the bars are sorted by most common first
plot_intake <- data %>%
  count(intake_type) %>%
  ggplot(aes(x = fct_infreq(intake_type), y = n)) +
  geom_col(fill = "darkgreen") +
  labs(title = "Intake Type Distribution",
       x = "Intake Type",
       y = "Count") +
  theme_minimal()
print(plot_intake)

# Plot distribution of sex upon intake
# fct_infreq() helps sort the bars by frequency
plot_sex <- data %>%
  count(sex_upon_intake) %>%
  ggplot(aes(x = fct_infreq(sex_upon_intake), y = n)) +
  geom_col(fill = "darkorange") +
  labs(title = "Sex upon Intake",
       x = "Sex",
       y = "Count") +
  theme_minimal()
print(plot_sex)

# Identify missing values per column
# This block creates a summary table showing how many NA values exist per variable
missing_summary <- data %>%
  summarise(across(everything(), ~ sum(is.na(.)))) %>%
  pivot_longer(cols = everything(), names_to = "variable", values_to = "missing") %>%
  arrange(desc(missing))
print(missing_summary)

# Explore the relationship between intake_type and outcome_type
# This gives insight into whether intake context influences outcomes
intake_outcome_table <- data %>%
  count(intake_type, outcome_type) %>%
  ggplot(aes(x = intake_type, y = n, fill = outcome_type)) +
  geom_col(position = "fill") +
  labs(title = "Outcome Type by Intake Type (Proportional)",
       x = "Intake Type",
       y = "Proportion",
       fill = "Outcome Type") +
  theme_minimal()
print(intake_outcome_table)

# Analyze distribution of age upon intake (in years)
# Younger animals might be adopted more frequently
plot_age <- data %>%
  filter(!is.na(`age_upon_intake_(years)`)) %>%
  ggplot(aes(x = `age_upon_intake_(years)`)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "white") +
  labs(title = "Distribution of Age upon Intake (Years)",
       x = "Age in Years",
       y = "Count") +
  theme_minimal()
print(plot_age)

# Explore intake_condition
# This may help identify health-related risks or adoption barriers
plot_condition <- data %>%
  count(intake_condition) %>%
  ggplot(aes(x = fct_infreq(intake_condition), y = n)) +
  geom_col(fill = "darkred") +
  labs(title = "Distribution of Intake Conditions",
       x = "Intake Condition",
       y = "Count") +
  theme_minimal()
print(plot_condition)

