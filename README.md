# 📉 Telecom Customer Churn Analysis

<p align="center">
  <b>End-to-end data analytics and machine learning project using SQL Server, Python and statistical testing</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.x-3776AB?logo=python&logoColor=white" alt="Python">
  <img src="https://img.shields.io/badge/SQL%20Server-Analysis-CC2927?logo=microsoftsqlserver&logoColor=white" alt="SQL Server">
  <img src="https://img.shields.io/badge/Pandas-EDA-150458?logo=pandas&logoColor=white" alt="Pandas">
  <img src="https://img.shields.io/badge/Scikit--learn-Machine%20Learning-F7931E?logo=scikitlearn&logoColor=white" alt="Scikit-learn">
  <img src="https://img.shields.io/badge/Jupyter-Notebooks-F37626?logo=jupyter&logoColor=white" alt="Jupyter">
  <img src="https://img.shields.io/badge/Domain-Telecom-0A66C2" alt="Domain">
</p>

---

## 📑 Table of Contents

- [Overview](#-overview)
- [Quick Results](#-quick-results)
- [Business Objectives](#-business-objectives)
- [Dataset](#-dataset)
- [Tools and Technologies](#️-tools-and-technologies)
- [Project Workflow](#-project-workflow)
- [Key Insights](#-key-insights)
- [Revenue Analysis](#-revenue-analysis)
- [Python EDA](#-python-eda)
- [Statistical Hypothesis Testing](#-statistical-hypothesis-testing)
- [Retention Strategies](#️-retention-strategies)
- [Machine Learning - Churn Prediction](#machine-learning---churn-prediction)
- [Limitations](#️-limitations)
- [Project Structure](#️-project-structure)
- [How to Run](#-how-to-run)
- [Executive Summary Report](#-executive-summary-report)
- [Conclusion](#-conclusion)

---

## 🔍 Overview

Customer churn is a major business problem for telecom companies. Every customer who leaves reduces revenue and slows long-term growth.

This project studies telecom customer data to find churn patterns, understand customer behavior, estimate revenue exposure and suggest data-driven retention strategies.

The project follows an end-to-end analytics workflow covering SQL Server analysis, Python exploratory data analysis (EDA), statistical hypothesis testing, retention strategy development and machine learning-based churn prediction.

## ⚡ Quick Results

| Metric | Result |
|---|---:|
| Total customers | 7,043 |
| Overall churn rate | **26.54%** |
| Retention rate | **73.46%** |
| Month-to-month churn rate | **42.71%** |
| New customer churn rate (0–12 months) | **47.44%** |
| Electronic check churn rate | **45.29%** |
| Fiber optic churn rate | **41.89%** |
| Monthly charges tied to churned customers | **$139,130.85** |
| Best test ROC-AUC | **84.34%** |
| Best top-decile lift | **2.91x** |

## 🎯 Business Objectives

- Analyze overall churn and retention rates.
- Find customer segments with high churn.
- Understand how customer characteristics relate to churn.
- Measure revenue exposure from churned customers.
- Use statistical tests to validate the patterns found.
- Develop practical retention recommendations.
- Build machine learning models to predict customer churn.
- Identify high-risk active customers for targeted retention campaigns.

## 📦 Dataset

| Attribute | Details |
|---|---|
| Dataset | Telco Customer Churn |
| Source | IBM Telco Customer Churn Dataset (Kaggle) |
| Total records | 7,043 |
| Total columns | 21 |
| Target variable | `Churn` |
| Customer identifier | `customerID` |

The data includes customer demographics, account information, subscribed services, contract details, payment methods and churn status.

## 🛠️ Tools and Technologies

| Category | Tools |
|---|---|
| Programming | Python |
| Data analysis | Pandas, NumPy |
| Visualization | Matplotlib, Seaborn |
| Database | Microsoft SQL Server |
| Statistics | SciPy, Statsmodels |
| Machine Learning | Scikit-learn |
| Development | Jupyter Notebook, VS Code |
| Version control | Git, GitHub |

## 🔄 Project Workflow

1. Data profiling
2. Data cleaning and preprocessing
3. SQL-based churn analysis
4. SQL-based revenue analysis
5. Python exploratory data analysis
6. Statistical hypothesis testing
7. Retention strategy development
8. Machine learning model development and evaluation
9. High-risk customer identification
10. Executive summary report and GitHub documentation

## 💡 Key Insights

### 1. Overall Churn

| Metric | Result |
|---|---:|
| Total customers | 7,043 |
| Churned customers | 1,869 |
| Retained customers | 5,174 |
| Churn rate | 26.54% |
| Retention rate | 73.46% |

### 2. Churn by Contract Type

| Contract Type | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| Month-to-month | 3,875 | 1,655 | 42.71% |
| One year | 1,473 | 166 | 11.27% |
| Two year | 1,695 | 48 | 2.83% |

> **Finding:** Month-to-month customers churn the most. They make up 88.55% of all churned customers.

### 3. Churn by Tenure

| Tenure Group | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| New (0–12 months) | 2,186 | 1,037 | 47.44% |
| Early (13–24 months) | 1,024 | 294 | 28.71% |
| Mid-term (25–48 months) | 1,594 | 325 | 20.39% |
| Long-term (49–72 months) | 2,239 | 213 | 9.51% |

> **Finding:** New customers are the biggest risk. New month-to-month customers churn at 51.35% and make up 54.79% of all churned customers.

### 4. Churn by Payment Method

| Payment Method | Churn Rate |
|---|---:|
| Electronic check | 45.29% |
| Mailed check | 19.11% |
| Bank transfer (automatic) | 16.71% |
| Credit card (automatic) | 15.24% |

> **Finding:** Electronic check users churn far more than customers on automatic payments.

### 5. Churn by Internet Service

| Internet Service | Churn Rate |
|---|---:|
| Fiber optic | 41.89% |
| DSL | 18.96% |
| No internet service | 7.40% |

> **Finding:** Fiber optic customers have the highest churn among internet service groups.

## 💰 Revenue Analysis

Revenue exposure is based on the monthly charges of customers who churned.

| Metric | Result |
|---|---:|
| Churned customers | 1,869 |
| Monthly charges tied to churned customers | $139,130.85 |
| Average monthly charges per churned customer | $74.44 |
| Illustrative annualized amount | $1,669,570.20 |

### Revenue Exposure by Segment

| Segment | Share of Churned Monthly Charges |
|---|---:|
| Month-to-month contracts | 86.86% |
| Fiber optic customers | 82.16% |
| Electronic check customers | 60.59% |
| New customers | 49.56% |

> **Note:** The annualized figure is monthly charges multiplied by 12. It is an illustrative run-rate estimate, not a verified future or realized loss. The segments overlap, so the percentages should not be added together.

## 📊 Python EDA

EDA was done with Pandas, NumPy, Matplotlib and Seaborn. It covers:

- Overall churn distribution
- Churn by contract type, tenure group, payment method and internet service
- Churn by additional services, paperless billing and senior citizen status
- Revenue exposure across customer segments
- Distributions of monthly charges, tenure and total charges

In total, 15 visualizations are saved in the `visuals/` folder. Selected charts:

<table>
  <tr>
    <td align="center"><b>Overall Churn</b><br><img src="visuals/01_overall_churn_distribution.png" width="420"></td>
    <td align="center"><b>Churn by Contract</b><br><img src="visuals/02_churn_by_contract.png" width="420"></td>
  </tr>
  <tr>
    <td align="center"><b>Churn by Tenure</b><br><img src="visuals/03_churn_by_tenure.png" width="420"></td>
    <td align="center"><b>Monthly Charges</b><br><img src="visuals/13_monthly_charges_boxplot.png" width="420"></td>
  </tr>
  <tr>
    <td align="center" colspan="2"><b>Total Charges</b><br><img src="visuals/15_total_charges_boxplot.png" width="420"></td>
  </tr>
</table>

## 🧪 Statistical Hypothesis Testing

Tests used:

- Chi-square test of independence
- Mann–Whitney U test
- Cramér's V (strength of association)
- Holm-Bonferroni correction for multiple testing

<details>
<summary><b>Click to see all test results</b></summary>

| Variable | Test | P-value |
|---|---|---:|
| Contract | Chi-square | 5.86 × 10⁻²⁵⁸ |
| Tenure Group | Chi-square | 2.94 × 10⁻¹⁸⁵ |
| Payment Method | Chi-square | 3.68 × 10⁻¹⁴⁰ |
| Internet Service | Chi-square | 9.57 × 10⁻¹⁶⁰ |
| Online Security | Chi-square | 2.66 × 10⁻¹⁸⁵ |
| Tech Support | Chi-square | 1.44 × 10⁻¹⁸⁰ |
| Paperless Billing | Chi-square | 4.07 × 10⁻⁵⁸ |
| Senior Citizen | Chi-square | 1.51 × 10⁻³⁶ |
| Tenure | Mann–Whitney U | 2.42 × 10⁻²⁰⁸ |
| Monthly Charges | Mann–Whitney U | 3.31 × 10⁻⁵⁴ |
| Total Charges | Mann–Whitney U | 2.00 × 10⁻⁸⁴ |

</details>

**Key findings**

- All 11 tests stayed significant after Holm correction at the 0.05 level.
- Contract type has the strongest association among the categorical variables (Cramér's V ≈ 0.410).
- Tenure also has a strong relationship with churn.
- Churned customers have a lower median tenure (10 months) than retained customers (38 months).
- Churned customers have higher median monthly charges ($79.65) than retained customers ($64.43).

> Statistical significance does not prove causation. These results show associations within this dataset.

## 🛡️ Retention Strategies

Three priority segments were selected based on the analysis.

### 1. New Customer Retention

**Problem:** New customers churn at 47.44%.

**Recommendations**
- Improve the onboarding experience.
- Check in proactively during the first 90 days.
- Catch billing and service complaints early.
- Offer suitable incentives for longer-term contracts.

**KPIs:** 90-day retention rate, new customer churn rate, complaint resolution time, conversion to longer-term contracts.

### 2. Fiber Optic Customer Retention

**Problem:** Fiber optic customers churn at 41.89%.

**Recommendations**
- Investigate service-quality concerns.
- Monitor technical complaints.
- Improve support response times.
- Review customer satisfaction and unresolved issues.

**KPIs:** Fiber optic churn rate, complaint resolution time, unresolved complaints, customer satisfaction.

### 3. Electronic Check Customer Retention

**Problem:** Electronic check customers churn at 45.29%.

**Recommendations**
- Investigate payment-related complaints.
- Improve billing communication and reminders.
- Explain the available payment alternatives.
- Monitor payment issues without forcing customers to change their payment method.

**KPIs:** Electronic check churn rate, payment failure rate, billing complaints, successful payment rate, automatic payment adoption.

> **Pilot approach:** Test each initiative with a treatment-versus-control pilot before rolling it out widely.

## 🤖 Machine Learning - Churn Prediction

A machine learning workflow was developed to predict customer churn and identify high-risk active customers.

### Models Evaluated

- Logistic Regression (Baseline)
- Gradient Boosting Classifier

### Model Development

- Target variable: `Churn` (Yes = 1, No = 0)
- Train-test split: Stratified 80/20
- Random state: 42
- Numeric preprocessing: Median imputation and standard scaling
- Categorical preprocessing: Most-frequent imputation and one-hot encoding
- Cross-validation: Stratified 5-fold cross-validation
- Missing `TotalCharges` values were handled inside the preprocessing pipeline to avoid data leakage.

### Model Performance

Models were evaluated on the held-out test set.

| Metric | Logistic Regression | Gradient Boosting |
|---|---:|---:|
| Accuracy | 80.48% | 80.62% |
| Precision | 65.62% | 67.35% |
| Recall | 55.61% | 52.41% |
| F1-score | 60.20% | 58.95% |
| ROC-AUC | 84.19% | 84.34% |
| Cross-validation AUC | 84.62% | 84.76% |
| Top-decile lift | 2.81x | 2.91x |

**Selected model:** Gradient Boosting was provisionally selected for high-risk customer ranking based on its slightly higher ROC-AUC, precision and top-decile lift.

Logistic Regression achieved higher recall and F1-score at the default 0.50 classification threshold.

### Top-Decile Lift Analysis

The top 10% of customers ranked by predicted churn probability were evaluated.

| Metric | Logistic Regression | Gradient Boosting |
|---|---:|---:|
| Customers in top 10% | 141 | 141 |
| Top-decile churn rate | 74.47% | 77.30% |
| Overall churn rate | 26.54% | 26.54% |
| Top-decile lift | 2.81x | 2.91x |
| Share of test churners captured | 28.07% | 29.14% |

**Business interpretation:** Gradient Boosting identified a top-risk group with a 77.30% churn rate, compared with the overall test-set churn rate of 26.54%.

### Key Predictive Features

The top 10 features from the Gradient Boosting model were:

| Rank | Feature | Importance |
|---:|---|---:|
| 1 | Month-to-month contract | 0.379910 |
| 2 | Tenure | 0.138642 |
| 3 | Fiber optic internet | 0.086523 |
| 4 | Total charges | 0.086156 |
| 5 | Monthly charges | 0.081947 |
| 6 | No online security | 0.068142 |
| 7 | Electronic check payment | 0.044430 |
| 8 | No tech support | 0.037823 |
| 9 | Paperless billing - No | 0.010662 |
| 10 | Multiple lines - No | 0.010302 |

**Key finding:** Month-to-month contract status was the strongest predictive feature in the Gradient Boosting model.

Feature importance represents predictive contribution, not causation.

### Active Customer Winback List

A top-100 high-risk active customer list was generated using the held-out test set.

| Metric | Result |
|---|---:|
| Active customers selected | 100 |
| Combined monthly charges | $7,782.00 |
| Highest predicted churn probability in selected group | 88.04% |

The list contains customer IDs, predicted churn probabilities and monthly charges. It demonstrates how a churn model can help prioritize retention campaigns.

> **Note:** This is a retrospective demonstration using held-out test customers. The $7,782 represents the combined monthly charges associated with the selected customers, not guaranteed revenue at risk. Model probabilities and rankings require further validation before operational deployment.

## ⚠️ Limitations

- Results show associations, not causes.
- The revenue figure is an illustrative run-rate, not realized loss.
- The data is a single snapshot from one public dataset, so findings may not carry over to other telecom companies.
- Model performance is based on one train-test split and cross-validation on the training set.
- Classification thresholds have not been optimized for a real retention campaign.
- The winback list is a demonstration, not a live production system.
- Feature importance does not establish causal relationships.

## 🗂️ Project Structure

```text
telecom-customer-churn-analysis/
│
├── data/
│   ├── raw/
│   └── processed/
│       ├── telco_churn_cleaned.csv
│       └── winback_list_test.csv
│
├── sql/
│   ├── 01_data_profiling.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_churn_analysis.sql
│   └── 04_revenue_analysis.sql
│
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_eda.ipynb
│   ├── 03_statistical_testing.ipynb
│   ├── 04_retention_strategy.ipynb
│   └── 05_churn_prediction.ipynb
│
├── reports/
│   └── Telecom_Customer_Churn_Executive_Summary.pdf
│
├── visuals/
│   └── 15 exported visualization files
│
├── README.md
└── requirements.txt
```

## 🚀 How to Run

### 1. Clone the repository

```bash
git clone https://github.com/satyam-katara/telecom-customer-churn-analysis.git
cd telecom-customer-churn-analysis
```

### 2. Create a virtual environment

```bash
python -m venv venv
```

### 3. Activate the virtual environment

**Windows CMD**

```cmd
venv\Scripts\activate.bat
```

**Windows PowerShell**

```powershell
.\venv\Scripts\Activate.ps1
```

**macOS / Linux**

```bash
source venv/bin/activate
```

### 4. Install dependencies

```bash
pip install -r requirements.txt
```

### 5. Run the notebooks

```bash
jupyter notebook
```

Run the notebooks in order, from `01` to `05`.

### 6. Run the SQL scripts

Set up SQL Server, create the `TelecomChurnDB` database, load the cleaned customer table and run the scripts in the `sql/` folder in order.

## 📄 Executive Summary Report

The final summary is here:

[`reports/Telecom_Customer_Churn_Executive_Summary.pdf`](reports/Telecom_Customer_Churn_Executive_Summary.pdf)

## ✅ Conclusion

The analysis identified four customer groups associated with higher churn: month-to-month customers, new customers, electronic check users and fiber optic users.

By combining SQL analysis, Python EDA, statistical testing, retention strategy development and machine learning, this project provides an end-to-end view of telecom customer churn.

The machine learning workflow achieved a test ROC-AUC of 84.34% with Gradient Boosting and a top-decile lift of 2.91x. These findings demonstrate how predictive analytics can help prioritize high-risk customers and support data-driven retention initiatives.

---

<p align="center">
  <b>Project Type:</b> End-to-End Data Analytics & Machine Learning &nbsp;|&nbsp;
  <b>Domain:</b> Telecommunications &nbsp;|&nbsp;
  <b>Focus:</b> Churn Analysis, Revenue Analysis, Statistical Testing, Retention Strategy and Prediction
</p>