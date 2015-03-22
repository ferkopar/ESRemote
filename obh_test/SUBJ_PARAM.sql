--------------------------------------------------------
--  DDL for Table SUBJ_PARAM
--------------------------------------------------------

  CREATE TABLE "SUBJ_PARAM" 
   (	"SUBJ_PARAM_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255 BYTE), 
	"UNIT_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"MM_ID" NUMBER(12,0), 
	"VALUE_TYPE_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"UNIT" VARCHAR2(50 BYTE), 
	"FROM_CODE" NUMBER(1,0), 
	"GIS_ID" NUMBER(12,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "SUBJ_PARAM"."SUBJ_PARAM_ID" IS 'Tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."SUBJ_ID" IS 'Subjectiv egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."EPI_ID" IS 'Kapcsolódó esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."PARAM_TYPE_ID" IS 'Paraméter típusának azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."VALUE" IS 'Érték';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."UNIT_TYPE_ID" IS 'Mértékegység';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."MM_ID" IS 'Kapcsolódó dokumentum egyedi azonosítója';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."VALUE_TYPE_ID" IS 'Az érték típúsának egyedi azonosítója a DM_SUPER_TYPE táblából';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."ORDER_NO" IS 'Rendezési sorrend azonos EPI-hez';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."UNIT" IS 'Mértékegység';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."FROM_CODE" IS 'Honnan érkezett az adat EPI vagy SUBJ vagy GIS';
 
   COMMENT ON COLUMN "SUBJ_PARAM"."GIS_ID" IS 'GIS_DATA tábla egyedi azonosítója';
 
   COMMENT ON TABLE "SUBJ_PARAM"  IS 'Subjectiv relation
Code:SUPA';
