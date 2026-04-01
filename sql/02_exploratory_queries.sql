/*
===========================================================
FILE: 02_exploratory_queries.sql
PURPOSE: Explore dataset and understand patterns
===========================================================
*/

-- ==============================
-- 1. PREVIEW FILMS
-- ==============================

SELECT film_id, title, rental_rate, length
FROM film
LIMIT 10;

-- ==============================
-- 2. PREVIEW CUSTOMERS
-- ==============================

SELECT customer_id, first_name, last_name, email
FROM customer
LIMIT 10;

-- ==============================
-- 3. PREVIEW RENTALS
-- ==============================

SELECT rental_id, customer_id, inventory_id, rental_date, return_date
FROM rental
LIMIT 10;

-- ==============================
-- 4. LIST ALL CATEGORIES
-- ==============================

SELECT *
FROM category;

-- ==============================
-- 5. COUNT RENTALS BY FILM
-- ==============================

SELECT 
    f.title,
    COUNT(r.rental_id) AS total_rentals
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY total_rentals DESC
LIMIT 10;

-- ==============================
-- 6. COUNT PAYMENTS (TOTAL TRANSACTIONS)
-- ==============================

SELECT COUNT(*) AS total_payments
FROM payment;

-- ==============================
-- 7. TOTAL REVENUE
-- ==============================

SELECT SUM(amount) AS total_revenue
FROM payment;

-- ==============================
-- 8. RENTALS PER CUSTOMER
-- ==============================

select 
c.first_name, 
c.last_name,
count(r.rental_id ) as Total_Rentals
from customer c 
join rental r on c.customer_id =r.customer_id  
group by c.first_name, c.last_name
order by  Total_Rentals desc 
limit 10;