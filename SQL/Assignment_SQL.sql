create database assignment;
create table customers (
customer_id int  not null,
cust_name varchar(25) not null,
city varchar(25) not null ,
grade int not null ,
salesman_id int not null 
);

insert into customers values (3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', 200, 5005);

create table orders (
order_no int not null,
purch_amot int not null ,
order_date date ,
customer_id int not null ,
salesman_id int not null
);

insert into orders values (70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 500);

create table item(
PRO_ID int not null ,
PRO_NAME varchar(25) not null ,
PRO_PRICE int not null,
PRO_COM int not null
);
 insert into item values(101, 'Motherboard', 3200.00, 15),
(102, 'Keyboard', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12);
select * from item ;


/* 1. write a SQL query to find customers who are either from the city 'NewYork' or
who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id.*/

select customer_id, cust_name, city, grade, salesman_id from customers where city = 'NewYork' or grade > 100; 

/* 2. write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100.
 Return customer_id, cust_name, city, grade, and salesman_id. */
select * from customers where city = "New York" and grade > 100;
/* 3 Write a SQL query that displays order number, purchase amount, and the
achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.*/

/* 4. write a SQL query to calculate the total purchase amount of all orders. Returntotal purchase amount. */ 
select SUM(purch_amot) AS total_amount from orders;
/* 5. write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. */ 
select customer_id , purch_amot from orders where purch_amot order by  purch_amot desc  limit 1;
/* 6. write a SQL query to calculate the average product price. Return average product
price. */ 
select avg(PRO_PRICE) as avg_price_product from item;