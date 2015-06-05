--------------------------------------------------------
--  DDL for Table DM_NAMES
--------------------------------------------------------

  CREATE TABLE "DM_NAMES" 
   (	"NAMES_ID" NUMBER(12,0), 
	"PNAMES" VARCHAR2(50 BYTE), 
	"LANGUAGE_ID" NUMBER(12,0), 
	"SEX" VARCHAR2(1 BYTE), 
	"TAGS" VARCHAR2(50 BYTE), 
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
 

   COMMENT ON COLUMN "DM_NAMES"."NAMES_ID" IS 'Keresztnév tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_NAMES"."PNAMES" IS 'Keresztnév';
 
   COMMENT ON COLUMN "DM_NAMES"."LANGUAGE_ID" IS 'Nyelv egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_NAMES"."SEX" IS 'Neme M_férfi F_nő I_ismeretlen';
 
   COMMENT ON COLUMN "DM_NAMES"."TAGS" IS 'Tag';
 
   COMMENT ON COLUMN "DM_NAMES"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_NAMES"."FROM_DATE" IS 'Érvényesség kezdő időpontja';
 
   COMMENT ON COLUMN "DM_NAMES"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_NAMES"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_NAMES"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "DM_NAMES"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_NAMES"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "DM_NAMES"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_NAMES"  IS 'Kereszt Nevek
Code: DMNA';
