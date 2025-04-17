# 🐾 Animal Shelter Outcome Prediction (edX Choose Your Own)

This project was developed as part of the final Capstone for the [HarvardX Data Science Professional Certificate](https://online-learning.harvard.edu/series/data-science).  
It explores the prediction of shelter animal outcomes (e.g. Adoption, Transfer, Euthanasia)  
at the **Austin Animal Center**, based on intake-related features.

---

## 🎯 Goal

The objective is to predict shelter animal outcomes based on intake data such as  
animal type, condition, and intake type.  
Model performance is evaluated using **accuracy**, **confusion matrix**, and **feature importance**.  
All steps follow the [edX Honor Code](https://learning.edx.org/honor).

---

## 📚 Data Source

The dataset is provided by the [Austin Animal Center](https://www.kaggle.com/datasets/aaronschlegel/austin-animal-center-shelter-intakes-and-outcomes),  
hosted on [Kaggle](https://www.kaggle.com/). It contains detailed records of animal intakes and outcomes.

⚠️ **Note:** The dataset is **not included** in this repository.  
Please download it manually from Kaggle and use it locally for testing and report generation.  
👉 https://www.kaggle.com/datasets/aaronschlegel/austin-animal-center-shelter-intakes-and-outcomes

---

## 🗂️ Project Structure

| File                             | Description                                                   |
|----------------------------------|---------------------------------------------------------------|
| `01_load_data.R`                | Load and inspect the shelter dataset                          |
| `02_explore_data.R`             | Exploratory data analysis (EDA): distributions, NA overview   |
| `03_model_baseline.R`           | Baseline model: predict most frequent outcome ("Adoption")    |
| `04_model_randomforest.R`       | Random Forest model with 5-fold CV and feature importance     |
| `05_compare_models.R`           | Comparison of baseline vs. Random Forest (accuracy & plots)   |
| `06_final_model.R`              | Final model application without CV, final evaluation          |
| `07_final_pipeline.R`           | Complete pipeline with all steps and explanatory comments     |
| `chooseyourproject_report.Rmd`  | Final R Markdown report (edX-compliant)                       |
| `chooseyourproject_report.pdf`  | Rendered PDF version for submission                           |
| `chooseyourproject_report.html` | Rendered HTML version                                         |
| `LICENSE`                       | MIT License for reuse                                         |
| `.gitignore`                    | Excludes data files and system folders                        |
| `README.md`                     | This project overview                                         |

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

- **R 4.x or newer**  
- **RStudio**  
- Required R packages:  
  - `tidyverse`  
  - `caret`  
  - `randomForest`  
  - `scales`  
  - `tidytext` *(for variable importance visualization)*

---

## 📄 Report Access

The final report submitted for edX is available in two formats:

- [chooseyourproject_report.pdf](chooseyourproject_report.pdf)  
- [chooseyourproject_report.html](chooseyourproject_report.html)

It includes all modeling steps, evaluations, plots, and interpretations.

---

## 👩‍💻 Author and License

This project was created by **Yvonne Kirschler**  
and is licensed under the [MIT License](LICENSE).

If you reuse code from this repository, please provide proper attribution.

GitHub profile: [@alunera-data](https://github.com/alunera-data)  
LinkedIn: [Yvonne Kirschler](https://www.linkedin.com/in/yvonne-kirschler-719224188/)

> _This project was developed independently.  
> ChatGPT (OpenAI) was used to support structure, planning and phrasing.  
> All modeling, evaluation and reporting were performed and reviewed by the author._