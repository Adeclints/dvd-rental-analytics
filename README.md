\# DVD Rental Analytics with PostgreSQL and Power BI



\## Project Overview

This project analyzes a DVD rental business database using PostgreSQL. The goal is to answer business questions related to customer behavior, film performance, store revenue, and rental trends.



\## Tools Used

\- PostgreSQL (Neon)

\- DBeaver

\- GitHub

\- Power BI



\## Dataset

This project uses the Pagila database, a PostgreSQL adaptation of the Sakila sample database from MySQL.



\## Key Business Questions

\- Which movies are rented the most?

\- Which customers generate the most revenue?

\- What percentage of revenue comes from the top 20% of customers?

\- Which categories perform best?

\- How does revenue change over time?



\## Data Model

Main relationship used:

film → inventory → rental → payment



\## Key Insights

\- A small group of customers contributes a large share of total revenue.

\- Certain film categories consistently outperform others.

\- Rental activity varies over time and can be tracked monthly.

\- Some films have many inventory copies but low rental frequency.



\## Dashboard

The Power BI dashboard includes:

\- Revenue KPIs

\- Top films

\- Top customers

\- Monthly rental trends

\- Category performance



\## How to Run

Open the SQL files in DBeaver and run them against the Pagila database hosted on Neon.

