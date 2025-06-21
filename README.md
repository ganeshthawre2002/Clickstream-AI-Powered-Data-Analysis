🚀 AI-Powered Clickstream Analytics Dashboard

Project Title: Customer Purchase Behavior Analysis (Oct 2019 - Nov 2019)Tools Used: PostgreSQL, Python, Power BI, ChatGPT (AI Prompting)Author: Ganesh Thawre

![clickstream](https://github.com/user-attachments/assets/51008fd3-81c1-4171-8bf8-7f474d7bc575)

📅 Project Overview

This project analyzes over 110 million customer interaction records collected from a digital retail platform over a 2-month period (October & November 2019). 
The goal was to identify high-value users, segment customers, track product trends, and generate automated business insights using AI prompts.

![Home for main dashboard](https://github.com/user-attachments/assets/fa111725-22de-4368-ba24-2ecde07aab12)

📊 Dataset Summary

Total Orders: 110,950,743

Total Revenue: ₹32,065,463,201.13

Unique Customers: 6,718,407

Avg Order Value: ₹292.35

Dataset Size: ~22 GB+ (combined across Oct & Nov)

Raw Rows per File: ~10,485,760 each month (Oct & Nov)

⚠️ Project Challenges

🔧 Massive Dataset Size: Over 110M rows across two months made initial ingestion and transformation time-consuming.

🔄 Performance Issues: Power BI and PostgreSQL both required optimization steps to avoid lag/crashes (materialized views, indexed filters).

⚫️ Null Values: Millions of missing values in category_code, brand, and user_session were cleaned and treated appropriately.

⏳ Slow Querying: Aggregations and joins required optimized SQL with batching and filters.

✅ Solution: We used PostgreSQL views, filtered exports, and separated dashboards (Sales vs Segmentation) for performance.

📊 Key Modules

1. Data Cleaning & SQL Integration

Cleaned massive CSVs with over 100M+ rows using PostgreSQL

Handled missing values, formatted event time, filtered only 'purchase' events

Created RFM & Market Basket ready datasets

2. Python-Based Modeling

RFM Segmentation (Recency, Frequency, Monetary) using pandas

Customer Segments: VIP, Loyal, At Risk, New, Others

Market Basket Analysis using FP-Growth (mlxtend)

CLTV Calculation using simplified monetary x frequency logic

3. Power BI Dashboards

Built multiple pages:

Sales Overview (Revenue, Orders, AOV trends)

Customer Insights (New, Repeat, Churn, Lifecycle trends)

RFM Segmentation (KPIs, Pie Charts, Distribution)

Market Basket Dashboard (Lift, Confidence, Antecedents)

Product Performance (Top Brands & Categories)

CLTV & Deeper Insights (Top Customers, Repeat Behavior)

4. AI-Powered Business Insights

Used ChatGPT to auto-generate:

Executive summaries

Business insights by segment

Strategy recommendations

Prioritized customer segment actions

📊 Key Insights

⬆️ VIPs drive >40% revenue but are <2% of users

⚡️ Nov 17th shows peak sales – possibly Diwali sale impact

📈 Low AOV suggests opportunity for bundling

🌐 Apple & Samsung dominate across views + purchases

🌟 Repeat customers show strong long-term value

📢 Strategic Recommendations

Launch loyalty program for VIP/Loyal segments

Target "At Risk" users with win-back campaigns

Upsell bundled products to increase AOV

Focus campaigns around proven dates (Nov 17)

🌟 What Makes It Unique

This is not just a dashboard. It's an AI-assisted BI system combining traditional SQL/Python with ChatGPT to generate actionable insights and strategy.

🔗 How to Explore

The .pbix file and notebooks can be shared upon request.

PostgreSQL SQL Scripts

Jupyter Notebooks for RFM, MBA

Power BI Dashboard (.pbix)

✨ Created by Ganesh Thawre

AI-Powered Data Analyst | Prompt Engineer | Data Storyteller

