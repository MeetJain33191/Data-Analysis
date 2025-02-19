create schema 17_feb;

create table students
(
	id int not null unique,
    name varchar(25) not null,
    percentage float ,
    grade char not null
);
describe students;
-- rename table name
alter table students rename std;
describe std;
-- rename column
alter table std rename column grade to Grade;
 
 -- drop column
 alter table std drop Grade;

alter table std add column Grade char not null;
-- modify column
alter table std modify column Grade varchar(30) not null;
-- add column last name
alter table std add column last_name varchar(30) not null;
alter table std drop last_name;
alter table std add column last_name varchar(30) not null after name;
alter table std rename column name to first_name;
drop table std;
drop schema 17_feb;