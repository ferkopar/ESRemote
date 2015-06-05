--------------------------------------------------------
--  DDL for Table DM_SUPER_TYP
--------------------------------------------------------

  CREATE TABLE "DM_SUPER_TYP" 
   (	"SUPER_TYP_ID" NUMBER(12,0), 
	"GROUP_ID" NUMBER(12,0), 
	"GROUND_LEVEL_ID" NUMBER(12,0), 
	"SUPER_TYPE_NAME" VARCHAR2(255 BYTE), 
	"SUPER_TYPE_SHORT_NAME" VARCHAR2(50 BYTE), 
	"SUPER_GROUP_NAME" VARCHAR2(255 BYTE), 
	"SLEVEL" NUMBER(3,0), 
	"SOPTIONAL" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"WK_CLASS_ID" NUMBER(12,0), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"USE_COMMENT" VARCHAR2(255 BYTE), 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"DATA_OWNER_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"ROLL_TYPE" NUMBER(*,0) DEFAULT 1
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "DM_SUPER_TYP"."SUPER_TYP_ID" IS 'A tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."GROUP_ID" IS 'A típus csoportjának egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."GROUND_LEVEL_ID" IS 'A csoporton belüli szint';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."SUPER_TYPE_NAME" IS 'A típus megnevezése';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."SUPER_TYPE_SHORT_NAME" IS 'A típus rövid neve';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."SUPER_GROUP_NAME" IS 'A típus besorolási csoportjának a neve';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."SLEVEL" IS 'A meghatározó  típusának hierarciai szintje';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."FROM_DATE" IS 'Az adatok érvényességének kezdete';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."TO_DATE" IS 'Az adatok érvényességének vége';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."USE_COMMENT" IS 'Karbantartási jogosultság szintje';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."DATA_OWNER_ID" IS 'Az adatgazda egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_SUPER_TYP"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON TABLE "DM_SUPER_TYP"  IS 'A rendszer müködési típusainak reláció táblája (Table code: DSRT)';
