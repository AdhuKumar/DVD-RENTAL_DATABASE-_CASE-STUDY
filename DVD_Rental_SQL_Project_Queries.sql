SELECT c.first_name || ' ' || c.last_name AS customer_name,
       SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;

SELECT f.title, COUNT(r.rental_id) AS total_rentals
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY total_rentals DESC
LIMIT 10;

SELECT c.name AS category,
       SUM(p.amount) AS total_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY total_revenue DESC;

SELECT active,
       COUNT(*) AS customer_count
FROM customer
GROUP BY active;

SELECT c.first_name || ' ' || c.last_name AS customer_name,
       SUM(p.amount) AS total_spent,
       CASE 
           WHEN SUM(p.amount) >= 150 THEN 'High'
           WHEN SUM(p.amount) BETWEEN 100 AND 149.99 THEN 'Medium'
           ELSE 'Low'
       END AS spender_segment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY customer_name
ORDER BY total_spent DESC;