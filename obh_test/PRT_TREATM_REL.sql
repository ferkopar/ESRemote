--------------------------------------------------------
--  DDL for Table PRT_TREATM_REL
--------------------------------------------------------

  CREATE TABLE "PRT_TREATM_REL" 
   (	"TREATM_REL_ID" NUMBER(12,0), 
	"TREATM_ID1" NUMBER(12,0), 
	"TREATM_ID2" NUMBER(12,0), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
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
 

   COMMENT ON COLUMN "PRT_TREATM_REL"."TREATM_REL_ID" IS 'Kezelés tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."TREATM_ID1" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."TREATM_ID2" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."REL_TYPE_ID" IS 'Reláció típusa';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "PRT_TREATM_REL"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON TABLE "PRT_TREATM_REL"  IS 'Kezelések (beavatkozások) Relációja
Code: PRTR';
