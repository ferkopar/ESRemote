--------------------------------------------------------
--  DDL for Table SUBJ_REL
--------------------------------------------------------

  CREATE TABLE "SUBJ_REL" 
   (	"SUBJ_REL_ID" NUMBER(12,0), 
	"SUBJ_ID1" NUMBER(12,0), 
	"SUBJ_ID2" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"REL_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"W_REL_TYPE" VARCHAR2(30 BYTE), 
	"EPI_ID" NUMBER(12,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "SUBJ_REL"."SUBJ_REL_ID" IS 'Subjectiv reláció tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJ_REL"."SUBJ_ID1" IS 'Subjectiv reláció Chield azonosítója';
 
   COMMENT ON COLUMN "SUBJ_REL"."SUBJ_ID2" IS 'Subjectiv reláció Parent azonosítója';
 
   COMMENT ON COLUMN "SUBJ_REL"."STATUS_ID" IS 'FAz adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJ_REL"."REL_TYPE_ID" IS 'Reláció típusa';
 
   COMMENT ON COLUMN "SUBJ_REL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "SUBJ_REL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "SUBJ_REL"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "SUBJ_REL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "SUBJ_REL"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "SUBJ_REL"."EPI_ID" IS 'Esemény egyedi azonosítója';
 
   COMMENT ON TABLE "SUBJ_REL"  IS 'Subjectiv relation
Code:SURE';
