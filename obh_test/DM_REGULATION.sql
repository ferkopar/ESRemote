--------------------------------------------------------
--  DDL for Table DM_REGULATION
--------------------------------------------------------

  CREATE TABLE "DM_REGULATION" 
   (	"REGUL_ID" NUMBER(12,0), 
	"REGUL_NAME" VARCHAR2(100 BYTE), 
	"REGUL_TYPE_ID" NUMBER(12,0), 
	"TYPE_TABLE1" VARCHAR2(30 BYTE), 
	"TYPE_TYPE1" VARCHAR2(255 BYTE), 
	"TYPE_VALUE1" VARCHAR2(255 BYTE), 
	"TYPE_COLUMN1" VARCHAR2(30 BYTE), 
	"TYPE_TABLE2" VARCHAR2(30 BYTE), 
	"TYPE_TYPE2" VARCHAR2(255 BYTE), 
	"TYPE_COLUMN2" VARCHAR2(30 BYTE), 
	"APEX_PAGE" NUMBER, 
	"APEX_VARIABLE" VARCHAR2(255 BYTE), 
	"TPRIORITY" NUMBER(*,0), 
	"TOPTIONAL" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"TYPE_VALUE2" VARCHAR2(255 BYTE), 
	"TYPE_TABLE3" VARCHAR2(30 BYTE), 
	"TYPE_TYPE3" VARCHAR2(255 BYTE), 
	"TYPE_VALUE3" VARCHAR2(255 BYTE), 
	"TYPE_COLUMN3" VARCHAR2(30 BYTE), 
	"W_TYPE_NAME3" VARCHAR2(30 BYTE), 
	"W_TYPE_NAME1" VARCHAR2(30 BYTE), 
	"W_TYPE_NAME2" VARCHAR2(30 BYTE), 
	"TYPE_CONTROL1" VARCHAR2(1 BYTE), 
	"TYPE_CONTROL2" VARCHAR2(1 BYTE), 
	"TYPE_CONTROL3" VARCHAR2(1 BYTE), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"ROLE_ID" NUMBER(12,0), 
	"TYPE_TABLE4" VARCHAR2(30 BYTE), 
	"TYPE_COLUMN4" VARCHAR2(30 BYTE), 
	"TYPE_TYPE4" VARCHAR2(255 BYTE), 
	"TYPE_VALUE4" VARCHAR2(255 BYTE), 
	"TYPE_CONTROL4" VARCHAR2(1 BYTE), 
	"MM_ID" NUMBER(12,0), 
	"TCRITERION" VARCHAR2(4000 BYTE), 
	"W_ERROR" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "DM_REGULATION"."REGUL_ID" IS 'Szabály egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_REGULATION"."REGUL_NAME" IS 'Szabály neve';
 
   COMMENT ON COLUMN "DM_REGULATION"."REGUL_TYPE_ID" IS 'Szabály típusa';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TABLE1" IS 'Szabályban vizsgálandó tábla neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TYPE1" IS 'Szabályban vizsgálandó típus';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_VALUE1" IS 'Szabályban vizsgálandó típus értéke';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_COLUMN1" IS 'Szabályban vizsgálandó oszlop neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TABLE2" IS 'Szabályban vizsgálandó tábla neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TYPE2" IS 'Szabályban vizsgálandó típus';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_COLUMN2" IS 'Szabályban vizsgálandó oszlop neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."APEX_PAGE" IS 'Apex oldal';
 
   COMMENT ON COLUMN "DM_REGULATION"."APEX_VARIABLE" IS 'APEX változó értékének visszaadása';
 
   COMMENT ON COLUMN "DM_REGULATION"."TPRIORITY" IS 'Prioritás';
 
   COMMENT ON COLUMN "DM_REGULATION"."TOPTIONAL" IS 'Választhatóság Y-Igen N-Nem O-Opcionális';
 
   COMMENT ON COLUMN "DM_REGULATION"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_REGULATION"."FROM_DATE" IS 'Érvényesség kezdő időpontja';
 
   COMMENT ON COLUMN "DM_REGULATION"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_REGULATION"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_REGULATION"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "DM_REGULATION"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_REGULATION"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_VALUE2" IS 'Szabályban vizsgálandó típus értéke';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TABLE3" IS 'Szabályban vizsgálandó tábla neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TYPE3" IS 'Szabályban vizsgálandó típus';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_VALUE3" IS 'Szabályban vizsgálandó típus értéke';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_COLUMN3" IS 'Szabályban vizsgálandó oszlop neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_CONTROL1" IS 'Szabályban vizsgálandó control  ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_CONTROL2" IS 'Szabályban vizsgálandó control  ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_CONTROL3" IS 'Szabályban vizsgálandó control  ';
 
   COMMENT ON COLUMN "DM_REGULATION"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_REGULATION"."ROLE_ID" IS 'Szabály egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TABLE4" IS 'Szabályban vizsgálandó tábla neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_COLUMN4" IS 'Szabályban vizsgálandó oszlop neve ';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_TYPE4" IS 'Szabályban vizsgálandó típus';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_VALUE4" IS 'Szabályban vizsgálandó típus értéke';
 
   COMMENT ON COLUMN "DM_REGULATION"."TYPE_CONTROL4" IS 'Szabályban vizsgálandó control  ';
 
   COMMENT ON COLUMN "DM_REGULATION"."MM_ID" IS 'Kapcsolódó dokumentum egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_REGULATION"."TCRITERION" IS 'Kritérium, szabály leírása';
 
   COMMENT ON TABLE "DM_REGULATION"  IS 'Szabály rendszert leiró tábla
Code: DMRG';
