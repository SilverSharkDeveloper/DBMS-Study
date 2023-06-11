CREATE SEQUENCE SEQ_QNA_RESPONSE;

-- HR.TBL_QNA_RESPONSE definition

CREATE TABLE "TBL_QNA_RESPONSE" 
   (	"ID" NUMBER, 
	"ADMIN_ID" NUMBER NOT NULL ENABLE, 
	"QNA_ID" NUMBER NOT NULL ENABLE, 
	"QNA_RESPONSE_CREATED_DATE" DATE DEFAULT SYSDATE, 
	"QNA_RESPONSE_UPDATED_DATE" DATE DEFAULT SYSDATE, 
	"QNA_RESPONSE_CONTENT" VARCHAR2(500) NOT NULL ENABLE, 
	 CONSTRAINT "PK_QNA_RESPONSE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_QNA_RESPONSE_USER" FOREIGN KEY ("ADMIN_ID")
	  REFERENCES "TBL_USER" ("ID") ENABLE, 
	 CONSTRAINT "FK_QNA_RESPONSE_QNA" FOREIGN KEY ("QNA_ID")
	  REFERENCES "TBL_QNA" ("ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

CREATE UNIQUE INDEX "PK_QNA_RESPONSE" ON "TBL_QNA_RESPONSE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;