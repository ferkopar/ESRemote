--------------------------------------------------------
--  DDL for Table DM_CATEGORY
--------------------------------------------------------

  CREATE TABLE "DM_CATEGORY" 
   (	"CAT_ID" NUMBER(12,0), 
	"CAT_TYPE" VARCHAR2(30 BYTE), 
	"TYPE_ID" NUMBER(12,0), 
	"TYPE_NAME" VARCHAR2(30 BYTE), 
	"APEX_VARIABLE" VARCHAR2(255 BYTE), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "DM_CATEGORY"."CAT_ID" IS 'Az besorolási kategória tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_CATEGORY"."CAT_TYPE" IS 'A besorolási kategória megnevezése';
 
   COMMENT ON COLUMN "DM_CATEGORY"."TYPE_ID" IS 'Az besorolási kategória tipusának az egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_CATEGORY"."TYPE_NAME" IS 'Az besorolási kategória tipusának a neve';
 
   COMMENT ON COLUMN "DM_CATEGORY"."APEX_VARIABLE" IS 'APEX változó értékének visszaadása';
 
   COMMENT ON COLUMN "DM_CATEGORY"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_CATEGORY"."FROM_DATE" IS 'Az adatok érvényességének kezdete';
 
   COMMENT ON COLUMN "DM_CATEGORY"."TO_DATE" IS 'Az adatok érvényességének vége';
 
   COMMENT ON COLUMN "DM_CATEGORY"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_CATEGORY"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "DM_CATEGORY"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_CATEGORY"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "DM_CATEGORY"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_CATEGORY"  IS 'Categoriák típustáblája';
