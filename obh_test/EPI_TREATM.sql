--------------------------------------------------------
--  DDL for Table EPI_TREATM
--------------------------------------------------------

  CREATE TABLE "EPI_TREATM" 
   (	"EPITREAT_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"TREATM_ID" NUMBER(12,0), 
	"TOOTH" VARCHAR2(30 BYTE), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"CRU" DATE, 
	"CRD" TIMESTAMP (6), 
	"MDU" DATE, 
	"MDD" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "EPI_TREATM"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM"."TREATM_ID" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM"."TOOTH" IS 'Fog';
 
   COMMENT ON COLUMN "EPI_TREATM"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "EPI_TREATM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "EPI_TREATM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "EPI_TREATM"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON TABLE "EPI_TREATM"  IS 'Esemény-Kezelés Kapcsolati tábla
Code:EPTR';
