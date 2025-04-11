# 01_load_data.R
# Load and inspect the Austin Animal Center intake/outcome dataset

# Dataset source: manually downloaded from Kaggle
# https://www.kaggle.com/datasets/aaronschlegel/austin-animal-center-shelter-intakes-and-outcomes
# File used: data/archive/aac_intakes_outcomes.csv

# Load required packages
library(tidyverse)

# Check if file exists before loading
if (!file.exists("data/archive/aac_intakes_outcomes.csv")) {
  stop("Dataset not found. Please make sure the CSV file is saved in data/archive/")
}

# Read the CSV file
data <- read_csv("data/archive/aac_intakes_outcomes.csv")

# Inspect structure of the dataset
glimpse(data)

# Preview first few rows
head(data)

