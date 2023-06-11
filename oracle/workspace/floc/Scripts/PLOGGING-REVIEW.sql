CREATE SEQUENCE SEQ_PLOGGING_REVIEW;

-- HR.TBL_PLOGGING_REVIEW definition

CREATE TABLE "TBL_PLOGGING_REVIEW" 
   (	"ID" NUMBER, 
	"USER_ID" NUMBER NOT NULL ENABLE, 
	"PLOGGING_ID" NUMBER NOT NULL ENABLE, 
	"REVIEW_TITLE" VARCHAR2(500) NOT NULL ENABLE, 
	"REVIEW_CONTENT" VARCHAR2(500) NOT NULL ENABLE, 
	"REVIEW_REGISTER_DATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"REVIEW_UPDATED_DATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	 CONSTRAINT "PK_PLOGGING_REVIEW" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_PLOGGING_REVIEW_USER" FOREIGN KEY ("USER_ID")
	  REFERENCES "TBL_USER" ("ID") ENABLE, 
	 CONSTRAINT "FK_PLOGGING_REVIEW_PLOGGING" FOREIGN KEY ("PLOGGING_ID")
	  REFERENCES "TBL_PLOGGING" ("ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

CREATE UNIQUE INDEX "PK_PLOGGING_REVIEW" ON "TBL_PLOGGING_REVIEW" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;