SELECT FLOWERNAME, COLOR,PRICE 	FROM FLOWER;

INSERT INTO FLOWER 
(FLOWERNAME,COLOR,PRICE)
VALUES('장미','RED',3000);
INSERT INTO FLOWER 
(FLOWERNAME,COLOR,PRICE)
VALUES('해바라기','YELLOW',4000);
INSERT INTO FLOWER 
(FLOWERNAME,COLOR,PRICE)
VALUES('할미꽃','WHITE',9000);

--추가 : 부모와 자식중 무조건 부모테이블에 값을 먼저 추가해야한다.

SELECT * FROM POT;

INSERT INTO POT
(POTID, POTCOLOR, POTSHAPE, FLOWERNAME)
VALUES('20210505001', 'WHITE', 'ROUND', '장미');

INSERT INTO POT
(POTID, POTCOLOR, POTSHAPE, FLOWERNAME)
VALUES('20210505002', 'BLACK', 'SQUARE', '해바라기');
INSERT INTO POT
(POTID, POTCOLOR, POTSHAPE, FLOWERNAME)
VALUES('202105050005', 'YELLOW', 'ROUND', '할미꽃');

--삭제 : 아무데서도 참조하지 않아야 삭제가능 -> 자식테이블의 참조값을 먼저 삭제해야한다.
DELETE FROM FLOWER 
WHERE FLOWERNAME = '장미';

--DELETE 와 TRUNCATE
--DELETE는 복구가 가능하다.
--TRUNCATE는 복구가 불가능하다.

--UPDATE

UPDATE POT
SET FLOWERNAME  = '해바라기'
WHERE POTID = '202105050003';
