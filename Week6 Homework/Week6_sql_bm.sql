-- Part 1.1
Select title, publication_year
from books
where publication_year > 2000
order by publication_year desc;
-- Part 1.2
Select title, copies_owned 
from books
where genre_id = 1
and copies_owned > 5;

select * from genres;
select max(copies_owned)
from books
where genre_id = 1;
-- Part 1.3
Select title 
from books
where title like '%History%';
-- Part 1.4
select l.loan_id, l.checkout_date, l.due_date, p.first_name, p.last_name, p.email
from loans l
join patrons p on p.patron_id = l.patron_id
where l.checkout_date >= '2023-01-01'
and l.checkout_date < '2023-02-01';
-- Part 1.5
select l.loan_id,
l.checkout_date,
l.due_date,
b.title,
a.first_name || ' ' || a.last_name author_name, g.genre_name 
from loans l
join books b on b.book_id = l.book_id
join authors a on a.author_id = b.author_id
join genres g on g.genre_id = b.genre_id
order by l.loan_id;
-- Part 1.6
select p1.first_name || ' ' || p1.last_name patron_1, p2.first_name || ' ' || p2.last_name patron_2, p1.city 
from patrons p1
join patrons p2
on p1.city = p2.city
and p1.patron_id < p2.patron_id
order by p1.city;
-- Part 1.7
select b.title, p.first_name || ' ' || p.last_name patron_name, br.branch_name
from loans l
join books b on b.book_id = l.book_id
join patrons p on p.patron_id = l.patron_id
join branches br on br.branch_id = l.branch_id
where b.genre_id = 1;
-- 
select count(*)
from books
where genre_id = 1;
-- Part 2.8
Select g.genre_name, count(b.book_id) total_books 
from genres g
left join books b
on b.genre_id = g.genre_id
group by g.genre_name
order by total_books desc;
-- 
select genre_id, genre_name
from genres
order by genre_id;
--
SELECT DISTINCT genre_id, typeof(genre_id)
FROM books;
-- Part 1.7 again -- the genre is stored as text not intenger and it didn't pull up any fiction earlier 
select b.title, p.first_name || ' ' || p.last_name patron_name, br.branch_name
from loans l
join books b on b.book_id = l.book_id
join patrons p on p.patron_id = l.patron_id
join branches br on br.branch_id = l.branch_id
where b.genre_id = '1';
-- Part 1.2 again 
Select title, copies_owned 
from books
where genre_id = '1'
and copies_owned > 5;
-- Part 2.9
select br.branch_name, 
avg(julianday(l.return_date) - julianday(l.checkout_date)) avg_days,
min(julianday(l.checkout_date)) min_days,
max(julianday(l.checkout_date)) max_days
from loans l
join branches br on br.branch_id = l.branch_id
where l.return_date is not null
group by br.branch_name
order by br.branch_name;
-- Part 2.9 again
select br.branch_name,
avg(julianday(l.return_date)-julianday(l.checkout_date)) avg_days,
min(julianday(l.return_date)-julianday(l.checkout_date)) min_days,
max(julianday(l.return_date)-julianday(l.checkout_date)) max_days
from loans l
join branches br on br.branch_id = l.branch_id
where l.return_date is not null
group by br.branch_name
order by br.branch_name;
-- Part 2.10
Select p.patron_id, p.first_name, p.last_name, count(*) overdue_books
from loans l
join patrons p on p.patron_id = l.patron_id
where l.return_date is null
and l.due_date < date('now')
group by p.patron_id, p.first_name, p.last_name
order by overdue_books desc;
--
select count (*)
from loans
where return_date is null;
-- Part 2.11
select strftime('%y-%m', checkout_date) year_month,
count(*) number_of_loans,
count(distinct patron_id) unique_patrons
from loans
group by year_month
order by year_month;
-- 
select checkout_date, typeof(checkout_date)
from loans
limit 5;
-- part 2.11 again
SELECT
strftime('%Y-%m', date(checkout_date)) year_month,
count(*) number_of_loans,
count(distinct patron_id) unique_patrons
from loans
group by year_month
order by year_month;
