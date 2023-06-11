use travelers;

select * from notice_board_comment nbc ;

INSERT INTO travelers.notice_board_comment
(content, register_date, updated_date, user_id, board_id)
VALUES('안녕하다', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 32);

SELECT nbc.id, nbc.content, nbc.register_date, nbc.updated_date, nbc.user_id, board_id
FROM notice_board_comment nbc join tbl_user tu 
on tu.id = nbc.user_id  join notice_board nb 
on nb.id = nbc.board_id  
order by nbc.id desc 
limit 0,5;
