--------------------------------------------------------
--  DDL for Table TREATM_PARAM
--------------------------------------------------------

  CREATE TABLE "TREATM_PARAM" 
   (	"TREATM_PARAM_ID" NUMBER(12,0), 
	"TREATM_PARAM1_ID" NUMBER(12,0), 
	"TREATM_ID" NUMBER(12,0), 
	"EPI_ID" NUMBER(12,0) DEFAULT 0, 
	"SUBJ_ID" NUMBER(12,0), 
	"SUBJ_TYPE_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"VALUE" VARCHAR2(255 BYTE), 
	"UNIT_TYPE_ID" NUMBER(12,0), 
	"VALUE_TYPE_ID" NUMBER(12,0), 
	"ORDER_NO" NUMBER(4,0), 
	"MM_ID" NUMBER(12,0), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"W_PARAM_TYPE" VARCHAR2(30 BYTE), 
	"FROM_DATE" DATE, 
	"TO_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "TREATM_PARAM"."TREATM_PARAM_ID" IS 'KezelĂ©si paramĂ©terinek egyedi azonosĂ­tĂłja';
 
   COMMENT ON COLUMN "TREATM_PARAM"."TREATM_PARAM1_ID" IS 'KapcsolodĂł treatment param sor (norma, terv- HIVOTT) ';
 
   COMMENT ON COLUMN "TREATM_PARAM"."TREATM_ID" IS 'A kapcsolodĂł KezelĂ©si egyedi azonosĂ­tĂłja';
 
   COMMENT ON COLUMN "TREATM_PARAM"."EPI_ID" IS 'A kapcsolodĂł esemĂ©ny azonosĂ­tĂłja';
 
   COMMENT ON COLUMN "TREATM_PARAM"."SUBJ_ID" IS 'MĹ±velet, norma kiadĂł vagy a kezelĂ©sben rĂ©sztvevĹ‘ dolgozĂł egyedi azonosĂ­tĂłja';
 
   COMMENT ON COLUMN "TREATM_PARAM"."SUBJ_TYPE_ID" IS 'MĹ±velet, norma kiadĂł tĂ­pusa, vagy a kezelĂ©sben rĂ©sztvevĹ‘ dolgozĂł beosztĂˇsa, szakkĂ©pzettsĂ©ge';
 
   COMMENT ON COLUMN "TREATM_PARAM"."PARAM_TYPE_ID" IS 'ParamĂ©ter tĂ­pusĂˇnak azonosĂ­tĂłja';
 
   COMMENT ON COLUMN "TREATM_PARAM"."VALUE" IS 'A megadott paramĂ©ter Ă©rtĂ©ke';
 
   COMMENT ON COLUMN "TREATM_PARAM"."UNIT_TYPE_ID" IS 'A megadott paramĂ©ter mĂ©rtĂ©kegysĂ©ge';
 
   COMMENT ON COLUMN "TREATM_PARAM"."VALUE_TYPE_ID" IS 'ParamĂ©ter Ă©rtĂ©k listĂˇbĂłl';
 
   COMMENT ON COLUMN "TREATM_PARAM"."ORDER_NO" IS 'A rendezĂ©s szerinti sorszĂˇma';
 
   COMMENT ON COLUMN "TREATM_PARAM"."MM_ID" IS 'KapcsolĂłdĂł dokumentum egyedi azonosĂ­tĂłja';
 
   COMMENT ON COLUMN "TREATM_PARAM"."STATUS_ID" IS 'FeldolgozottsĂˇgi Ăˇllapot stĂˇtusz tĂ­pusĂˇnak egyedi azonosĂ­tĂłja';
 
   COMMENT ON COLUMN "TREATM_PARAM"."DESCRIPTION" IS 'LeĂ­rĂˇs';
 
   COMMENT ON COLUMN "TREATM_PARAM"."CRU" IS 'Rekord LĂ©trehozĂłjĂˇnak AzonosĂ­tĂłja';
 
   COMMENT ON COLUMN "TREATM_PARAM"."CRD" IS 'Rekord LĂ©trehozĂˇsĂˇnak idĹ‘pecsĂ©tje';
 
   COMMENT ON COLUMN "TREATM_PARAM"."MDU" IS 'Rekord MĂłdosĂ­tĂłjĂˇnak AzonosĂ­tĂłja';
 
   COMMENT ON COLUMN "TREATM_PARAM"."MDD" IS 'Rekord MĂłdosĂ­tĂˇsĂˇnak IdĹ‘pecsĂ©tje';
 
   COMMENT ON COLUMN "TREATM_PARAM"."W_PARAM_TYPE" IS 'ParamĂ©ter tĂ­pusa szĂ¶veges feltĂ¶ltĂ©shez';
 
   COMMENT ON TABLE "TREATM_PARAM"  IS 'Code: TRPA';
