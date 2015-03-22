--------------------------------------------------------
--  DDL for Table TREATM
--------------------------------------------------------

  CREATE TABLE "TREATM" 
   (	"TREATM_ID" NUMBER(12,0), 
	"TREATM_NAME" VARCHAR2(255 BYTE), 
	"TREATM_GROUP_ID" NUMBER(12,0), 
	"TREATM_TYPE_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"STATE_START_ID" NUMBER(12,0), 
	"STATE_END_ID" NUMBER(12,0), 
	"TREATM_CATEGORY_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"MM_ID" NUMBER(12,0), 
	"TIME_START" DATE, 
	"TIME_END" DATE, 
	"SUBJ1_ID" NUMBER(12,0), 
	"TYPE1_ID" NUMBER(12,0), 
	"SUBJ2_ID" NUMBER(12,0), 
	"TYPE2_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6), 
	"MDD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"WK_TB_CODE" VARCHAR2(30 BYTE), 
	"WK_COMMENT" NCLOB, 
	"WK_NAME" NCLOB, 
	"DATA_OWNER_ID" NUMBER(12,0), 
	"FROM_DATE" DATE DEFAULT trunc(sysdate), 
	"TO_DATE" DATE DEFAULT trunc(to_date('2099.12.31','YYYY.MM.DD')), 
	"TREATM_NAME_ID" NUMBER(12,0), 
	"KOD" VARCHAR2(100 BYTE), 
	"WK_GROUP_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("WK_COMMENT") STORE AS BASICFILE (
  TABLESPACE "DENT_MDB" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("WK_NAME") STORE AS BASICFILE (
  TABLESPACE "DENT_MDB" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
 

   COMMENT ON COLUMN "TREATM"."TREATM_ID" IS 'Kezelés egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM"."TREATM_NAME" IS 'Kezelés megnevezése';
 
   COMMENT ON COLUMN "TREATM"."TREATM_GROUP_ID" IS 'Mandatory Traetment Id';
 
   COMMENT ON COLUMN "TREATM"."TREATM_TYPE_ID" IS 'Művelet típusa';
 
   COMMENT ON COLUMN "TREATM"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM"."STATE_START_ID" IS 'Induló állapot';
 
   COMMENT ON COLUMN "TREATM"."STATE_END_ID" IS 'Végállapot';
 
   COMMENT ON COLUMN "TREATM"."TREATM_CATEGORY_ID" IS 'A művelet,	anatómiai testrész besorolásának egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM"."MM_ID" IS 'Kapcsolódó dokumentum egyedi azonosítója';
 
   COMMENT ON COLUMN "TREATM"."TIME_START" IS 'A művelet, kezelés (tervezett, tényleges) kezdő időpontja (dátum, óra, perc)';
 
   COMMENT ON COLUMN "TREATM"."TIME_END" IS 'A művelet,	kezelés (tervezett, tényleges) záró időpontja (dátum, óra, perc)';
 
   COMMENT ON COLUMN "TREATM"."SUBJ1_ID" IS 'A beteg';
 
   COMMENT ON COLUMN "TREATM"."TYPE1_ID" IS 'A beteg';
 
   COMMENT ON COLUMN "TREATM"."SUBJ2_ID" IS 'Az orvos';
 
   COMMENT ON COLUMN "TREATM"."TYPE2_ID" IS 'Az orvos';
 
   COMMENT ON COLUMN "TREATM"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "TREATM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "TREATM"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "TREATM"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "TREATM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "TREATM"."DATA_OWNER_ID" IS 'Adatgazda azonosítója.';
 
   COMMENT ON TABLE "TREATM"  IS 'Kezelés 
Code: TRTM';
