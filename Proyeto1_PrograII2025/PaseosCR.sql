create database PaseosCR;
use PaseosCR;
create table usuarios(
	id int not null AUTO_INCREMENT,
    user_name varchar(50),
    email varchar(50),
    pwd varchar(100),
    user_status int,
    PRIMARY KEY (id)
);

create table paseos(
	e_id int not null AUTO_INCREMENT,
    e_userId int not null,
    e_name varchar(100),
    e_description varchar(200),
    e_date varchar(100),
    e_photo varchar(100),
    e_ubication varchar(100),
	e_tickets int,
    Primary key(e_id)
   
);

