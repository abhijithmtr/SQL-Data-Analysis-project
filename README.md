**#  Zepto E-commerce SQL Data Analyst Portfolio Project**Perfect 👍
Below is a **clean, professional GitHub `README.md`** for your **Zepto SQL project**, with **SQL code snippets included** (very important for recruiters).

You can **copy–paste this directly into `README.md`**.

---

# 🛒 Zepto Sales Data Analysis | SQL (PostgreSQL)

## 📌 Project Overview

This project focuses on **analyzing Zepto sales data using SQL** to extract meaningful business insights related to **product pricing, discounts, stock availability, and category-wise revenue**.
The analysis demonstrates **data cleaning, transformation, and analytical querying skills** using **PostgreSQL**.

---

## 📊 Dataset Description

The dataset contains product-level information from Zepto, including:

* SKU ID
* Product name and category
* MRP and discounted selling price
* Discount percentage
* Available quantity
* Stock status (in/out of stock)
* Product weight

---

## 🎯 Objectives

* Clean and validate raw retail data
* Analyze product pricing and discount patterns
* Identify top discounted and high-value products
* Estimate **category-wise revenue contribution**
* Support **data-driven retail and pricing decisions**

---

## 🛠 Tools & Technologies

* **SQL**
* **PostgreSQL**
* **Relational Database Design**
* **Window Functions & Aggregations**

---

## 🧱 Table Schema

```sql
CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(120) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(8,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);
```

---

## 🧹 Data Cleaning

### Remove Invalid Pricing Records

```sql
DELETE FROM zepto
WHERE mrp = 0;
```

### Convert Prices from Paise to Rupees

```sql
UPDATE zepto
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;
```

---

## 🔍 Key SQL Analysis & Insights

### 1️⃣ Top 10 Best Value Products (Highest Discount)

```sql
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;
```

---

### 2️⃣ High-MRP Products That Are Out of Stock

```sql
SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE AND mrp > 300
ORDER BY mrp DESC;
```

---

### 3️⃣ Estimated Revenue by Category

```sql
SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;
```

---

### 4️⃣ Premium Products with Low Discounts

```sql
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC;
```

---

### 5️⃣ Categories with Highest Average Discount

```sql
SELECT category,
       ROUND(AVG(discountPercent), 2) AS average_discount
FROM zepto
GROUP BY category
ORDER BY average_discount DESC
LIMIT 5;
```

---

## 📈 Key Insights

* Certain categories offer **higher average discounts**, attracting price-sensitive customers
* High-MRP products going **out of stock** indicate strong demand or supply gaps
* A few categories contribute **majority of estimated revenue**
* Discount strategy varies significantly across categories

---

## 💡 Business Impact

* Helps retailers **optimize pricing and discount strategies**
* Identifies **high-demand and high-value products**
* Supports **inventory planning and stock management**
* Enables **data-driven retail decision-making**



