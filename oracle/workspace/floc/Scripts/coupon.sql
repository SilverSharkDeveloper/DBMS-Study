CREATE SEQUENCE SEQ_COUPON;
  
ALTER  TABLE TBL_COUPON ADD COUPON_QRCODE_PATH VARCHAR2 (500);

CREATE TABLE "HR"."TBL_COUPON" 
   (	"ID" NUMBER, 
	"USER_ID" NUMBER NOT NULL ENABLE, 
	"PRODUCT_ID" NUMBER NOT NULL ENABLE, 
	"COUPON_CREATED_DATE" DATE DEFAULT SYSDATE, 
	"COUPON_USED_DATE" DATE, 
	"COUPON_STATUS" VARCHAR2(500) DEFAULT ('VALID') NOT NULL ENABLE, 
	"COUPON_QRCODE_PATH" VARCHAR2(500), 
	 CONSTRAINT "PK_COUPON" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_COUPON_USER" FOREIGN KEY ("USER_ID")
	  REFERENCES "HR"."TBL_USER" ("ID") ENABLE, 
	 CONSTRAINT "FK_COUPON_PRODUCT" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "HR"."TBL_PRODUCT" ("ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  
  SELECT * FROM TBL_COUPON tc ;
  
  