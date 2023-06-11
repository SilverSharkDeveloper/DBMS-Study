CREATE SEQUENCE SEQ_PLOGGING_QRCODE;

-- HR.TBL_PLOGGING_QRCODE definition

CREATE TABLE "TBL_PLOGGING_QRCODE" 
   (	"ID" NUMBER, 
	"PLOGGING_ID" NUMBER NOT NULL ENABLE, 
	"PLOGGING_QRCODE_CREATED_DATE" DATE DEFAULT SYSDATE, 
	"PLOGGING_QRCODE_TYPE" VARCHAR2(500) NOT NULL ENABLE, 
	"PLOGGING_QRCODE_NAME" VARCHAR2(500), 
	"PLOGGING_QRCODE_UUID" VARCHAR2(500), 
	"PLOGGING_QRCODE_SIZE" NUMBER, 
	 CONSTRAINT "PK_PLOGGING_QRCODE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_PLOGGING_QRCODE_PLOGGING" FOREIGN KEY ("PLOGGING_ID")
	  REFERENCES "TBL_PLOGGING" ("ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

CREATE UNIQUE INDEX "PK_PLOGGING_QRCODE" ON "TBL_PLOGGING_QRCODE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;