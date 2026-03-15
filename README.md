# E-Commerce Profitability & Strategic Portfolio Analysis
**SQL | PostgreSQL | Power BI | Business Analytics**

## Executive Summary
This project delivers a deep-dive analysis into the profitability and product portfolio performance of an e-commerce business. By processing **5,000+ orders**, the analysis identifies high-performing "Star" products, warns against profit-eroding discounts, and pinpoints "Dead Inventory" within the catalog.

### Key Business Results:
* **$278K Total Revenue** generated across all orders.
* **$141K Total Profit** with a high-performing **44.48% realized margin**.
* **$5K Profit Recovery Opportunity** identified by optimizing discount tiers for underperforming segments.
* **25% Catalog Inactivity:** Identified 5 out of 20 products with zero sales volume, representing trapped capital.

![Executive Overview](Assets/01_Executive%20Overview.png)

---

## Business Problem
The company struggled with "Invisible Profit Erosion." High sales volume was being mistaken for health, while deep discounts were secretly destroying margins on specific items. Management needed to know:
1. Which products are our **true profit heroes**?
2. How much profit are we **losing** to excessive discounting?
3. Which products should be **removed** from the catalog?

---

## Methodology & Tech Stack
I followed an end-to-end analytics workflow to transform raw PostgreSQL data into executive-level insights:

1. **Extraction & Cleaning (SQL):** Handled data integrity issues and modeled profit/cost relationships in PostgreSQL.
2. **Segmentation Logic (DAX):** Created custom logic to categorize products into **Stars, Volume Drivers, Hidden Gems, and Weak.**
3. **Simulation Modeling:** Built a "What-If" scenario to project profit recovery from reduced discounting.

**Technical Skills Demonstrated:**
* **SQL:** JOIN operations, CTEs (Common Table Expressions), Case Logic, and Aggregations.
* **Power BI:** Data Modeling (Star Schema), DAX Measure Authoring, and UI/UX Design.

---

## Strategic Analysis & Visuals

### 1. Portfolio Health & Segmentation
By segmenting the portfolio, we discovered that demand is heavily concentrated in "Star" products. However, the **Portfolio Strategy** view revealed that 25% of the catalog is inactive.

![Portfolio Strategy](Assets/04_Portfolio%20Strategy.png)

### 2. Discount Sensitivity (The "Tipping Point")
The scatter chart identifies exactly where discounts stop driving healthy volume and start destroying net profit. 
* **Insight:** For "Weak" products, a 20% reduction in discount depth would recover **$5,000 in lost margin** without impacting overall demand significantly.

![Discount Sensitivity](Assets/03_Discount%20Sensitivity%20Analysis.png)

### 3. Product Performance Deep-Dive
A detailed breakdown of every SKU to allow category managers to see exactly which colors, sizes, and cities are driving the most value.

![Product Performance](Assets/02_Product%20Performance.png)

---

## Strategic Recommendations
1. **Inventory Rationalization:** Liquidate the 5 inactive products to free up warehouse space and capital.
2. **Tiered Discount Policy:** Cap discounts at 10% for "Volume Drivers" to protect the 44.48% core margin.
3. **Star Allocation:** Reallocate 15% of marketing budget from "Weak" products to "Star" products to maximize ROI.

---

## Future Improvements
* **Customer Lifetime Value (CLV):** Link profitability to specific customer segments.
* **Geospatial Analysis:** Deep-dive into shipping costs vs. manufacturing city locations.
* **Forecasting:** Implement a time-series model to predict demand for Star products.

---
**Author:** Ziad Diab
