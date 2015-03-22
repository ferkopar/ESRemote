--------------------------------------------------------
--  DDL for Table TREATM_REL
--------------------------------------------------------

  CREATE TABLE "TREATM_REL" 
   (	"TREATM_REL_ID" NUMBER(12,0), 
	"TREATM_ID1" NUMBER(12,0), 
	"TREATM_ID2" NUMBER(12,0), 
	"KOD1" VARCHAR2(100 BYTE), 
	"KOD2" VARCHAR2(100 BYTE), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"EXTRA_NEXT_STEP" VARCHAR2(50 BYTE), 
	"EPI_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"TIME_START" DATE, 
	"TIME_END" DATE, 
	"MM_ID" NUMBER(12,0), 
	"FROM_DATE" DATE DEFAULT trunc(sysdate), 
	"TO_DATE" DATE DEFAULT trunc(to_date('2100.01.01','YYYY.MM.DD')), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"GO_ORDER_NO" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "TREATM_REL"."TREATM_REL_ID" IS 'Kezelés tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM_REL"."TREATM_ID1" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM_REL"."TREATM_ID2" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM_REL"."REL_TYPE_ID" IS 'Műveletterv relációk (norma-terv, tervvariáció, terv-kezelés)';
 
   COMMENT ON COLUMN "TREATM_REL"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM_REL"."ORDER_NO" IS 'TREATM_REL_ID-n belüli sorrend';
 
   COMMENT ON COLUMN "TREATM_REL"."TIME_START" IS 'Kezelés (tervezett, tényleges) kezdő időpontja (dátum, óra,perc)';
 
   COMMENT ON COLUMN "TREATM_REL"."TIME_END" IS 'Kezelés (tervezett, tényleges) záró időpontja (dátum, óra,perc)';
 
   COMMENT ON COLUMN "TREATM_REL"."MM_ID" IS 'Kapcsolódó dokumentum';
 
   COMMENT ON COLUMN "TREATM_REL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "TREATM_REL"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM_REL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "TREATM_REL"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "TREATM_REL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "TREATM_REL"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON TABLE "TREATM_REL"  IS 'Kezelések (beavatkozások) Relációja
Code: TRTR';
