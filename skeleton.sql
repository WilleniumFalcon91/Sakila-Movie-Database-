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


