--------------------------------------------------------
--  DDL for Table TR_XL
--------------------------------------------------------

  CREATE TABLE "TR_XL" 
   (	"TR_XL_ID" NUMBER(12,0), 
	"DATA_INCO_ID" NUMBER(12,0), 
	"LIST_TYPE_ID" NUMBER(12,0), 
	"COL_DM_XL_ID" NUMBER(12,0), 
	"ROW_DM_XL_ID" NUMBER(12,0), 
	"COLUMN_NO" NUMBER(3,0), 
	"ORDER_NO" NUMBER(4,0), 
	"COLUMN_DATA_TYPE_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"PARAM_VALUE" NUMBER(15,2), 
	"PARAM_VALUE_CHR" VARCHAR2(255 BYTE), 
	"PARAM_UNIT" VARCHAR2(50 BYTE), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"SUBJ_ID" NUMBER(12,0), 
	"CONTROL_VALUE" NUMBER(15,2), 
	"DESCRIPTION" VARCHAR2(250 BYTE), 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"CONTROL_COL_VALUE" NUMBER(15,2), 
	"PARAM_DATE_TYPE_ID" NUMBER(12,0), 
	"PARAM_ADATE_TYPE_ID" NUMBER(12,0), 
	"W_PARAM_DATE_TYPE_NAME" VARCHAR2(30 BYTE), 
	"W_PARAM_ADATE_TYPE_NAME" VARCHAR2(30 BYTE), 
	"PARAM_FDATE" DATE, 
	"PARAM_TDATE" DATE, 
	"PARAM_DATE" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "TR_XL"."TR_XL_ID" IS 'A tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL"."DATA_INCO_ID" IS 'Az adat beérkezésének, betöltését regisztrálásáank egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL"."LIST_TYPE_ID" IS 'A lista tipus egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL"."COLUMN_NO" IS 'Az excell file melyik oszlopából jött az érték';
 
   COMMENT ON COLUMN "TR_XL"."ORDER_NO" IS 'Az sorrend';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_TYPE_ID" IS 'A paraméter típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_VALUE" IS 'A megadott, beolvasott érték';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_UNIT" IS 'A megadott, beolvasott érték mértékegysége';
 
   COMMENT ON COLUMN "TR_XL"."STATUS_ID" IS 'Az adat státuszának egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL"."SUBJ_ID" IS 'Az adatra vonatkozó személy-cég egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL"."CONTROL_VALUE" IS 'A beolvasott adat paraméterének helyessen számított értéke';
 
   COMMENT ON COLUMN "TR_XL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "TR_XL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "TR_XL"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "TR_XL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "TR_XL"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "TR_XL"."CONTROL_COL_VALUE" IS 'Az oszlopok számított kontroll-számított értéke';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_DATE_TYPE_ID" IS 'Az adatra vonatkokzó időszak típusának 
egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_ADATE_TYPE_ID" IS 'Az adatra vonatkokzó időszak típusa 
vonatkozási jelzőjének egyedi azonosítója';
 
   COMMENT ON COLUMN "TR_XL"."W_PARAM_DATE_TYPE_NAME" IS 'Az adatra vonatkokzó időszak 
típusának neve';
 
   COMMENT ON COLUMN "TR_XL"."W_PARAM_ADATE_TYPE_NAME" IS 'Az adatra vonatkokzó időszak 
típusának vonatkozási jelzője';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_FDATE" IS 'Az oszlop  időintervallum kezdete';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_TDATE" IS 'Az oszlop  időintervallum vége';
 
   COMMENT ON COLUMN "TR_XL"."PARAM_DATE" IS 'A vizsgált időszak';
