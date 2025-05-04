# 🚢 Titanic Survival Prediction

This project uses the classic **Titanic dataset** to predict passenger survival using two machine learning models in R:

- **Decision Trees** (`rpart`)
- **Naive Bayes** (`e1071`)

---

## 📊 Project Summary

The goal was to clean and preprocess the Titanic dataset, apply classification models, and compare their predictive performance using confusion matrices and accuracy scores.

**Author**: Sai Sanapala  
**Date**: April 21, 2025

---

## 🧠 Methodology

### 1. Preprocessing

- Removed columns: `Name`, `Ticket`, `Cabin`
- Filled missing `Age` values with median age
- Removed rows with missing `Embarked` values
- Converted categorical variables to factors

### 2. Modeling

- **Decision Tree** using the `rpart` package with `rpart.plot` for visualization
- **Naive Bayes** using the `e1071` package

### 3. Evaluation

Split the dataset into:

- **70% training set**
- **30% testing set**

Evaluated both models using:

- **Confusion matrix**
- **Accuracy**

---

## 📈 Results

### Decision Tree
