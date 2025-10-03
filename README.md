# Olist E-commerce Dataset Analysis

# 📌 Project Overview
This project analyzes the Brazilian e-commerce dataset (Olist) using SQL. The goal is to extract customer, seller, and business insights from orders, payments, reviews, and product categories to support better decision-making.

# Dataset & Source

- Downalod the Dataset from Kaggle Websie.
- Customers-customer profiles (state, city, unique ID)
- Orders – order details with timestamps
- Order_Items – product, seller, and pricing per order
- Products – product catalog and categories
- Sellers – seller details (state, city)
- Order_Payments – payment method and amount
- Order_Review – customer ratings and review scores
- Product_Category – category mapping for products

# Data Modeling & Schema Design

- Customer → customer_id as primary key
- Orders → linked to customers via customer_id
- Order_Items → connects orders to sellers and products (order_id, product_id, seller_id)
- Products → product_id as primary key, linked to categories
- Order_Review → foreign key order_id linked to Orders
- Order_Review → foreign key order_id linked to Orders

# SQL Analysis
## Customer Experience & Reviews
- What is the average review score across all orders?
- Which sellers have the lowest average review scores?
- Which product categories are most frequently reviewed poorly?
- What percentage of orders receive 1-star vs. 5-star reviews?

## Revenue & Payments
- What is the breakdown of revenue by payment type?
- Which states contribute the most to total revenue?
- What is the average order value per customer?

## Seller Performance
-Which sellers have the highest number of orders?
-Which sellers have the highest number of orders?
-What is the average delivery delay by seller?

## Customer Behavior & Retention
-Who are the top 10 customers by total spend?
-Which states have the highest number of unique customers?

# Key Insights


