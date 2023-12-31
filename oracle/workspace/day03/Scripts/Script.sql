SELECT * FROM TBL_ANIMAL ;


CREATE TABLE TBL_STUDENT(
	STUDENT_ID NUMBER CONSTRAINT PK_STUDENT PRIMARY KEY,
	STUDENT_IDENTIFICATION VARCHAR2(500) NOT NULL UNIQUE,
	STUDENT_NAME VARCHAR2(500) NOT NULL,
	STUDENT_MAJOR VARCHAR2 (500),
	STUDENT_GENDER CHAR(1) DEFAULT 'N' CONSTRAINT BAN_GENDER CHECK(STUDENT_GENDER IN('N','W','M')),
	STUDENT_BIRTH DATE CONSTRAINT BAN_BIRTH CHECK (STUDENT_BIRTH>= TO_DATE('1985-01-01', 'YYYY-MM-DD')),
	STUDENT_AGE NUMBER,
	STUDENT_GRADE VARCHAR2 (500), CONSTRAINT BAN_GRADE CHECK (STUDENT_GRADE IN('A+','A','B+','B','C+'))
);

DROP  TABLE TBL_STUDENT ;
ALTER TABLE TBL_STUDENT MODIFY STUDENT_IDENTIFICATION NULL;
ALTER TABLE TBL_STUDENT DROP CONSTRAINT BAN_GENDER ;
ALTER TABLE TBL_STUDENT MODIFY STUDENT_GENDER DEFAULT 'W';
ALTER TABLE TBL_STUDENT ADD CONSTRAINT BAN_UNDER_AGE CHECK(STUDENT_AGE>=19);
ALTER TABLE TBL_STUDENT MODIFY STUDENT_AGE NOT NULL;


SELECT * FROM TBL_STUDENT ; 




CREATE TABLE TBL_FLOWER (
	FLOWER_NAME VARCHAR2 (1000) ,
	FLOWER_COLOR VARCHAR2 (500),
	FLOWER_PRICE NUMBER DEFAULT 0 NOT NULL,
	POT_ID NUMBER,
	CONSTRAINT PK_COLORED_FLOWER PRIMARY KEY (FLOWER_NAME,FLOWER_COLOR)
--	CONSTRAINT FK_POT_ID FOREIGN KEY (POT_ID) REFERENCES TBL_POT(POT_ID)
)

CREATE TABLE TBL_POT (
	POT_ID NUMBER PRIMARY KEY ,
	POT_COLOR VARCHAR2(500) NOT NULL,
	POT_SHAPE VARCHAR2 (500)NOT NULL,
	FLOWER_NAME VARCHAR2 (500),
	FLOWER_COLOR VARCHAR2 (500),
	CONSTRAINT SERCH_FLOWER FOREIGN KEY (FLOWER_NAME,FLOWER_COLOR) REFERENCES TBL_FLOWER(FLOWER_NAME,FLOWER_COLOR)
)


DROP TABLE TBL_POT ;




CREATE TABLE TBL_PET(
	PET_ID NUMBER PRIMARY KEY ,
	PET_NAME VARCHAR2(500) NOT NULL,
	PET_TYPE VARCHAR2 (500) NOT NULL,
	PET_NICKNAME VARCHAR2 (500) NOT NULL,
	PET_ILL_NAME VARCHAR2 (500) NOT NULL,
	OWNER_ID NUMBER,
	CONSTRAINT FK_PET_OWNER FOREIGN KEY(OWNER_ID) REFERENCES TBL_OWNER(OWNER_ID)
)


CREATE TABLE TBL_OWNER(
	OWNER_ID NUMBER PRIMARY KEY,
	OWNER_NAME VARCHAR2(500) NOT NULL,
	OWNER_ADDRESS VARCHAR2(500)NOT NULL,
	OWNER_PHONE VARCHAR2(500) NOT NULL,
	OWNER_AGE NUMBER NOT NULL);


DROP TABLE TBL_PET  ;






