--------------------------------------------------------
--  DDL for Table DM_XL
--------------------------------------------------------

  CREATE TABLE "DM_XL" 
   (	"DM_XL_ID" NUMBER(12,0), 
	"LEAD_TYPE_ID" NUMBER(12,0), 
	"W_LEAD_TYPE_NAME" VARCHAR2(255 BYTE), 
	"INC_TYPE_ID" NUMBER(12,0), 
	"W_INC_TYPE_NAME" VARCHAR2(255 BYTE), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"W_PARAM_TYPE_NAME" VARCHAR2(255 BYTE), 
	"PARAM_DATE_TYPE_ID" NUMBER(12,0), 
	"W_PARAM_DATE_TYPE_NAME" VARCHAR2(60 BYTE), 
	"PARAM_UNIT_ID" NUMBER(12,0), 
	"PARAM_UNIT" VARCHAR2(50 BYTE), 
	"LIST_TYPE_ID" NUMBER(12,0), 
	"W_LIST_TYPE_NAME" VARCHAR2(120 BYTE), 
	"REL_TYPE_ID" NUMBER(12,0), 
	"W_REL_TYPE_NAME" VARCHAR2(60 BYTE), 
	"SHEET_NAME" VARCHAR2(60 BYTE), 
	"ORDER_NO" VARCHAR2(60 BYTE), 
	"ORDER_SIGN" VARCHAR2(60 BYTE), 
	"ORDER_REG" VARCHAR2(60 BYTE), 
	"PRINT_TYPE" VARCHAR2(50 BYTE), 
	"PARAM_FDATE" DATE DEFAULT trunc(sysdate), 
	"PARAM_TDATE" DATE DEFAULT trunc(to_date('2099.12.31','YYYY.MM.DD')), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6) DEFAULT SYSDATE, 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"DATA_OWNER_ID" NUMBER(12,0), 
	"PARAM_ADATE_TYPE_ID" NUMBER(12,0), 
	"W_PARAM_ADATE_TYPE_NAME" VARCHAR2(50 BYTE), 
	"PARAM_D1VALUE" NUMBER DEFAULT 0, 
	"PARAM_D2VALUE" NUMBER, 
	"MUTABLE" NUMBER(1,0) DEFAULT 0, 
	"VALUE_TABLE" NVARCHAR2(50) DEFAULT 'SUBECT', 
	"VALUE_PARAM_ID" NUMBER(12,0), 
	"PARAM_DATA_TYPE" CHAR(1 BYTE) DEFAULT 'N'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "DM_XL"."DM_XL_ID" IS 'A tábla egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."LEAD_TYPE_ID" IS 'Irányítás típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."W_LEAD_TYPE_NAME" IS 'Irányítás típusának a neve';
 
   COMMENT ON COLUMN "DM_XL"."INC_TYPE_ID" IS 'Adat beérkezés típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."W_INC_TYPE_NAME" IS 'Adat beérkezés típusának a neve';
 
   COMMENT ON COLUMN "DM_XL"."PARAM_TYPE_ID" IS 'A paraméter típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."W_PARAM_TYPE_NAME" IS 'A paraméter típusának a neve';
 
   COMMENT ON COLUMN "DM_XL"."PARAM_DATE_TYPE_ID" IS 'Az adatra vonatkokzó időszak típusának egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."W_PARAM_DATE_TYPE_NAME" IS 'Az adatra vonatkokzó időszak típusának neve';
 
   COMMENT ON COLUMN "DM_XL"."PARAM_UNIT_ID" IS 'A paraméter mértékegységének egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."PARAM_UNIT" IS 'A paraméter mértékegységének a neve ';
 
   COMMENT ON COLUMN "DM_XL"."LIST_TYPE_ID" IS 'EXCEL SHEET nevének a megfeleltetett egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."W_LIST_TYPE_NAME" IS 'EXCEL SHEET nevének a megfeleltetett név';
 
   COMMENT ON COLUMN "DM_XL"."REL_TYPE_ID" IS 'A reláció művelet egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."W_REL_TYPE_NAME" IS 'A reláció művelet neve';
 
   COMMENT ON COLUMN "DM_XL"."SHEET_NAME" IS 'Az EXCEL SHEET eredeti neve';
 
   COMMENT ON COLUMN "DM_XL"."ORDER_NO" IS 'A táblázatban a sornak vagy oszlopnak adott azonosító sorszáma';
 
   COMMENT ON COLUMN "DM_XL"."ORDER_SIGN" IS 'A EXCEL táblázat sor vagy oszlop MS azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."ORDER_REG" IS ' A sorok illetve oszlopok közötti számítási szabály megjelenő változata';
 
   COMMENT ON COLUMN "DM_XL"."PRINT_TYPE" IS 'A nyomtatás, megjelenítés típusa';
 
   COMMENT ON COLUMN "DM_XL"."PARAM_FDATE" IS 'Érvényesség kezdő időpontja';
 
   COMMENT ON COLUMN "DM_XL"."PARAM_TDATE" IS 'Érvényesség vége';
 
   COMMENT ON COLUMN "DM_XL"."DESCRIPTION" IS 'Leírás';
 
   COMMENT ON COLUMN "DM_XL"."CRU" IS 'Rekord Létrehozójának Azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."CRD" IS 'Rekord Létrehozásának időpecsétje';
 
   COMMENT ON COLUMN "DM_XL"."MDU" IS 'Rekord Módosítójának Azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."MDD" IS 'Rekord Módosításának Időpecsétje';
 
   COMMENT ON COLUMN "DM_XL"."DATA_OWNER_ID" IS 'Az adatgazda egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."PARAM_ADATE_TYPE_ID" IS 'Az adatra vonatkokzó időszak típusa vonatkozási jelzőjének egyedi azonosítója';
 
   COMMENT ON COLUMN "DM_XL"."W_PARAM_ADATE_TYPE_NAME" IS 'Az adatra vonatkokzó időszak típusának vonatkozási jelzője';
 
   COMMENT ON COLUMN "DM_XL"."PARAM_D1VALUE" IS 'A idő intervallum jelzőjének, lépéközének kezdő tényezője';
 
   COMMENT ON COLUMN "DM_XL"."PARAM_D2VALUE" IS 'A idő intervallum jelzőjének, lépéközének végső tényezője';
 
   COMMENT ON COLUMN "DM_XL"."MUTABLE" IS 'Módosítható - e : 0 nem; 1 igen';
 
   COMMENT ON TABLE "DM_XL"  IS 'A Betöltési táblázatok szabályai Code: DMXLS';
