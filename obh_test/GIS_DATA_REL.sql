--------------------------------------------------------
--  DDL for Table GIS_DATA_REL
--------------------------------------------------------

  CREATE TABLE "GIS_DATA_REL" 
   (	"GIS_REL_ID" NUMBER(12,0), 
	"GIS_ID1" NUMBER(12,0), 
	"GIS_ID2" NUMBER(12,0), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "GIS_DATA_REL"."GIS_REL_ID" IS 'Térinformatika objektum relációjának egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."GIS_ID1" IS 'Hivatkozott Térinformatikai objektum egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."GIS_ID2" IS 'Hivatkozó Térinformatikai objektum egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."REL_TYPE_ID" IS 'Reláció típusa';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "GIS_DATA_REL"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON TABLE "GIS_DATA_REL"  IS 'Code: GDRE';
