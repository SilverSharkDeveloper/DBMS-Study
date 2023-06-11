use travelers;


set foreign_key_checks = 1;

drop table notice_board ; 

INSERT INTO notice_board
(title, content, register_date, updated_date, viewed_count, admin_id)



VALUES('하하호호', '반가워', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 2);

select * from notice_board nb ;

SELECT nb.id, title, content, register_date, nb.updated_date, viewed_count, admin_id,tu.nickname admin_nickname
FROM notice_board nb join tbl_user tu 
on nb.admin_id = tu.id
order by nb.id desc;

SELECT nb.id,
		title, content, register_date, nb.updated_date, viewed_count,
		admin_id,tu.nickname admin_nickname
		FROM notice_board nb join tbl_user tu
		on nb.admin_id = tu.id
		order by nb.id desc
		
