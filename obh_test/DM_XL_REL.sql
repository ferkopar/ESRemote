--------------------------------------------------------
--  DDL for Table DM_XL_REL
--------------------------------------------------------

  CREATE TABLE "DM_XL_REL" 
   (	"DM_XL_REL_ID" NUMBER(12,0), 
	"DM_XL_ID1" NUMBER(12,0), 
	"DM_XL_ID2" NUMBER(12,0), 
	"DM_XL_ID3" NUMBER(12,0) DEFAULT null, 
	"REL_TYPE_ID" NUMBER(12,0), 
	"W_REL_TYPE_NAME" VARCHAR2(50 BYTE), 
	"MATHOP" VARCHAR2(50 BYTE), 
	"CONNUM" NUMBER(12,2) DEFAULT 1, 
	"W_ORDER_NO1" NUMBER(4,0), 
	"W_ORDER_NO2" NUMBER(4,0), 
	"W_ORDER_REG" VARCHAR2(50 BYTE), 
	"W_ORDER_NO3" NUMBER(4,0), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE, 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "DM_XL_REL"."DM_XL_REL_ID" IS 'A tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_XL_REL"."DM_XL_ID1" IS 'A hivó azonosítója (chield) tényező ';
 
   COMMENT ON COLUMN "DM_XL_REL"."DM_XL_ID2" IS 'A hivott azonosító (parent) tényező';
 
   COMMENT ON COLUMN "DM_XL_REL"."DM_XL_ID3" IS 'Az eredmény azonosítója';
 
   COMMENT ON COLUMN "DM_XL_REL"."REL_TYPE_ID" IS 'Reláció típusa';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_REL_TYPE_NAME" IS 'A reláció megnevezése szövegesen';
 
   COMMENT ON COLUMN "DM_XL_REL"."MATHOP" IS 'Matematikai operátor';
 
   COMMENT ON COLUMN "DM_XL_REL"."CONNUM" IS 'A szorzó szám értéke (alapértelmezetten 1)';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_ORDER_NO1" IS 'Az ID1 sorrendjének sorszáma';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_ORDER_NO2" IS 'Az ID2 sorrendjének sorszáma';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_ORDER_REG" IS 'Az összegzés (számolás) menete';
 
   COMMENT ON COLUMN "DM_XL_REL"."W_ORDER_NO3" IS 'Az ID3 sorrendjének sorszáma';
 
   COMMENT ON COLUMN "DM_XL_REL"."FROM_DATE" IS 'Érvényesség kezdő időpontja';
 
   COMMENT ON COLUMN "DM_XL_REL"."TO_DATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_XL_REL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_XL_REL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_XL_REL"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "DM_XL_REL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_XL_REL"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON TABLE "DM_XL_REL"  IS 'A betöltési szabályok relációs, műveleti szabályok relációja';
