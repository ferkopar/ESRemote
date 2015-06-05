﻿--
-- Script was generated by Devart dbForge Studio for Oracle, Version 3.7.472.0
-- Product home page: http://www.devart.com/dbforge/oracle/studio
-- Script date 2015.03.26. 9:19:55
-- Server version: Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production With the Partitioning, Oracle Label Security, OLAP, Data Mining, Oracle Database Vault and Real Application Testing options
-- Client version: 12.1.0.0
-- Please backup your database before running this script
--

--
-- Drop column "SOPTIONAL" from table "DM_SUPER_TYP"
--
ALTER TABLE DM_SUPER_TYP
  DROP COLUMN SOPTIONAL;

--
-- Drop column "STATUS_ID" from table "DM_SUPER_TYP"
--
ALTER TABLE DM_SUPER_TYP
  DROP COLUMN STATUS_ID;

UPDATE DM_SUPER_TYP SET ROLL_TYPE = NULL;
--
-- Alter column "ROLL_TYPE" on table "DM_SUPER_TYP"
--
ALTER TABLE DM_SUPER_TYP
  MODIFY(ROLL_TYPE NUMBER(1, 0));

UPDATE DM_SUPER_TYP SET ROLL_TYPE = 1;
UPDATE DM_SUPER_TYP SET ROLL_TYPE = 0 where SUPER_TYP_ID < 100000;

--
-- Alter column "GROUND_LEVEL_ID" on table "DM_SUPER_TYP"
--
ALTER TABLE DM_SUPER_TYP
  MODIFY(GROUND_LEVEL_ID NOT NULL);

--
-- Alter column "SUPER_TYPE_NAME" on table "DM_SUPER_TYP"
--
ALTER TABLE DM_SUPER_TYP
  MODIFY(SUPER_TYPE_NAME NOT NULL);

--
-- Alter column "CRU" on table "DM_SUPER_TYP"
--
ALTER TABLE DM_SUPER_TYP
  MODIFY(CRU NOT NULL);

--
-- Alter column "CRD" on table "DM_SUPER_TYP"
--
ALTER TABLE DM_SUPER_TYP
  MODIFY(CRD NOT NULL);

--
-- Alter column "ROLL_TYPE" on table "DM_SUPER_TYP"
--
ALTER TABLE DM_SUPER_TYP
  MODIFY(ROLL_TYPE DEFAULT 0);

DROP TABLE DM_SUPER_TYP_REL;

--
-- Alter column "CRD" on table "SUBJECT"
--
UPDATE SUBJECT SET CRD = SYSDATE;
ALTER TABLE SUBJECT
  MODIFY(CRD NOT NULL);

--
-- Alter column "CRU" on table "SUBJECT"
--
UPDATE SUBJECT SET CRU = 'N/A';
ALTER TABLE SUBJECT
  MODIFY(CRU NOT NULL);

--
-- Alter column "ROLL_TYPE" on table "SUBJECT"
--
UPDATE SUBJECT SET ROLL_TYPE = NULL;
ALTER TABLE SUBJECT
  MODIFY(ROLL_TYPE NUMBER(1, 0) DEFAULT 0);
UPDATE SUBJECT SET ROLL_TYPE = 0;


--
-- Drop check constraint on table "SUBJ_PARAM"
--
ALTER TABLE SUBJ_PARAM
  MODIFY(STATUS_ID NULL);

--
-- Drop column "STATUS_ID" from table "SUBJ_PARAM"
--
ALTER TABLE SUBJ_PARAM
  DROP COLUMN STATUS_ID;

--
-- Alter column "SUBJ_ID" on table "SUBJ_PARAM"
--
ALTER TABLE SUBJ_PARAM
  MODIFY(SUBJ_ID NOT NULL);

--
-- Alter column "PARAM_TYPE_ID" on table "SUBJ_PARAM"
--
ALTER TABLE SUBJ_PARAM
  MODIFY(PARAM_TYPE_ID NOT NULL);

--
-- Alter column "CRU" on table "SUBJ_PARAM"
--
ALTER TABLE SUBJ_PARAM
  MODIFY(CRU NOT NULL);

--
-- Alter column "CRD" on table "SUBJ_PARAM"
--
ALTER TABLE SUBJ_PARAM
  MODIFY(CRD NOT NULL);

--
-- Alter column "ORDER_NO" on table "SUBJ_PARAM"
--
ALTER TABLE SUBJ_PARAM
  MODIFY(ORDER_NO NOT NULL);


--
-- Alter column "REL_TYPE_ID" on table "SUBJ_REL"
--
ALTER TABLE SUBJ_REL
  MODIFY(REL_TYPE_ID NOT NULL);

--
-- Alter column "CRU" on table "SUBJ_REL"
--
ALTER TABLE SUBJ_REL
  MODIFY(CRU NOT NULL);

--
-- Alter column "CRD" on table "SUBJ_REL"
--
ALTER TABLE SUBJ_REL
  MODIFY(CRD NOT NULL);

--
-- Alter column "ROLL_TYPE" on table "SUBJ_REL"
--
ALTER TABLE SUBJ_REL
  MODIFY(ROLL_TYPE NUMBER(1, 0) DEFAULT 0);

--
-- Alter column "CRD" on table "DM_SUBJECT"
--
ALTER TABLE DM_SUBJECT
  MODIFY(CRD NOT NULL);

--
-- Alter column "CRU" on table "DM_SUBJECT"
--
ALTER TABLE DM_SUBJECT
  MODIFY(CRU NOT NULL);

--
-- Create column "FROM_DATE" on table "DM_SUBJECT"
--
ALTER TABLE DM_SUBJECT
  ADD FROM_DATE DATE DEFAULT SYSDATE  NOT NULL;

--
-- Create column "TO_DATE" on table "DM_SUBJECT"
--
ALTER TABLE DM_SUBJECT
  ADD TO_DATE DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS')  NOT NULL;

--
-- Create column "ROLL_TYPE" on table "DM_SUBJECT"
--
ALTER TABLE DM_SUBJECT
  ADD ROLL_TYPE NUMBER(1, 0) DEFAULT 0 NOT NULL;
