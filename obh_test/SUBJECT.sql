--------------------------------------------------------
--  DDL for Table SUBJECT
--------------------------------------------------------

  CREATE TABLE "SUBJECT" 
   (	"SUBJ_ID" NUMBER(12,0), 
	"SUBJ_NAME" VARCHAR2(255 BYTE), 
	"SUBJ_SHORT_NAME" VARCHAR2(50 BYTE), 
	"OFFICE_ID" NUMBER(12,0), 
	"TYPE_ID" NUMBER(12,0), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"CRD" TIMESTAMP (6), 
	"CRU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"WK_TYPE_NAME" VARCHAR2(100 BYTE), 
	"USER_TYPE_ID" NUMBER(12,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "SUBJECT"."SUBJ_ID" IS 'Subjectiv tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJECT"."SUBJ_NAME" IS 'Az Alany neve';
 
   COMMENT ON COLUMN "SUBJECT"."SUBJ_SHORT_NAME" IS 'A rövid neve a cégeknek, becenév a személyeknél';
 
   COMMENT ON COLUMN "SUBJECT"."OFFICE_ID" IS 'Kapcsolodó hivatal egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJECT"."TYPE_ID" IS 'Az alany típusa';
 
   COMMENT ON COLUMN "SUBJECT"."FROM_DATE" IS 'Érvényesség kezdő időpontja';
 
   COMMENT ON COLUMN "SUBJECT"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "SUBJECT"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "SUBJECT"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "SUBJECT"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "SUBJECT"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "SUBJECT"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "SUBJECT"."WK_TYPE_NAME" IS '';
 
   COMMENT ON COLUMN "SUBJECT"."USER_TYPE_ID" IS 'Felhasználó típus';
 
   COMMENT ON TABLE "SUBJECT"  IS 'Az alanyok (hivatalok) nyilvántartási és hivatkozási táblája (Table code: SUB)';
