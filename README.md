# 🏠 Personal Household Expense budget for 3 month Using PostgreSQL

## 📌 Project Overview

The **Personal Household Expense Analysis** project is a SQL-based database management and financial analysis project developed using PostgreSQL.

The main objective of this project is to manage, organize, and analyze household expenses using relational database concepts and SQL queries. It provides a structured approach to recording family expenses, categorizing transactions, tracking payment methods, monitoring monthly spending, and analyzing household financial patterns.

This project uses household expense data for **June, July, and August 2026** to perform financial analysis budget and understand monthly spending trends.

The project demonstrates practical applications of SQL for database creation, data management, data analysis, and financial reporting.

## 🎯 Project Objectives

- Design and develop a relational database for household expense management.
- Organize household expenses into categories and subcategories.
- Maintain records of family members, vendors, and payment methods.
- Track expenses based on transaction dates and payment status.
- Analyze monthly and quarterly household expenditure.
- Identify high-expense categories and spending patterns.
- Compare actual expenses with planned quarterly budgets.
- Generate meaningful financial insights using SQL queries.

## 🗂️ Database Structure

The project contains the following main tables:

| Table Name | Description |
|---|---|
| `expense_categories` | Stores household expense categories. |
| `expense_subcategories` | Stores subcategories linked to expense categories. |
| `family_members` | Maintains family member information for expense tracking. |
| `payment_methods` | Stores payment methods such as UPI, cash, and credit card. |
| `vendors` | Maintains vendor information associated with transactions. |
| `expenses` | Stores household expense transaction details. |
| `quarterly_budget` | Stores quarterly budget information for financial comparison. |

The database uses primary keys, foreign keys, unique constraints, and check constraints to maintain data integrity and establish relationships between tables.

## ⚙️ SQL Concepts and Techniques Used

- Database and table creation
- Primary keys and foreign keys
- Relational database design
- Data insertion and data management
- Constraints and data validation
- INNER JOIN and LEFT JOIN
- GROUP BY and ORDER BY
- Aggregate functions such as `SUM()`, `AVG()`, `COUNT()`, `MIN()`, and `MAX()`
- Subqueries
- UNION and UNION ALL
- CASE statements
- Date-based analysis
- Monthly and quarterly expense analysis
- Window functions
- Ranking using `RANK()`
- Percentage contribution analysis
- Budget versus actual expense comparison

## 📊 Key Analysis Performed

### 1. Overall Expense Analysis
Calculated total household expenditure, average transaction amount, highest expense, and lowest expense.

### 2. Monthly Expense Analysis
Analyzed household spending for June, July, and August 2026 to identify monthly expenditure patterns.

### 3. Category-Wise Expense Analysis
Identified expense categories contributing the highest amount to total household expenditure.

### 4. Family Member Expense Analysis
Analyzed household transactions based on family members to understand expense distribution.

### 5. Payment Method Analysis
Examined household expenditure across different payment methods.

### 6. Vendor-Wise Expense Analysis
Analyzed transactions associated with different vendors.

### 7. Budget Analysis
Compared actual household expenses with quarterly budget information to evaluate financial planning.

### 8. Spending Trend Analysis
Identified categories showing changes in spending across the selected months.

### 9. Ranking and Percentage Analysis
Used SQL window functions and ranking techniques to identify major expense categories and their contribution to total expenditure.

## 📈 Key Project Findings

Based on the household expense data included in the SQL project:

- Total household expenditure for June–August 2026 was **₹4,68,900**.
- Average monthly household expenditure was **₹1,56,300**.
- August recorded the highest monthly expenditure.
- July recorded the lowest monthly expenditure.
- The analysis identifies major spending categories and provides a basis for understanding household financial patterns.

These findings are based on the transaction data included in the project and can be reproduced by executing the corresponding SQL queries.

## 🛠️ Technologies Used

- **Database:** PostgreSQL
- **Language:** SQL
- **Database Concepts:** Relational Database Design, Constraints, Joins, Aggregations, Subqueries, and Window Functions
- **Project Type:** Household Expense Management and Data Analysis

## 💡 Business Use Case

This project demonstrates how SQL can be used to develop a household expense management system that supports:

- Household financial monitoring
- Monthly expense tracking
- Budget planning
- Spending pattern analysis
- Expense category comparison
- Financial decision-making

The project helps transform transaction-level household expense data into meaningful financial information.

## 🚀 Learning Outcomes

Through this project, I gained practical experience in:

- Designing relational databases using PostgreSQL.
- Creating tables with appropriate relationships and constraints.
- Writing SQL queries for financial data analysis.
- Performing joins and aggregations across multiple tables.
- Applying window functions and ranking techniques.
- Analyzing monthly and quarterly financial trends.
- Comparing actual household expenses with budget information.
- Presenting SQL analysis in a structured and business-oriented manner.

It represents an application of SQL concepts to a real-world household financial management scenario.

**Skills Demonstrated:** PostgreSQL | SQL | Database Design | Data Analysis | Financial Reporting | Budget Analysis
