-- =====================================================
-- DAY 1: BASIC CASE
-- Business Question:
-- How can we classify films by duration to understand the type of content available?
--
select title, length,
case 
	when length <  60 then 'small'
     when length between 60 and 120 then 'medium'
     when length > 120 then 'long'
     end as film_length
from film;

-- Insight:
-- This helps identify whether the inventory has more short, medium, or long films.
-- =====================================================


-- =====================================================
-- Business Question:
-- Which customers are currently active or inactive?
select first_name,
case when active = 1 then 'active'
     else 'inactive' end as Customer_status
from customer;
-- Insight:
-- This helps the business know which customers can be targeted for promotions
-- and which inactive customers may need re-engagement campaigns.
-- =====================================================