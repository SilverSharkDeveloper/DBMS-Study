CREATE SEQUENCE SEQ_QNA;

-- HR.TBL_QNA definition

CREATE TABLE "TBL_QNA" 
   (	"ID" NUMBER, 
	"USER_ID" NUMBER NOT NULL ENABLE, 
	"QNA_CREATED_DATE" DATE DEFAULT SYSDATE, 
	"QNA_UPDATED_DATE" DATE DEFAULT SYSDATE, 
	"QNA_TITLE" VARCHAR2(500) NOT NULL ENABLE, 
	"QNA_CONTENT" VARCHAR2(500) NOT NULL ENABLE, 
	"QNA_RESPONSED_STATUS" VARCHAR2(500) DEFAULT ('responsing') NOT NULL ENABLE, 
	 CONSTRAINT "PK_QNA" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_QNA_USER" FOREIGN KEY ("USER_ID")
	  REFERENCES "TBL_USER" ("ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

CREATE UNIQUE INDEX "PK_QNA" ON "TBL_QNA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;