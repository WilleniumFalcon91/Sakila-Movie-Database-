SELECT
FROM
WHERE
;

SELECT first_name, last_name, email
FROM customer
WHERE store_id = 2
;

SELECT title, rental_rate 
FROM film
WHERE rental_rate = .99;

SELECT count(title), rental_rate
FROM film
GROUP BY rental_rate;

SELECT count(title) rating
FROM film
GROUP BY rating
;

SELECT rating, rental_rate, count(film_id)
FROM film
GROUP BY 1, 2
;

SELECT customer.customer_id, customer.first_name, customer.last_name, address.address
FROM customer, address
WHERE customr.address_id = address.address_id
;

#three tables 
every film, category, langugage 

SELECT film_list.title, category.name, language.name
FROM film_list, language, film_category, category
WHERE film.language_id = language.language_id and film_category.category_id = category.category_id
;

SELECT film.title, category.name, language.name 
FROM film, language, film_category, category
WHERE film.film_id = film_category.film_id 
    and category.category_id = film_category.category_id
    and film.language_id = language.language_id
;

how many times each movie has been rented

SELECT 
    film.title, count(rental.rental_id)
FROM 
    film, inventory, rental
WHERE 
    film.film_id = inventory.film_id
    and 
    inventory.inventory_id = rental.inventory_id
GROUP BY 
    1
;

SELECT
    ac.customer_id, 
    ac.fav_color,
    rc.num_purchases
FROM
    active_customer ac, 
    reward_customer rc
WHERE
    ac.customer_id = rc.customer_id
;


#JOIN and INNER JOIN are interchangable 

SELECT 
    ac.customer_id, 
    ac.fav_color, 
    rc.num_purchases
FROM 
    active_customer ac 
    JOIN reward_customer rc ON ac.customer_id = rc.customer_id
;

#LEFT JOIN
SELECT 
    ac.customer_id, 
    ac.fav_color, 
    rc.num_purchases
FROM 
    active_customer ac 
    LEFT JOIN reward_customer rc ON ac.customer_id = rc.customer_id
;

#creates temporary table for active users 
SELECT 
    c.*,
    a.phone
FROM 
    customer c
    	JOIN address a ON c.address_id = a.address_id
WHERE 
    c.active = 1
GROUP BY 
    1
;

#creates temporary table for number of rentals 30 or over 
SELECT 
    r.customer_id,
    count(r.rental_id) as num_rentals,
    max(rental_date)
FROM 
    rental r
GROUP BY 
    1
HAVING 
    num_rentals >= 30
;


