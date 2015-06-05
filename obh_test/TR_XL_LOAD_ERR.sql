--------------------------------------------------------
--  DDL for Table TR_XL_LOAD_ERR
--------------------------------------------------------

  CREATE TABLE "TR_XL_LOAD_ERR" 
   (	"TR_XL_ID" NUMBER(12,0), 
	"LIST_TYPE_ID" NUMBER(12,0), 
	"PARAM_STATUS_TYPE_ID" NUMBER(12,0), 
	"PARAM_DATE" VARCHAR2(255 BYTE), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"PARAM_VALUE_ERR" VARCHAR2(4000 BYTE), 
	"PARAM_UNIT" VARCHAR2(50 BYTE), 
	"SUBJ_ID" NUMBER(12,0), 
	"COLUMN_NO" NUMBER(3,0), 
	"CONTROL_VALUE" NUMBER(15,2), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"DATA_INCO_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CONTROL_COL_VALUE" NUMBER(15,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."TR_XL_ID" IS 'Az adatbetöltési rekord egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."LIST_TYPE_ID" IS 'A lista tipus egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."PARAM_DATE" IS 'A vizsgált időszak';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."PARAM_TYPE_ID" IS 'Paraméter típusának azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."PARAM_VALUE_ERR" IS 'Paraméter hibás értéke ';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."PARAM_UNIT" IS 'A megadott, beolvasott érték mértékegysége';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."SUBJ_ID" IS 'Subjectiv egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."COLUMN_NO" IS 'Az excell file melyik oszlopából jött az érték';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."CONTROL_VALUE" IS 'A beolvasott adat paraméterének helyessen számított értéke';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."DATA_INCO_ID" IS 'A beérkezés egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL_LOAD_ERR"."CONTROL_COL_VALUE" IS 'Az oszlopok számított kontroll-számított értéke';
