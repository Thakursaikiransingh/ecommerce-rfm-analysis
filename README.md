# E-Commerce Customer RFM Segmentation Analysis

## Project Overview
This project analyzes Superstore e-commerce data to segment 
customers using RFM (Recency, Frequency, Monetary) analysis. 
The analysis combines Python, SQL, and Power BI to deliver 
actionable customer insights for targeted marketing strategies.

## Business Problem
E-commerce companies struggle to identify which customers are 
most valuable, which are at risk of leaving, and which have 
already been lost. RFM analysis provides a data-driven approach 
to segment customers and design targeted retention strategies.

## Tools & Technologies
- Python (Pandas, NumPy, Matplotlib, Seaborn)
- MySQL (12 Business Queries)
- Power BI (7 Page Interactive Dashboard)
- Jupyter Notebook

## Dataset
- Source: Sample Superstore Dataset
- Rows: 9994 transactions
- Columns: 21 features
- Period: 2014 to 2017
- Customers: 793 unique customers

## Project Structure
ecommerce-rfm-analysis/
│
├── Ecommerce_RFM_Analysis.ipynb  # Python EDA + RFM
├── ecommerce_rfm_analysis.sql    # SQL Business Queries
├── superstore_clean.csv          # Cleaned Dataset
├── rfm_segments.csv              # RFM Segments Data
├── Ecommerce_RFM_Analysis.pbix   # Power BI Dashboard
└── README.md                     # Project Description

## What is RFM Analysis?

| Component     | Meaning                      | Metric                   |
|---------------|------------------------------|--------------------------|
| R — Recency   | How recently customer bought | Days since last purchase |
| F — Frequency | How often customer buys      | Number of unique orders  |
| M — Monetary  | How much customer spends     | Total sales amount       |

## Analysis Workflow
1. Data Loading & Cleaning (Python)
2. Exploratory Data Analysis (Python)
3. RFM Score Calculation (Python)
4. Customer Segmentation (Python)
5. Business Query Analysis (SQL)
6. Interactive Dashboard (Power BI)

## Key Business Findings

### Overall Performance
- Total Orders: 5009
- Total Customers: 793
- Total Sales: $2,297,200
- Total Profit: $286,397
- Average Order Value: $229.86

### Category Analysis
- Technology = highest profit margin (17.4%)
- Furniture = lowest profit margin (2.49%)
- Office Supplies = most orders (3742)
- Copiers = most profitable sub-category (37.2% margin)

### Regional Analysis
- West = highest sales ($725,457)
- South = lowest sales ($391,721)
- Central = lowest profit margin (7.92%)

### Customer Segments

| Segment             | Customers | Avg Recency | Avg Frequency | Avg Monetary |
|---------------------|-----------|-------------|---------------|--------------|
| Champions           | 106       | 25 days     | 9.31 orders   | $5,287       |
| Loyal Customers     | 159       | 51 days     | 7.68 orders   | $3,599       |
| At Risk             | 101       | 222 days    | 7.74 orders   | $4,413       |
| Need Attention      | 199       | 195 days    | 4.83 orders   | $1,961       |
| New Customers       | 89        | 26 days     | 4.16 orders   | $1,796       |
| Lost Customers      | 73        | 541 days    | 2.81 orders   | $1,205       |
| Potential Loyalists | 66        | 48 days     | 7.32 orders   | $1,215       |

## Power BI Dashboard
7 page interactive dashboard containing:
- Page 1: Overview (KPI Cards + Charts)
- Page 2: Sales Analysis
- Page 3: Customer & RFM Analysis
- Page 4: Regional & Segment Analysis
- Page 5: Discount & Profit Analysis
- Page 6: Filters & Slicers
- Page 7: Key Insights & Recommendations

## Business Recommendations
1. Focus on Technology — highest profit margin (17.4%)
2. Review Furniture pricing — only 2.49% margin
3. Win back 101 At Risk customers immediately
4. West region performing best — expand further
5. Reduce high discounts — causing negative profits
6. Stock up inventory before Q4 holiday season
7. Convert 66 Potential Loyalists to Loyal Customers
8. VIP program for 106 Champion customers

## Author
Thakur Sai Kiran Singh
- LinkedIn: linkedin.com/in/sai-kiran-singh-thakur-757093285
- GitHub: github.com/Thakursaikiransingh
