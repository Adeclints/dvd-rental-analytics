/*
===========================================================
FILE: 03_business_questions.sql
PURPOSE: Answer key business questions using the Pagila dataset
AUTHOR: Clintone Ondiek
===========================================================
*/

-- =========================================================
-- 1. Which movies are rented the most?
-- =========================================================

SELECT
    f.film_id,
    f.title,
    COUNT(r.rental_id) AS total_rentals
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
JOIN rental r
    ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY total_rentals DESC, f.title
LIMIT 10;


-- =========================================================
-- 2. Which movies generate the most revenue?
-- =========================================================

SELECT
    f.film_id,
    f.title,
    sum(p.amount ) AS Total_Revenue
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
JOIN rental r
    ON i.inventory_id = r.inventory_id
    join payment p 
    on r.rental_id = p.rental_id 
GROUP BY f.film_id, f.title
ORDER BY Total_Revenue DESC, f.title
LIMIT 10;

-- =========================================================
-- 3. Which film categories are the most popular by rentals?
-- =========================================================

select 
c.name,
Count(r.inventory_id ) as Total_Movies_Rented
from film f 
join film_category fc  on fc.film_id =f.film_id 
join category c  on c.category_id  = fc.category_id
join inventory i on i.film_id =f.film_id 
join rental r  on r.inventory_id = i.inventory_id 
group by c.name
order by Total_Movies_Rented desc
limit 20;

-- =========================================================
-- 4. Which categories generate the most revenue?
-- =========================================================
select 
c.name,
ROUND(SUM(p.amount ),2) as Total_Revenue
from film f 
join film_category fc  on fc.film_id =f.film_id 
join category c  on c.category_id  = fc.category_id
join inventory i on i.film_id =f.film_id 
join rental r  on r.inventory_id = i.inventory_id
join payment p on p.rental_id = r.rental_id 
group by c.name
order by Total_Revenue desc
limit 20;

-- =========================================================
-- 5. Which films have inventory but low demand?
--    This helps identify inefficient stock allocation.
-- =========================================================
SELECT
    f.film_id,
    f.title,
    COUNT(DISTINCT i.inventory_id) AS inventory_copies,
    COUNT(r.rental_id) AS total_rentals
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
LEFT JOIN rental r
    ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
HAVING COUNT(DISTINCT i.inventory_id) >= 3
ORDER BY total_rentals ASC, inventory_copies DESC, f.title
LIMIT 15;


-- =========================================================
-- 6. Which films were never rented?
-- =========================================================
SELECT
    f.film_id,
    f.title,
    COUNT(DISTINCT i.inventory_id) AS inventory_copies,
    COUNT(r.rental_id) AS total_rentals
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
LEFT JOIN rental r
    ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
HAVING  COUNT(r.rental_id) = 0
ORDER BY total_rentals ASC, inventory_copies DESC, f.title
LIMIT 15;

-- =========================================================
-- 7. Which customers spend the most?
-- =========================================================

select c.first_name, c.last_name, round(SUM(p.amount ),2) as Expenditure
from customer c 
join payment p 
on p.customer_id =c.customer_id 
group by c.first_name, c.last_name
order by Expenditure desc
limit 10;

-- =========================================================
-- 8. Which customers rent most frequently?
-- =========================================================

select 
c.first_name, 
c.last_name, 
round(count(r.rental_id  ),2) as Total_Rentals
from customer c 
join rental r  on r.customer_id = c.customer_id
group by c.first_name, c.last_name
order by Total_Rentals desc
limit 10;

-- =========================================================
-- 9. Which store performs better by rentals and revenue?
-- =========================================================

select s.store_id, 
Count(r.rental_id) as Total_Rentals,
round(sum(p.amount),1) as Revenue
from store s 
join inventory i on i.store_id = s.store_id 
join rental r  on r.inventory_id =i.inventory_id 
join payment p on p.rental_id =r.rental_id 
group by s.store_id
order by  Total_Rentals desc, Revenue desc;


