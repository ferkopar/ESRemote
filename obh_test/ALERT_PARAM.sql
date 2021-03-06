--------------------------------------------------------
--  DDL for Table ALERT_PARAM
--------------------------------------------------------

  CREATE TABLE "ALERT_PARAM" 
   (	"ALERT_PARAM_ID" NUMBER(12,0), 
	"ALERT_ID" NUMBER(12,0), 
	"PARAM_TYPE_ID" NUMBER(12,0), 
	"APEX_PAGE" NUMBER, 
	"APEX_VARIABLE" VARCHAR2(255 BYTE), 
	"VALUE" VARCHAR2(255 BYTE), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"STATUS_ID" NUMBER(12,0) DEFAULT 912, 
	"CRU" VARCHAR2(30 BYTE), 
	"CRD" TIMESTAMP (6), 
	"MDU" VARCHAR2(30 BYTE), 
	"MDD" TIMESTAMP (6), 
	"SUBJ_ID" NUMBER(12,0), 
	"APEX_PAGE_OLD" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645)
  TABLESPACE "USERS" ;
