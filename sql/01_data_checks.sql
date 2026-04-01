/*
===========================================================
FILE: 01_data_checks.sql
PURPOSE: Validate data integrity after loading Pagila dataset
AUTHOR: Clintone Ondiek
===========================================================
*/

-- ==============================
-- 1. ROW COUNTS (Sanity Check)
-- ==============================

SELECT COUNT(*) AS film_rows FROM pagila.film;
SELECT COUNT(*) AS actor_rows FROM pagila.actor;
SELECT COUNT(*) AS customer_rows FROM pagila.customer;
SELECT COUNT(*) AS rental_rows FROM pagila.rental;
SELECT COUNT(*) AS payment_rows FROM pagila.payment;
select count(*) as adress FROM pagila.address;
select count(*) as city FROM pagila.city ;
select count(*) as country FROM pagila.country ;
select count(*) as film_actor FROM pagila.film_actor ;
select count(*) as film_category FROM pagila.film_category ;
select count(*) as inventory FROM pagila.inventory ;
select count(*) as staff FROM pagila.staff ;
select count(*) as store FROM pagila.store ;
select count(*) as category FROM pagila.category ;
select count(*) as lang FROM pagila.language;

-- ==============================
-- 2. NULL CHECKS
-- ==============================

-- Check for missing film titles
SELECT COUNT(*) AS null_titles
FROM film
WHERE title IS NULL;

-- Check for missing rental dates
SELECT COUNT(*) AS null_rental_dates
FROM rental
WHERE rental_date IS NULL;

-- Check for missing payment amounts
SELECT COUNT(*) AS null_payment_amounts
FROM payment
WHERE amount IS NULL;

-- ==============================
-- 3. DUPLICATE CHECKS (Primary Keys)
-- ==============================

-- Duplicate film_id
SELECT film_id, COUNT(*)
FROM film
GROUP BY film_id
HAVING COUNT(*) > 1;

-- Duplicate rental_id
SELECT rental_id, COUNT(*)
FROM rental
GROUP BY rental_id
HAVING COUNT(*) > 1;

-- Duplicate payment_id
SELECT payment_id, COUNT(*)
FROM payment
GROUP BY payment_id
HAVING COUNT(*) > 1;

-- ==============================
-- 4. REFERENTIAL INTEGRITY CHECKS
-- ==============================

-- Rentals without inventory
SELECT *
FROM rental r
LEFT JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE i.inventory_id IS NULL;

-- Payments without rentals
SELECT *
FROM payment p
LEFT JOIN rental r ON p.rental_id = r.rental_id
WHERE r.rental_id IS NULL;

-- ==============================
-- 5. SAMPLE PREVIEW (Top rows)
-- ==============================

SELECT * FROM film LIMIT 10;
SELECT * FROM customer LIMIT 10;
SELECT * FROM rental LIMIT 10;
SELECT * FROM payment LIMIT 10;