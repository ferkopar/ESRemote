--------------------------------------------------------
--  DDL for Table EPI_REL
--------------------------------------------------------

  CREATE TABLE "EPI_REL" 
   (	"EPI_REL_ID" NUMBER(12,0), 
	"EPI_ID1" NUMBER(12,0), 
	"EPI_ID2" NUMBER(12,0), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "EPI_REL"."EPI_REL_ID" IS 'Esemény reláció egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_REL"."EPI_ID1" IS 'Hivatkozó Esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_REL"."EPI_ID2" IS 'Hivatkozott Esemény egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_REL"."REL_TYPE_ID" IS 'Reláció típusa';
 
   COMMENT ON COLUMN "EPI_REL"."ORDER_NO" IS 'Rendezési sorrend';
 
   COMMENT ON COLUMN "EPI_REL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "EPI_REL"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "EPI_REL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "EPI_REL"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "EPI_REL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "EPI_REL"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON TABLE "EPI_REL"  IS 'Események reláció táblája
Code: EPRE';
