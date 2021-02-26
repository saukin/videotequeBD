SELECT concat(first_name, ' ', last_name) NAME
	, title FILM
    , d_last_name DIRECTOR
    , sum(rent_duration) JOURS
    , price PRIX
    , rent_duration*price "PRIX TOTALE"
FROM clients JOIN orders USING(client_id) 
			 JOIN videos USING(video_id) 
             JOIN videos_directors USING(video_id)
             JOIN directors USING(director_id)
             JOIN categories USING(categorie)
GROUP BY NAME, FILM, DIRECTOR
ORDER BY NAME;


SELECT country, province, city, count(client_id), count(rent_duration), round(avg(price * rent_duration), 2)
FROM clients INNER JOIN addresses USING (client_id)
			 INNER JOIN  orders USING (client_id)
             INNER JOIN videos USING (video_id)
             INNER JOIN categories USING (categorie)
GROUP BY country, province, city
ORDER BY country, province, city;


select title, concat(d_last_name, '  ', d_first_name), sum(rent_duration*price)
from videos v INNER JOIN videos_directors USING (video_id)
              INNER JOIN directors USING (director_id)
              INNER JOIN videos_actors USING (video_id)
              INNER JOIN actors USING (actor_id)
              INNER JOIN categories USING (categorie)
              INNER JOIN orders USING (video_id)
group by title, d_last_name, d_first_name
order by title;


INSERT INTO orders (order_date, rent_duration, client_id, video_id)
SELECT now(), 3, client_id, video_id
	from clients, videos
    where last_name = 'Katepim' AND title = 'terminator';

INSERT INTO orders (order_date, rent_duration, client_id, video_id)
SELECT now(), 4, client_id, video_id
	from clients, videos
    where last_name = 'Katepim' AND title = 'terminator';
    
    
delete from clients where client_id = 1;
delete from orders where client_id = 2;
delete from categories where categorie = 'xxx';
delete from directors where d_last_name = 'allen';

update directors 
set d_last_name = 'kubik' 
where d_last_name = 'kubrik';