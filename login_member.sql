create database login;
use login;

create table member(
	id varchar(20) PRIMARY KEY,
	password varchar(16) NOT NULL,
    email varchar(40)
);

select * from member;