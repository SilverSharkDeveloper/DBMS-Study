create database mybatis;
use mybatis ;

create table tbl_member(
	id int unsigned auto_increment primary key,
	member_id varchar(500),
	member_password varchar (500) 
);

drop table tbl_member ;

select * from tbl_member ;	

select id,member_id,member_password from tbl_member
   		where member_id = "hds1234" and member_password ="hds1234";

