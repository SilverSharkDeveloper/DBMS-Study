
DROP TABLE OWNER;
DROP TABLE PET;

CREATE TABLE PET(
	PETPIN VARCHAR2(100) PRIMARY KEY,
	PETNAME VARCHAR2(100),
	PETAGE NUMBER,
	PETGENDER CHAR(1) DEFAULT 'M' NOT NULL CONSTRAINT BAN_GENDER CHECK(PETGENDER IN('M','W'))
, OWNERID VARCHAR2(100),
CONSTRAINT PET_FK FOREIGN KEY(OWNERID) REFERENCES OWNER(OWNERID)
	);

CREATE TABLE OWNER(
	OWNERID VARCHAR2(100) PRIMARY KEY,
	OWNERNAME VARCHAR2(100),
	OWNERAGE NUMBER,
	OWNERADDRESS VARCHAR2(100)
);

SELECT * FROM PET;
SELECT * FROM OWNER;

INSERT INTO OWNER
(OWNERID, OWNERNAME, OWNERAGE, OWNERADDRESS)
VALUES('20000103001', '홍길동', 20, '경기도 남양주시');

INSERT INTO OWNER
(OWNERID, OWNERNAME, OWNERAGE, OWNERADDRESS)
VALUES('20000103002', '장보고', 30, '경기도 평택시');

INSERT INTO PET
(PETPIN, PETNAME, PETAGE, PETGENDER, OWNERID)
VALUES('123', '뽀삐', 4, 'M' , '20000103001');

INSERT INTO PET
(PETPIN, PETNAME, PETAGE, PETGENDER, OWNERID)
VALUES('124', '냐옹이', 3, 'M' , '20000103001');

INSERT INTO PET VALUES('125','바둑이',5,'W','20000103002');

DELETE FROM PET
WHERE PETAGE = 3;

UPDATE PET 
SET PETNAME = '뽀삐'
WHERE PETNAME ='바둑이'