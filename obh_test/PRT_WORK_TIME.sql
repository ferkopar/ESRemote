--------------------------------------------------------
--  DDL for Table PRT_WORK_TIME
--------------------------------------------------------

  CREATE TABLE "PRT_WORK_TIME" 
   (	"WK_TIME_ID" NUMBER(12,0), 
	"VALID_TYPE_ID" NUMBER(12,0), 
	"FIRST_NAME" VARCHAR2(100 BYTE), 
	"LAST_NAME" VARCHAR2(100 BYTE), 
	"START_TIME" TIMESTAMP (6), 
	"END_TIME" TIMESTAMP (6), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"USER_ID" NUMBER(12,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "PRT_WORK_TIME"."WK_TIME_ID" IS 'Munkaidő tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."VALID_TYPE_ID" IS 'Validációs kódok(Aktív, Inaktív, Archiválandó, Archivált, Törölt)';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."FIRST_NAME" IS 'Kereszt név';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."LAST_NAME" IS 'Család név';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."START_TIME" IS 'Munkaidő kezdete';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."END_TIME" IS 'Munkaidő vége';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."STATUS_ID" IS 'Az adat státuszának, feldolgozottságának egyedi azonosítója';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "PRT_WORK_TIME"."USER_ID" IS 'Felhasználó egyedi azonosítója';
 
   COMMENT ON TABLE "PRT_WORK_TIME"  IS 'Munkaidő nyilvántartás
Code: WKTI';
