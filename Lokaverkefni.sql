create database 2507002960_Lokaverkefni;
#1
create table membership(
mem_num int primary key,
mem_fname varchar(25),
mem_lname varchar(25),
mem_street varchar(50),
mem_city varchar(20),
mem_state char(2),
mem_zip char(5),
mem_balance int 
);

create table rental(
rent_num int primary key,
rent_date datetime,
mem_num int, 
FOREIGN KEY (mem_num) REFERENCES membership(mem_num)
);

create table price(
price_code int primary key,
price_desc varchar(25),
price_rentfee float(2,1),
price_dailytefee float(2,1)
);

create table movie(
movie_num int primary key,
movie_name varchar(50),
movie_year char(4),
movie_cost float(4,2),
movie_genre varchar(15),
price_code int,
FOREIGN KEY (price_code) REFERENCES price(price_code)
);

create table video(
vid_num int primary key,
vid_indate datetime,
movie_num int,
FOREIGN KEY (movie_num) REFERENCES movie(movie_num)
);

create table detailrental(
rent_num int,
vid_num int,
detail_fee float(2,1),
detail_duedate datetime,
detail_returndate datetime,
detail_dailylatefee int,
FOREIGN KEY (rent_num) REFERENCES rental(rent_num),
FOREIGN KEY (vid_num) REFERENCES video(vid_num)
);
#2
insert into membership(mem_num, mem_fname, mem_lname, mem_street, mem_city, mem_state, mem_zip, mem_balance)
values 
(102,"Tami","Dawson","2632 Takli Circle","Norene","TN",37136,11),
(103,"Curt","Knight","4025 Cornell Court","Flatgap","KY",41219,6),
(104,"Jamal","Melendez","788 East 145th Avenue","Quebeck","TN",38579,0),
(105,"Iva","Mcclain","6045 Musket ball Circle","Summit","KY",42783,15),
(106,"Miranda","Parks","4469 Mawell Place","Germantown","TN",38183,0),
(107,"Rosario","Elliot","7578 Danner Avenue","Columbia","TN",38402,5),
(108,"Mattie","Guy","4390 Evergreen Street","Lily","KY",40740,0),
(109,"Clint","Ochoa","1711 Elm Street","Greeneville","TN",37745,10),
(110,"Lewis","Rosales","4524 Southwind Circle","Counce","TN",38326,0),
(111,"Stacy","Mann","2789 East Cook Avenue","Murfreesboro","TN",37132,8),
(112,"Luis","Trujillo","7267 Melvin Avenue","Heiskell","TN",37754,3),
(113,"Minnie","Gonzales","6430 Vasili Drive","Williston","TN",38076,0);

insert into rental(rent_num, rent_date, mem_num)
values
(1001,"2009-03-01",103),
(1002,"2009-03-01",105),
(1003,"2009-03-02",102),
(1004,"2009-03-02",110),
(1005,"2009-03-02",111),
(1006,"2009-03-02",107),
(1007,"2009-03-02",104),
(1008,"2009-03-03",105),
(1009,"2009-03-03",111);

insert into price(price_code, price_desc, price_rentfee, price_dailytefee)
values
(1,"Standard",2.0,1.0),
(2,"New Release",3.5,3.0),
(3,"Discount",1.5,1.0),
(4,"Weekly Special",1.0,0.5);

insert into movie(movie_num,movie_name,movie_year,movie_cost,movie_genre,price_code)
values
(1234,"The Cesar Family Christmas","2007",39.95,"Family",2),
(1235,"Smokey Mountain Wildlife","2004",59.95,"Action",1),
(1236,"Richard Goodhope","2008",59.95,"Drama",2),
(1237,"Beatnik Fever","2007",29.95,"Comedy",2),
(1238,"Constant Companion","2008",89.95,"Drama",2),
(1239,"Where Hope Dies","1998",25.45,"Drama",3),
(1245,"Time to burn","2005",45.45,"Action",1),
(1246,"What He Doesn't Know","2006",58.29,"Comedy",1);

insert into video(vid_num, vid_indate, movie_num)
values
(54321,"2008-06-18",1234),
(54324,"2008-06-18",1234),
(54325,"2008-06-18",1234),
(34341,"2007-01-22",1235),
(34342,"2007-01-22",1235),
(34366,"2009-03-02",1236),
(34367,"2009-03-02",1236),
(34368,"2009-03-02",1236),
(34369,"2009-03-02",1236),
(44392,"2008-10-21",1237),
(44397,"2008-10-21",1237),
(59237,"2009-02-14",1237),
(61388,"2007-01-25",1239),
(61353,"2006-01-28",1245),
(61354,"2006-01-28",1245),
(61367,"2008-07-30",1246),
(61369,"2008-07-30",1246);

insert into detailrental(rent_num,vid_num,detail_fee,detail_duedate,detail_returndate,detail_dailylatefee)
values
(1001,34342,2.0,"2009-03-04","2009-03-02",1),
(1001,61353,2.0,"2009-03-04","2009-03-03",1),
(1002,59237,3.5,"2009-03-04","2009-03-04",3),
(1003,54325,3.5,"2009-03-04","2009-03-09",3),
(1003,61369,2.0,"2009-03-06","2009-03-09",1),
(1003,61388,0.0,"2009-03-06","2009-03-09",1),
(1004,44392,3.5,"2009-03-05","2009-03-07",3),
(1004,34367,3.5,"2009-03-05","2009-03-07",3),
(1004,34341,2.0,"2009-03-07","2009-03-07",1),
(1005,34342,2.0,"2009-03-07","2009-03-05",1),
(1005,44397,3.5,"2009-03-05","2009-03-05",3),
(1006,34366,3.5,"2009-03-05","2009-03-04",3),
(1006,61367,2.0,"2009-03-07",null ,1),
(1007,34368,3.5,"2009-03-05",null ,3),
(1008,34369,3.5,"2009-03-05","2009-03-05",3),
(1009,54324,3.5,"2009-03-05",null ,3),
(1001,34366,3.5,"2009-03-04","2009-03-02",3);

#3
select movie_name,movie_year,movie_cost 
from movie
where movie_name like "%hope%";

#4
select movie_name,movie_year,movie_genre 
from movie
where movie_genre like "Action";

#5
select movie_num,movie_name,movie_cost 
from movie
where movie_cost > 40.00;

#6
select movie_num,movie_name,movie_cost, movie_genre 
from movie
where movie_genre like "Action" and movie_cost < 50.00 or movie_genre like "Comedy" and movie_cost < 50.00;

#7
select movie_num, concat(movie_name, " ", "(",movie_year,")", " ", movie_genre) as Movie_Description
from movie;

#8
select movie_genre, count(movie_name) as No_of_movies
from movie
group by movie_genre;

#9
select avg(movie_cost)
from movie;

#10
select movie_genre, avg(movie_cost) as AVG_COST
from movie
group by movie_genre;

#11
select m.movie_name, m.movie_genre, p.price_desc, p.price_rentfee
from movie m
inner join price p 
on m.price_code = p.price_code
where p.price_code is not null;

#12
select movie_genre, avg(price_rentfee) as AVG_Rentfee
from movie m
inner join price p 
on m.price_code = p.price_code
where p.price_code is not null
group by movie_genre;

#13
select movie_name, movie_year, round(movie_cost/price_rentfee, 2) as Breakeven_rentals
from movie m
inner join price p 
on m.price_code = p.price_code
where p.price_code is not null;

#14
select movie_name, movie_year
from movie m
inner join price p 
on m.price_code = p.price_code
where p.price_code is not null;

#15
select movie_name, movie_year, movie_cost
from movie
where movie_cost between 44.99 and 49.99;

#16
select movie_name, movie_year, price_desc, price_rentfee, movie_genre
from movie m, price p
where m.price_code = p.price_code and movie_genre in ('Family', 'Comedy', 'Drama');

#17
select min(mem_balance) as Min_balance, max(mem_balance) as Max_balance, avg(mem_balance) as Avg_balance
from membership m 
inner join rental r 
on m.mem_num = r.mem_num
where r.mem_num is not null;

#18
select concat(mem_fname, " ", mem_lname) as MEM_Name, concat(mem_street, " ", mem_city, " ", mem_state, " ", mem_zip) as MEM_Adress
from membership;

#19
select distinct r.rent_num , r.rent_date, v.vid_num, movie_name, d.detail_duedate, d.detail_returndate
from movie m
inner join video v on m.movie_num = v.movie_num
inner join detailrental d on v.vid_num = d.vid_num
inner join rental  r on d.rent_num = r.rent_num
where d.detail_duedate < d.detail_returndate
order by r.rent_num, m.movie_name;

#20
select distinct r.rent_num , rent_date, v.vid_num, movie_name,detail_fee, detail_duedate, detail_returndate, datediff(detail_returndate, detail_duedate) as Days_Past_Due
from movie m
inner join video v on m.movie_num = v.movie_num
inner join detailrental d on v.vid_num = d.vid_num
inner join rental  r on d.rent_num = r.rent_num
where d.detail_duedate < d.detail_returndate
order by r.rent_num, m.movie_name;

#21
select r.rent_num , rent_date, movie_name, detail_fee
from movie m
inner join video v on m.movie_num = v.movie_num
inner join detailrental d on v.vid_num = d.vid_num
inner join rental  r on d.rent_num = r.rent_num
where d.detail_duedate <= d.detail_returndate;

#22
select m.mem_num, m.mem_lname, m.mem_fname, sum(d.detail_fee-d.detail_dailylatefee) as Rental_Fee_Revenue
from membership, detailrental d
inner join rental  r on d.rent_num = r.rent_num
inner join membership m on r.mem_num = m.mem_num
group by m.mem_num;

#23
select 
movie_num, 
movie_genre, 
round(avg(movie_cost), 2) as AVG_Cost_OF_Genre,
movie_cost,
round((movie_cost-avg(movie_cost)/avg(movie_cost)* 100),2) as Percentage
from movie
group by movie_genre
order by movie_num;
#ÞARF AÐ LAGA
#24
  