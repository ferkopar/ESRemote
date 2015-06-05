--------------------------------------------------------
--  DDL for Table DM_ANALYSIS_TYP
--------------------------------------------------------

  CREATE TABLE "DM_ANALYSIS_TYP" 
   (	"ANALYSIS_TYPE_ID" NUMBER(12,0), 
	"ANALYSIS_TYPE_NAME" VARCHAR2(50 BYTE), 
	"ANALYSIS_GROUP_ID" NUMBER(12,0), 
	"SLEVEL" NUMBER(3,0), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"SOPTIONAL" VARCHAR2(1 BYTE) DEFAULT 'Y', 
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
 

   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."ANALYSIS_TYPE_ID" IS 'Mérés típus egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."ANALYSIS_TYPE_NAME" IS 'Mérés típusának neve';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."ANALYSIS_GROUP_ID" IS 'Mérés típus csoportja';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."SLEVEL" IS 'Mérés típusának hierarciai szintje';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."SOPTIONAL" IS 'Választhatóság Y-Igen N-Nem O-Opcionális';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."FROM_DATE" IS 'Érvényesség kezdő időpontja';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "DM_ANALYSIS_TYP"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_ANALYSIS_TYP"  IS 'Mérési típusok
Code: DMAN';