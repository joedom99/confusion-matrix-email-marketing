# Confusion Matrix in Email Marketing

[![R](https://img.shields.io/badge/R-4.3.1-blue?logo=r)](https://www.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Made With Love](https://img.shields.io/badge/made%20with-%E2%9D%A4-red)](https://blog.marketingdatascience.ai)
[![CRAN](https://img.shields.io/badge/powered%20by-CRAN-blue)](https://cran.r-project.org/)

Created by [Joe Domaleski](https://blog.marketingdatascience.ai), July 2025.

This project contains R scripts and synthetic datasets that demonstrate how to use confusion matrices to evaluate email marketing models.

It includes two examples:
1. **Balanced Dataset** — A simplified example with roughly equal open and non-open rates, ideal for introducing confusion matrix concepts.
2. **Unbalanced Dataset** — A more realistic marketing scenario where email open rates are low, showing the challenges of class imbalance.

## 📂 Files Included
- `generate_synthetic_datasets.R` — R script to create and save both balanced and unbalanced synthetic datasets.
- `balanced-vs-unbalanced-data-example-email-opens.R` - R script to create bar plots of the datasets for the blog article.
- `evaluate_confusion_matrix.R` — Main R script to:
  - Load datasets.
  - Run logistic regression.
  - Generate confusion matrices and key performance metrics.
- `synthetic_email_data_balanced.csv` — Synthetic dataset with balanced classes.
- `synthetic_email_data_unbalanced.csv` — Synthetic dataset with unbalanced classes (low open rate).

## 🔍 Key Concepts Covered
- Confusion matrix analysis
- Accuracy, sensitivity, specificity, and balanced accuracy
- The impact of class imbalance on model evaluation
- Logistic regression for binary classification in marketing

## 📖 Blog Post
This project accompanies the blog post:
[Confused? Don’t Worry, Your Marketing Model Is Too. Here’s How a Confusion Matrix Can Help (with Example R Code)](https://blog.marketingdatascience.ai) *(update with your final post URL once published)*

## 📜 License
MIT License. See LICENSE file for details.

