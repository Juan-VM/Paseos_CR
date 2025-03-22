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

describe usuarios;
select * from usuarios;

create table reservas(
	reserv_id int not null AUTO_INCREMENT,
    event_id int not null,
    user_id int not null,
    r_tickets int not null,
	PRIMARY KEY (reserv_id)
);

delete from paseos where e_id = 1;

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

insert into paseos(e_userId, e_name, e_description, e_date, e_photo, e_ubication, e_tickets)
VALUES (1, "playa del coco", "Disfruta del sol y el mar en este paraíso tropical.", "15/03/2025", "img/Playa-del-Coco1.jpg", "PLaya del Coco", 5);

insert into paseos(e_userId, e_name, e_description, e_date, e_photo, e_ubication, e_tickets)
VALUES (1, "Baldi", "Relájate en las mejores aguas termales del país.", "15/03/2025", "img/Slider-19.jpg", "La fortuna", 5);

insert into paseos(e_userId, e_name, e_description, e_date, e_photo, e_ubication, e_tickets)
VALUES (1, "Monteverde", "Explora el bosque nuboso y su biodiversidad única.", "15/03/2025", "img/Monteverde-Cloud-Forest-e1688155957573.jpeg", "Monteverde", 5);


INSERT INTO usuarios (user_name, email, pwd, user_status)
VALUES ("Marco", "marcoesteban777@gmail.com", "123", 1);

SELECT * FROM reservas INNER JOIN paseos ON reservas.event_id = paseos.e_id WHERE reservas.user_id = 2;
UPDATE paseos SET e_tickets = 200 WHERE e_id = 7;
SELECT * FROM paseos;

SHOW DATABASES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'Admin$1234';
FLUSH PRIVILEGES;