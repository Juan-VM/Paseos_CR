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
	provincia varchar(50)
);

INSERT INTO usuarios (user_name, email, pwd, user_status) VALUES ("gerardo", "gerardoporras@gmal.com","123",1);

describe usuarios;


select * from usuarios;

