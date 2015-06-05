--------------------------------------------------------
--  DDL for Table EPI
--------------------------------------------------------

  CREATE TABLE "EPI" 
   (	"EPI_ID" NUMBER(12,0), 
	"EPI_NAME" VARCHAR2(100 BYTE), 
	"EPI_TYPE_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"EPI_VALUE" NUMBER, 
	"EPI_UNIT_TYPE_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"CLASS_TYPE" VARCHAR2(50 BYTE), 
	"CLASS_ID" NUMBER(12,0), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"W_EPI_TYPE" VARCHAR2(30 BYTE) DEFAULT 'Beteg felvétel', 
	"W_STATUS_TYPE" VARCHAR2(30 BYTE) DEFAULT 'Aktív', 
	"W_ERROR" VARCHAR2(255 BYTE), 
	"VALUE_TYPE_ID" NUMBER(12,0) DEFAULT null, 
	"UNIT" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "EPI"."EPI_ID" IS 'Esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI"."EPI_NAME" IS 'Esemény neve';
 
   COMMENT ON COLUMN "EPI"."EPI_TYPE_ID" IS 'Esemény típus nevének egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI"."EPI_VALUE" IS 'Aktuális érték';
 
   COMMENT ON COLUMN "EPI"."EPI_UNIT_TYPE_ID" IS 'Mértékegyég';
 
   COMMENT ON COLUMN "EPI"."ORDER_NO" IS 'Rendezési sorrend';
 
   COMMENT ON COLUMN "EPI"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "EPI"."CLASS_TYPE" IS 'Besorolás neve';
 
   COMMENT ON COLUMN "EPI"."CLASS_ID" IS 'Besorolás egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI"."FROM_DATE" IS 'Érvényesség kezdő időpontja';
 
   COMMENT ON COLUMN "EPI"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "EPI"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "EPI"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "EPI"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "EPI"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "EPI"."UNIT" IS 'Aktuális érték mértékegysége';
 
   COMMENT ON TABLE "EPI"  IS 'Események
Code: EPIS';
