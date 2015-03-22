--------------------------------------------------------
--  DDL for Table INVENT
--------------------------------------------------------

  CREATE TABLE "INVENT" 
   (	"INVENT_ID" NUMBER(12,0), 
	"SUBJ_ID" NUMBER(12,0), 
	"GIS_ID" NUMBER(12,0), 
	"INVENT_TYPE_ID" NUMBER(12,0), 
	"MOVE_VALUE" NUMBER, 
	"RESERV_VALUE" NUMBER, 
	"INVENT_VALUE" NUMBER, 
	"UNIT_TYPE_ID" NUMBER(12,0), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"ORDER_VALUE" VARCHAR2(255 BYTE), 
	"INVENT_NAME" VARCHAR2(2000 BYTE), 
	"UNIT" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "INVENT"."INVENT_ID" IS 'Anyag eszköz leltár készltet tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "INVENT"."SUBJ_ID" IS 'Subjectiv egyedi azonosítója';
 
   COMMENT ON COLUMN "INVENT"."GIS_ID" IS 'Térinformatika egyedi azonosítója';
 
   COMMENT ON COLUMN "INVENT"."INVENT_TYPE_ID" IS 'Riasztás típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "INVENT"."MOVE_VALUE" IS 'Mozgás mértéke plusz ha bevétel minus ha fogyás';
 
   COMMENT ON COLUMN "INVENT"."RESERV_VALUE" IS 'Foglalt készlet';
 
   COMMENT ON COLUMN "INVENT"."INVENT_VALUE" IS 'Aktuális leltár készlet értéke';
 
   COMMENT ON COLUMN "INVENT"."UNIT_TYPE_ID" IS 'A készlet mértékegysége';
 
   COMMENT ON COLUMN "INVENT"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "INVENT"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "INVENT"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "INVENT"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "INVENT"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "INVENT"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "INVENT"."ORDER_VALUE" IS 'A rendekés mennyisége';
 
   COMMENT ON COLUMN "INVENT"."INVENT_NAME" IS 'Anyag eszköz leltár készltet megnevezése';
 
   COMMENT ON COLUMN "INVENT"."UNIT" IS 'Mértékegység';
 
   COMMENT ON TABLE "INVENT"  IS 'Anyag eszköz leltár készltet
Code:EPIV';
