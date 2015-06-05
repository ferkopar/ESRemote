--------------------------------------------------------
--  DDL for Table DM_ROLE_USER
--------------------------------------------------------

  CREATE TABLE "DM_ROLE_USER" 
   (	"ROLE_USER_ID" NUMBER(12,0), 
	"USER_ID" NUMBER(12,0), 
	"ROLE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"SUBJ_ID" NUMBER(12,0), 
	"SIGN" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"DATA_OWNER_ID" NUMBER(12,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "DM_ROLE_USER"."ROLE_USER_ID" IS 'Tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."USER_ID" IS 'Felhasználó egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."ROLE_ID" IS 'A kapcsolodó szabály egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."FROM_DATE" IS 'Érvényesség kezdő időpontja';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."SUBJ_ID" IS 'A szervezet egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_ROLE_USER"."DATA_OWNER_ID" IS 'Az adatgazda egyedi azonosítója';
 
   COMMENT ON TABLE "DM_ROLE_USER"  IS 'Szerepkörök hierarchiája Code: DMRU';
