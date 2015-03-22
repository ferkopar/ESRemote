--------------------------------------------------------
--  DDL for Table PRT_IC_ITEM
--------------------------------------------------------

  CREATE TABLE "PRT_IC_ITEM" 
   (	"IC_ITEM_ID" NUMBER(12,0), 
	"IC_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"IC_VALUE" VARCHAR2(255 BYTE), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"IC_VALUE_TYPE" VARCHAR2(50 BYTE), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "PRT_IC_ITEM"."IC_ITEM_ID" IS 'Interface tétel egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."IC_ID" IS 'Interface tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."ORDER_NO" IS 'Rendezési sorrend
DM_Regulation.Type_Table1 ';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."IC_VALUE" IS 'Érték';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."IC_VALUE_TYPE" IS 'Érték mértékegysége';
 
   COMMENT ON COLUMN "PRT_IC_ITEM"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON TABLE "PRT_IC_ITEM"  IS 'Bejövő adat törzs értékei
Code: PICI';
