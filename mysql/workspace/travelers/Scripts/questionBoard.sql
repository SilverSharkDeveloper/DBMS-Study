use travelers;

INSERT INTO travelers.question_board
(title, content, register_date, updated_date, responsed_status, user_id)
VALUES('문의합니다', '저기요!', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'false', 10);

SELECT qb.id, title, content, register_date, qb.updated_date, responsed_status, user_id,tu.nickname 
FROM question_board qb join tbl_user tu 
on qb.user_id = tu.id 
order by qb.id desc;