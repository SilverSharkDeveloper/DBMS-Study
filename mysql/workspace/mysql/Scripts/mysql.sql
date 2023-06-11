CREATE database TEST;

use TEST;

create table TBL_GUEST(
	GUEST_ID INT unsigned auto_increment primary key,
	GUEST_EMAIL VARCHAR(500) not null unique,
	QUEST_PASSWORD VARCHAR (500) not null,
	QUEST_AGE tinyint unsigneD
);


select * from tbl_guest;

alter table tbl_guest add column(birth date);

insert into tbl_guest(guest_email,quest_password,quest_age)
values('sdfsf@asfd','1234',20);
select concat(quest_age,'살' ) from tbl_guest;

select current_timestamp() from dual;

select date_format(current_timestamp(),'%y년 %m월 %d일 %H:%i:%s')  from dual;

select * from tbl_guest ;

select ifnull(birth,current_timestamp()) birth  from tbl_guest ;

