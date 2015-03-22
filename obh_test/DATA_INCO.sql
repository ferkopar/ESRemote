--------------------------------------------------------
--  DDL for Table DATA_INCO
--------------------------------------------------------

  CREATE TABLE "DATA_INCO" 
   (	"DATA_INCO_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"MM_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"INC_TYPE_ID" NUMBER(12,0) DEFAULT 20201, 
	"LIST_TYPE_ID" NUMBER(12,0), 
	"DATA_OWNER_ID" NUMBER(12,0), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"PARAM_FDATE" DATE, 
	"PARAM_TDATE" DATE, 
	"STATUS_LEVEL" NUMBER(*,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "DATA_INCO"."DATA_INCO_ID" IS 'A tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DATA_INCO"."SUBJ_ID" IS 'Az adatküldő egyedi azonosítója';
 
   COMMENT ON COLUMN "DATA_INCO"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "DATA_INCO"."MM_ID" IS 'Az adatfile egyedi azonosítója';
 
   COMMENT ON COLUMN "DATA_INCO"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DATA_INCO"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DATA_INCO"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "DATA_INCO"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DATA_INCO"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "DATA_INCO"."INC_TYPE_ID" IS 'Az adat forrás file tipusának egyedi azonosítója';
 
   COMMENT ON COLUMN "DATA_INCO"."LIST_TYPE_ID" IS 'A jelentés típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "DATA_INCO"."DATA_OWNER_ID" IS 'Az adatgazda egyedi azonosítója';
 
   COMMENT ON COLUMN "DATA_INCO"."FROM_DATE" IS 'Az adatok érvényességének kezdete (mikor tól érvényes) ';
 
   COMMENT ON COLUMN "DATA_INCO"."TO_DATE" IS 'Érvényesség vége (akkor zárjuk ha 919-es lesz a státusza kérdés kell-e?';
 
   COMMENT ON COLUMN "DATA_INCO"."PARAM_FDATE" IS 'Jelentési időszak kezdete';
 
   COMMENT ON COLUMN "DATA_INCO"."PARAM_TDATE" IS 'Jelentési időszak vége';
 
   COMMENT ON COLUMN "DATA_INCO"."STATUS_LEVEL" IS 'Az müveletsor indításához szükséges feltételek számának NEGATIV';
 
   COMMENT ON TABLE "DATA_INCO"  IS 'Adatok beérkezésének naplozó táblája
Code: ADBE';
