create table zproduct(
	num number primary key, 
	name varchar2(60) not null, 
	price number(9) not null, 
	stock number(6) not null, 
	origin varchar2(30) not null,
	content clob not null,
	reg_date date not null
);

create sequence zproduct_seq;