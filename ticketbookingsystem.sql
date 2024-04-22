create database Ticketbookingsystem;
use Ticketbookingsystem;
--  Creating venue table:

create table venu(
venue_id varchar(10) primary key,
venue_name varchar(30),
address varchar(50)
);


-- Inserting values into the venue table:

insert into venu(venue_id, venue_name, address)
values('v0','Raja theatre','Coimbatore'),
('v1','Nehru stadium','Chennai'),
('v2','Rani College','Kanchipuram'),
('v3','Madhu stadium','Trichy'),
('v4','Avinash college','Karur'),
('v5','Mani theatre','Madurai'),
('v6','Siddhu college','Dindigul'),
('v7','Shanmuga theatre','Palani'),
('v8','Vijay stadium','Salem'),
('v9','Harish theatre','Erode');

-- Creating event table:

create table event(
event_id varchar(10) primary key,
event_name varchar(30),
event_date date,
event_time time,
venue_id varchar(10),
total_seats int,
available_seats int,
ticket_price decimal,
event_type varchar(30),
booking_id varchar(10),
Foreign key (venue_id) references venu(venue_id)
);

-- Inserting values in the event table:

insert into event(event_id,event_name,event_date,event_time,venue_id,total_seats,available_seats,ticket_price,event_type,booking_id)
values('e0','Music concert','2024-04-08','04:30:00','v4',20000,5000,10000.00,'Concert','b6'),
('e1','Kayal','2024-04-10','05:00:00','v5',15000,3000,7000.00,'Movie','b9'),
('e2','Cricket IPL match','2024-04-11','07:30:00','v3',10000,2000,3000.00,'Sports','b3'),
('e3','Yearly concert','2024-04-14','06:00:00','v8',7500,500,5000.00,'Concert','b1'),
('e4','Friendship','2024-04-17','09:00:00','v9',4000,300,2000.00,'Movie','b4'),
('e5','Joe','2024-04-23','02:30:00','v0',9000,1000,7000.00,'Movie','b8'),
('e6','Vacation concert','2024-04-25','06:30:00','v2',5000,500,5000.00,'Concert','b0'),
('e7','Jungle book','2024-04-13','10:30:00','v7',14000,2000,6000.00,'Movie','b7'),
('e8','Football match','2024-04-28','03:30:00','v1',3000,700,8000.00,'Sports','b5'),
('e9','Dance Concert','2024-04-30','04:00:00','v6',9500,1200,4000.00,'Concert','b2');


-- Creating customers table:

create table customers(
customer_id varchar(10) primary key,
customer_name varchar(30),
email varchar(50),
phone_number varchar(50),
booking_id varchar(10)
);

-- Inserting values in the customers table:

insert into customers(customer_id,customer_name,email,phone_number,booking_id)
values('c0','Raja','raja@gmail.com','8425672824','b2'),
('c1','Ravi','ravi@gmail.com','9674839234','b5'),
('c2','Abi','abi@gmail.com','8975643839','b0'),
('c3','Deepi','deepi@gmail.com','9342756485','b7'),
('c4','Siddhu','siddhu@gmail.com','9346221858','b1'),
('c5','Manoj','manoj@gmail.com','6473528161','b8'),
('c6','Sowmi','sowmi@gmail.com','7365138212','b3'),
('c7','Vino','vino@gmail.com','8736254910','b9'),
('c8','Sanjai','sanjai@gmail.com','6437281924','b4'),
('c9','Rani','rani@gmail.com','9435267134','b6');

-- Creating booking table:

create table booking(
booking_id varchar(10) primary key,
customer_id varchar(10),
event_id varchar(10),
num_tickets int,
total_cost int,
booking_date date,
Foreign key (customer_id) references customers(customer_id),
Foreign key (event_id) references event(event_id)
);


-- Inserting value into booking table:

insert into booking(booking_id,customer_id,event_id,num_tickets,total_cost,booking_date)
values('b0','c2','e6',4000,20000000,'2024-04-20'),
('b1','c4','e3',3760,18800000,'2024-04-11'),
('b2','c0','e9',2500,10000000,'2024-04-27'),
('b3','c6','e2',7500,22500000,'2024-04-08'),
('b4','c8','e4',3600,7200000,'2024-04-14'),
('b5','c1','e8',5640,45120000,'2024-04-25'),
('b6','c9','e0',2780,27800000,'2024-04-05'),
('b7','c3','e7',3540,21240000,'2024-04-10'),
('b8','c5','e5',4530,31710000,'2024-04-19'),
('b9','c7','e1',6570,45990000,'2024-04-07');

-- Adding foreign key constraints:

alter table event add constraint eve Foreign key(booking_id) references booking(booking_id);
alter table customers add constraint cus Foreign key(booking_id) references booking(booking_id);