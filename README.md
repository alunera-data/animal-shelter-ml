# 🐾 Animal Shelter Outcome Prediction (edX Choose Your Own)

This project was developed as part of the final Capstone for the [HarvardX Data Science Professional Certificate](https://online-learning.harvard.edu/series/data-science).

---

## 🎯 Goal

The objective is to predict shelter animal outcomes (e.g. Adoption, Transfer, Euthanasia)  
based on intake data such as animal type, condition, and intake type.  
Model performance is evaluated using **accuracy** and a **confusion matrix**.  
All modeling was done independently, following edX Honor Code guidelines.

---

## 📚 Data Source

The data used in this project is from the [Austin Animal Center](https://www.kaggle.com/datasets/aaronschlegel/austin-animal-center-shelter-intakes-and-outcomes),  
published on [Kaggle](https://www.kaggle.com/). The dataset contains detailed intake and outcome records.

⚠️ **Note:** The dataset is **not included** in this repository.  
Download it manually from Kaggle:  
👉 https://www.kaggle.com/datasets/aaronschlegel/austin-animal-center-shelter-intakes-and-outcomes

---

## 🗂️ Project Structure

| File                            | Description                                                  |
|----------------------------------|--------------------------------------------------------------|
| `01_load_data.R`                | Loads and inspects the shelter dataset                      |
| `02_explore_data.R`             | Visualizes distributions and missing values                 |
| `03_model_baseline.R`           | Baseline model (always predicts the most frequent outcome)  |
| `04_model_randomforest.R`       | Random Forest classifier with 5-fold CV, tuning, and variable importance |
| `05_compare_models.R`           | (Planned) Compare baseline and Random Forest                |
| `06_final_model.R`              | (Planned) Final model and evaluation                        |
| `chooseyourproject_report.Rmd`  | R Markdown project report for edX                           |
| `chooseyourproject_report.pdf`  | Knit PDF version for edX submission                         |
| `LICENSE`                       | MIT License for reuse                                       |
| `.gitignore`                    | Excludes data files and system folders                      |

---

## 🔎 Preliminary Result

**Baseline Accuracy:** ~42%  
**Random Forest Accuracy:** **58.04%** (5-fold cross-validated, best `mtry = 10`)  
📈 Model performance improved significantly compared to baseline.

---

## 💻 Requirements

- R 4.x or newer  
- RStudio  
- Packages: `tidyverse`, `caret`, `randomForest`

---

## 👩‍💻 Author and License

This project was created by **Yvonne Kirschler**  
and is licensed under the [MIT License](LICENSE).

If you reuse code from this repository, please provide proper attribution.

> 📝 _This project was developed independently.  
> ChatGPT (OpenAI) was used to support structure, phrasing and planning.  
> All modeling, decisions and implementation were performed and reviewed by the author._