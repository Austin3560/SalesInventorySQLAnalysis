# SalesInventorySQLAnalysis

Sales & Inventory SQL Analysis Project
This repository contains a comprehensive SQL analysis of a retail database consisting of customers, products, sales transactions, and inventory levels. The project demonstrates advanced data querying capabilities, including multi-table joins, conditional filtering, date-based analysis, and inventory performance tracking.

Project Scope
The analysis is structured around a four-table relational schema located within a specific database (defaultdb) and schema (assignment). It addresses 50 distinct business questions designed to extract actionable insights from the operational data.

Core Tables
Customers: Profiles, membership tiers (Gold, Silver, Bronze), and registration history.

Products: Catalog details including pricing, categories, and suppliers.

Sales: Transaction records tracking quantities, dates, and total revenue.

Inventory: Current stock levels linked to product IDs.

Analytical Highlights
The SQL script provides solutions for various business intelligence needs:

Customer Segmentation: Identifying high-value shoppers and analyzing purchase patterns by membership status.

Sales Performance: Calculating revenue per product, top-performing categories, and monthly growth trends.

Inventory Management: Highlighting low-stock items and products with zero sales velocity over specific periods.

Operational Efficiency: Correlating registration dates with first purchases to measure customer onboarding success.

Technical Details
Dialect: MySQL / Standard SQL.

Key Techniques:

COALESCE for handling null values in financial aggregations.

INNER and LEFT JOIN for relational data retrieval.

EXTRACT and DATE_ADD for chronological analysis.

HAVING and GROUP BY for granular data summarization.

Usage
To review the analysis, navigate to the scripts/ directory and open the .sql file. Each query is preceded by a comment describing its specific business objective.

To execute the code, ensure your environment is configured to point toward:

Database: defaultdb

Schema: assignment

