# Postgrel_sql_sales_database
# 🛒 Retail Sales Data Analysis using PostgreSQL

Project Overview
Project Title: Retail Sales Analysis
Level: Beginner
Database: p1_retail_db

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

Objectives
1. Set up a retail sales database: Create and populate a retail sales database with the provided sales data.
2. Data Cleaning: Identify and remove any records with missing or null values.
3. Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.
4. Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.

This project performs SQL-based analysis on a retail sales dataset using PostgreSQL. It demonstrates how SQL can be used to derive meaningful insights from transactional data like customer behavior, product category trends, and sales performance.

## 📂 Project Structure

- `SQL - Retail Sales Analysis_utf.csv`: The dataset used for analysis.
- `SQL Query Questions for Retail Sales Analysis.docx`: Document containing the SQL queries used in this project.
- `queries.sql`: (Optional) SQL file with all queries for quick execution.
- `README.md`: Project documentation.

## 🧠 Objectives

- Perform basic data exploration using SQL.
- Solve business-related queries including customer segmentation, product category analysis, and sales trends.
- Use PostgreSQL functions like `GROUP BY`, `AVG()`, `COUNT()`, `DISTINCT`, `RANK()`, and `EXTRACT()`.

## 🛢️ Dataset Overview

The dataset includes information such as:
- `sale_date`: Date of the transaction.
- `customer_id`: Unique ID for each customer.
- `category`: Product category (e.g., Clothing, Beauty, etc.).
- `total_sale`: Amount of the sale.
- `gender`, `age`: Customer demographics.
- `quantity`: Number of items sold.

## 📝 Key SQL Queries

Here are a few examples of the queries used:

- Total number of sales:
  ```sql

  SELECT COUNT(*) AS total_sales FROM Sales_table;

- Unique customers:
  ```sql
  
  SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM Sales_table;

- Total sales per category:
  ```sql
  
  SELECT category, SUM(total_sale) AS net_sale FROM Sales_table GROUP BY category;


- Top 5 highest-spending customers:
  ```sql

  SELECT customer_id, SUM(total_sale) AS total_sales
  FROM Sales_table
  GROUP BY customer_id
  ORDER BY total_sales DESC
  LIMIT 5;


- Best-performing sales month:
  ```sql
  
  SELECT year, month, avg_sales
  FROM (
    SELECT 
      EXTRACT(YEAR FROM sale_date) AS year,
      EXTRACT(MONTH FROM sale_date) AS month,
      AVG(total_sale) AS avg_sales,
      RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS rank
    FROM Sales_table
    GROUP BY year, month
  ) t
  WHERE rank = 1;
