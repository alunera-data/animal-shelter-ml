# 🐾 Animal Shelter Outcome Prediction (edX Choose Your Own)

This project was developed as part of the final Capstone for the [HarvardX Data Science Professional Certificate](https://online-learning.harvard.edu/series/data-science).

---

## 🎯 Goal

The objective is to predict shelter animal outcomes (e.g. Adoption, Transfer, Euthanasia)  
based on intake data such as animal type, condition, and intake type.  
Model performance is evaluated using **accuracy**, **confusion matrix**, and **feature importance**.  
All steps follow the [edX Honor Code](https://learning.edx.org/honor).

---

## 📚 Data Source

The dataset is provided by the [Austin Animal Center](https://www.kaggle.com/datasets/aaronschlegel/austin-animal-center-shelter-intakes-and-outcomes),  
hosted on [Kaggle](https://www.kaggle.com/). It contains detailed records of animal intakes and outcomes.

⚠️ **Note:** The dataset is **not included** in this repository.  
Please download it manually from Kaggle:  
👉 https://www.kaggle.com/datasets/aaronschlegel/austin-animal-center-shelter-intakes-and-outcomes

---

## 🗂️ Project Structure

| File                            | Description                                                   |
|----------------------------------|----------------------------------------------------------------|
| `01_load_data.R`                | Load and inspect the shelter dataset                          |
| `02_explore_data.R`             | Exploratory data analysis (EDA): distributions, NA overview   |
| `03_model_baseline.R`           | Baseline model: predict most frequent outcome ("Adoption")    |
| `04_model_randomforest.R`       | Random Forest model with 5-fold CV and feature importance     |
| `05_compare_models.R`           | Comparison of baseline vs. Random Forest (accuracy & plots)   |
| `06_final_model.R`              | Final model application without CV, final evaluation          |
| `07_final_pipeline.R`           | Complete pipeline with all steps and explanatory comments     |
| `chooseyourproject_report.Rmd`  | R Markdown project report for edX                            |
| `chooseyourproject_report.pdf`  | Knit PDF version for submission                               |
| `LICENSE`                       | MIT License for reuse                                         |
| `.gitignore`                    | Excludes data files and system folders                        |

---

## 🔎 Final Results

| Metric                    | Value     |
|---------------------------|-----------|
| Baseline Accuracy         | 42.18 %   |
| Random Forest Accuracy    | 58.09 %   |
| Absolute Improvement      | +15.91 pp |
| Relative Improvement      | +37.7 %   |
| Final Model Trees         | 500       |

Random Forest classifier clearly outperformed the naive baseline.  
Most important predictors: `intake_type`, `sex_upon_intake`, `intake_condition`.

---

## 💻 Requirements

- R 4.x or newer  
- RStudio  
- Packages: `tidyverse`, `caret`, `randomForest`, `scales`

---

## 👩‍💻 Author and License

This project was created by **Yvonne Kirschler**  
and is licensed under the [MIT License](LICENSE).

If you reuse code from this repository, please provide proper attribution.

> _This project was developed independently.  
> ChatGPT (OpenAI) was used to support structure, planning and phrasing.  
> All modeling, evaluation and reporting were performed and reviewed by the author._