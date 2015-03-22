--------------------------------------------------------
--  DDL for Table DM_USER
--------------------------------------------------------

  CREATE TABLE "DM_USER" 
   (	"USER_NAME" VARCHAR2(30 BYTE), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"USER_PSWD" VARCHAR2(255 BYTE), 
	"USER_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0) DEFAULT NULL, 
	"LANGUAGE_ID" NUMBER(12,0) DEFAULT 1
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "DM_USER"."USER_NAME" IS 'Apex felhasználó név';
 
   COMMENT ON COLUMN "DM_USER"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_USER"."FROM_DATE" IS 'Érvényesség kezdő időpontja';
 
   COMMENT ON COLUMN "DM_USER"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_USER"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_USER"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "DM_USER"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_USER"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "DM_USER"."STATUS_ID" IS 'Feldolgozottsági állapot státusz típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_USER"."USER_PSWD" IS 'Felhasználó jelszava titkosított oszlop';
 
   COMMENT ON COLUMN "DM_USER"."USER_ID" IS 'Felhasználó egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_USER"."SUBJ_ID" IS 'Subjectiv egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_USER"."LANGUAGE_ID" IS 'A felhasználó alapértemezett nyelvének azonosítója';
 
   COMMENT ON TABLE "DM_USER"  IS 'Felhasználók nyilvántartása
Code: DMUS';
