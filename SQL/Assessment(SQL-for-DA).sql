create database assessment;
-- AS creating the three table of the city customer and country 
create table city(
id int primary key ,
city_name varchar(25),
lat float4 not null,
lon float4 not null,
country_id int not null 
);
describe city;
-- This is the table data for the city
insert into city values
(1, 'Berlin', 52.520008, 13.404954, 1),
(2, 'Belgrade', 44.787197, 20.457273, 2),
(3, 'Zagreb', 45.815399, 15.966568, 3),
(4, 'New York', 40.730610, -73.935242, 4),
(5, 'Los Angeles', 34.052235, -118.243683, 4),
(6, 'Warsaw', 52.237049, 21.017532, 5);
create table customer (
    id int primary key ,
    customer_name varchar(50) not null,
    city_id int not null,
    customer_address varchar(225),
    next_call_date date,
    ts_inserted datetime
);
describe customer;
-- This is the data for the customer
INSERT INTO Customer VALUES
(1, 'Jewelry Store', 4, 'Long Street 120', '2020-01-21', '2020-01-09 14:01:20.000'),
(2, 'Bakery', 1, 'Kurfürstendamm 25', '2020-02-21', '2020-01-09 17:52:15.000'),
(3, 'Café', 1, 'Tauentzienstraße 44', '2020-01-21', '2020-01-10 08:02:49.000'),
(4, 'Restaurant', 3, 'Ulica lipa 15', '2020-01-21', '2020-01-10 09:20:21.000');

create table country (
    id int primary key,
    country_name varchar(50) not null,
    country_name_eng varchar(50) not null,
    country_code char(3) not null
);
describe country;
-- this is the data of country 
INSERT INTO Country VALUES
(1, 'Deutschland', 'Germany', 'DEU'),
(2, 'Srbija', 'Serbia', 'SRB'),
(3, 'Hrvatska', 'Croatia', 'HRV'),
(4, 'United States of America', 'United States of America', 'USA'),
(5, 'Polska', 'Poland', 'POL'),
(6, 'España', 'Spain', 'ESP'),
(7, 'Rossiya', 'Russia', 'RUS');

-- TASK 1
SELECT 
    co.country_name_eng AS Country,
    ci.city_name AS City,
    cu.customer_name AS Customer
FROM 
    Country co
LEFT JOIN 
    City ci 
    ON co.id = ci.country_id
LEFT JOIN 
    Customer cu 
    ON ci.id = cu.city_id
ORDER BY 
    co.country_name_eng;

-- TASK 2
select 
    co.country_name_eng as country_name,
    ci.city_name,
    cu.customer_name
from country co
inner join (
    select country_id
    from city
    group by country_id
    having count(*) >= 2
) c_pairs
    on co.id = c_pairs.country_id
left join city ci
    on co.id = ci.country_id
left join customer cu
    on ci.id = cu.city_id
order by co.country_name_eng, ci.city_name;