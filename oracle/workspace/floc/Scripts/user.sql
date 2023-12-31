CREATE SEQUENCE SEQ_USER;


SELECT * FROM TBL_USER ;

SELECT * FROM TBL_PRODUCT tp ORDER BY id DESC ;


INSERT INTO TBL_USER
(ID, USER_IDENTIFICATION, USER_PASSWORD, USER_NICKNAME, USER_STATUS, USER_TISSUE, USER_CREATED_DATE, USER_UPDATED_DATE, USER_ROLE)
VALUES(SEQ_USER.NEXTVAL, 'admin1234@naver.com', 'rhkdals12!!!', 'admin1', ('NORMAL') , (0) , SYSDATE, SYSDATE, ('admin'));



SELECT * FROM TBL_PRODUCT_WISH tpw ;




















ALTER TABLE TBL_USER  RENAME COLUMN PROFIL_IMAGE_UUID  TO PROFILE_IMAGE_UUID;

ALTER TABLE TBL_USER  ADD USER_MARKETING VARCHAR(500)  ;
ALTER TABLE TBL_USER  ADD USER_ALARM VARCHAR(500)  ;
ALTER TABLE TBL_USER  ADD PROFIL_IMAGE_PATH VARCHAR2 (500) ;

-- HR.TBL_USER definition

CREATE TABLE "TBL_USER" 
   (	"ID" NUMBER, 
	"USER_IDENTIFICATION" VARCHAR2(1000) NOT NULL ENABLE, 
	"USER_PASSWORD" VARCHAR2(1000) NOT NULL ENABLE, 
	"USER_NICKNAME" VARCHAR2(500) NOT NULL ENABLE, 
	"USER_STATUS" VARCHAR2(1000) DEFAULT ('NORMAL') NOT NULL ENABLE, 
	"USER_TISSUE" NUMBER DEFAULT (0) NOT NULL ENABLE, 
	"USER_CREATED_DATE" DATE DEFAULT SYSDATE, 
	"USER_UPDATED_DATE" DATE DEFAULT SYSDATE, 
	"USER_ROLE" VARCHAR2(500) DEFAULT ('USER') NOT NULL ENABLE, 
	"PROFILE_IMAGE_NAME" VARCHAR2(500), 
	"PROFILE_IMAGE_UUID" VARCHAR2(500), 
	"PROFILE_IMAGE_SIZE" NUMBER, 
	"USER_NAME" VARCHAR2(500), 
	"USER_MARKETING" VARCHAR2(500), 
	"USER_ALARM" VARCHAR2(500), 
	"PROFILE_IMAGE_PATH" VARCHAR2(500), 
	 CONSTRAINT "PK_USER" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 UNIQUE ("USER_IDENTIFICATION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 UNIQUE ("USER_NICKNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

CREATE UNIQUE INDEX "PK_USER" ON "TBL_USER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  CREATE UNIQUE INDEX "SYS_C008053" ON "TBL_USER" ("USER_IDENTIFICATION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  CREATE UNIQUE INDEX "SYS_C008054" ON "TBL_USER" ("USER_NICKNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;