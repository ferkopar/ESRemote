--------------------------------------------------------
--  DDL for Table ALERT
--------------------------------------------------------

  CREATE TABLE "ALERT" 
   (	"ALERT_ID" NUMBER(12,0), 
	"ALERT_TYPE_ID" NUMBER(12,0), 
	"MESSAGE_ID" NUMBER(12,0), 
	"ALERT_STATUS" VARCHAR2(2 BYTE), 
	"EPI_ID" NUMBER(12,0), 
	"U_COMMENT" VARCHAR2(255 BYTE), 
	"TO_DATE" DATE, 
	"PRIORITY" NUMBER(1,0), 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"SUBJ_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"SUBJ_TYPE_ID" NUMBER(12,0), 
	"OFFICE_ID" NUMBER(12,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "ALERT"."ALERT_ID" IS 'Riasztás egyedi azonosítója';
 
   COMMENT ON COLUMN "ALERT"."ALERT_TYPE_ID" IS 'Riasztás típusa';
 
   COMMENT ON COLUMN "ALERT"."MESSAGE_ID" IS 'Üzenet egyedi azonosítója';
 
   COMMENT ON COLUMN "ALERT"."ALERT_STATUS" IS 'Riasztás státusza';
 
   COMMENT ON COLUMN "ALERT"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "ALERT"."U_COMMENT" IS 'Megjegzés az üzenethez';
 
   COMMENT ON COLUMN "ALERT"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "ALERT"."PRIORITY" IS 'Fontossága a riasztásnak';
 
   COMMENT ON COLUMN "ALERT"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "ALERT"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "ALERT"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "ALERT"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "ALERT"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "ALERT"."SUBJ_ID" IS 'A cimzett user';
 
   COMMENT ON COLUMN "ALERT"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "ALERT"."SUBJ_TYPE_ID" IS 'A címzett csoport, csak ha a SUBJ_ID üres';
 
   COMMENT ON COLUMN "ALERT"."OFFICE_ID" IS 'A címzett hivatal, csak ha a SUBJ_ID üres';
 
   COMMENT ON TABLE "ALERT"  IS 'Riasztás
Code: ALRT';
