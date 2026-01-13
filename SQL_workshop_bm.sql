-- Question 1
select title, release_date
from songs
where strftime ('%Y',release_date)='2022'
order by release_date DESC;
--Question 2
select title, popularity_score, duration_seconds
from songs
where popularity_score > 80
and duration_seconds < 240;
--Question 3
select artist_name
from artists
where artist_name like 'the%';
--Question 4 
--I mispelled premium when I created the table so I just left it like that 

select customer_id, 
first_name,
last_name,
join_date,
preimium_member
from customers
where preimium_member = 'true'
and strftime('%Y',join_date)='2022';

-- Question 5

select sum(duration_seconds) / 60.0 AS total_duration_min
from songs;

-- question 6

select purchase_id, song_id, price
from purchases
order by price desc
limit 5;

-- question 7

select song_id
from songs
where popularity_score > 90;

select *
from purchases
where song_id IN (
Select song_id
from songs
where popularity_score > 90
);

-- question 8
select purchase_id, customer_id, song_id, purchase_date, price
from purchases
where purchase_date between '2023-01-01' and '2023-03-31';

-- question 9
select title, popularity_score
from songs
where popularity_score > 90
order by popularity_score desc;
