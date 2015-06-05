--------------------------------------------------------
--  DDL for Table DM_ROLE
--------------------------------------------------------

  CREATE TABLE "DM_ROLE" 
   (	"ROLE_ID" NUMBER(12,0), 
	"ROLE_NAME" VARCHAR2(50 BYTE), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "DM_ROLE"."ROLE_ID" IS 'Szabály egyedi azonosítója, a tábla egyedi azonosítója 0 teszteléshez 1-9 standerd főcsoportok 10-19 kiemelt csoportok 100-tól minden egyébb';
 
   COMMENT ON COLUMN "DM_ROLE"."ROLE_NAME" IS 'Szabály neve';
 
   COMMENT ON COLUMN "DM_ROLE"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_ROLE"."FROM_DATE" IS 'Érvényesség kezdő időpontja';
 
   COMMENT ON COLUMN "DM_ROLE"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_ROLE"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "DM_ROLE"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "DM_ROLE"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_ROLE"  IS 'Szabály
Code: DMRO';
