create table zmember(
	num number not null primary key, 
	id varchar2(12) unique not null, 
	name varchar2(30) not null, 
	passwd varchar2(12) not null,
	phone varchar2(15) not null, 
	email varchar2(50) not null, 
	address varchar2(150) not null, 
	reg_date date not null
);

create sequence zmember_seq;