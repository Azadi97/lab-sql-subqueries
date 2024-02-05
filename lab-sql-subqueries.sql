-- 1) Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
select * from film where title = 'HUNCHBACK IMPOSSIBLE';
select * from inventory where film_id = 439;

select count(inventory_id) from inventory 
where inventory.film_id = (select film_id from film where title = 'HUNCHBACK IMPOSSIBLE');

-- 2) List all films whose length is longer than the average length of all the films in the Sakila database.
select * from film where length > (select avg(film.length) from film);


-- 3) Use a subquery to display all actors who appear in the film "Alone Trip".

select concat(lower(first_name), ' ', last_name) 
from (select actor_id from film_actor where film_id = (select film.film_id from film where film.title='Alone Trip')) table_a
inner join actor a
on a.actor_id = table_a.actor_id;

-- 4- Sales have been lagging among young families, and you want to target family movies for a promotion. Identify all movies 
-- categorized as family films.

select title from film f where film_id in (select film_id from film_category fc
INNER join category c on c.category_id = fc.category_id where  c.name = 'Family');



