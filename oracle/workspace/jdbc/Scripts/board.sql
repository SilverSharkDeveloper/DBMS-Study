CREATE SEQUENCE SEQ_BOARD;


CREATE TABLE TBL_BOARD(
	BOARD_ID NUMBER CONSTRAINT PK_BOARD PRIMARY KEY,
	BOARD_TITLE VARCHAR2(500) NOT NULL,
	BOARD_CONTENT VARCHAR2 (500) NOT NULL,
	BOARD_REGISTER_DATE DATE DEFAULT SYSDATE,
	BOARD_UPDATE_DATE DATE DEFAULT SYSDATE,
	USER_ID NUMBER NOT NULL,
	CONSTRAINT FK_BOARD_MEMBER FOREIGN KEY(USER_ID) REFERENCES TBL_USER(USER_ID) ON DELETE CASCADE
);

UPDATE TBL_BOARD 
SET BOARD_TITLE = 'ㄴ', BOARD_CONTENT = 'S' , BOARD_UPDATE_DATE  = SYSDATE
WHERE BOARD_ID = 1;

DROP TABLE TBL_BOARD ;
SELECT * FROM TBL_BOARD tb JOIN TBL_USER tu 
USING(USER_ID);

SELECT * FROM TBL_BOARD ;
SELECT * FROM TBL_USER tu ;

INSERT INTO TBL_BOARD (BOARD_ID, BOARD_TITLE, BOARD_CONTENT, BOARD_REGISTER_DATE, BOARD_UPDATE_DATE, USER_ID) VALUES(0, '', '', SYSDATE, SYSDATE, 0);
