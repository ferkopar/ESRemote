﻿--
-- Drop column "EPI_ID" from table "SUBJ_PARAM"
--
ALTER TABLE SUBJ_PARAM
  DROP COLUMN EPI_ID;

ALTER TABLE SUBJ_PARAM
  DROP COLUMN FROM_CODE;

--
-- Create column "FROM_DATE" on table "SUBJ_PARAM"
--
ALTER TABLE SUBJ_PARAM
  ADD FROM_DATE DATE DEFAULT SYSDATE NOT NULL;


--
-- Create column "TO_DATE" on table "SUBJ_PARAM"
--
ALTER TABLE SUBJ_PARAM
  ADD TO_DATE DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS') NOT NULL;


--
-- Drop column "EPI_ID" from table "SUBJ_REL"
--
ALTER TABLE SUBJ_REL
  DROP COLUMN EPI_ID;

--
-- Create column "FROM_DATE" on table "SUBJ_REL"
--
ALTER TABLE SUBJ_REL
  ADD FROM_DATE DATE DEFAULT SYSDATE NOT NULL;


--
-- Create column "ROLL_TYPE" on table "SUBJ_REL"
--
ALTER TABLE SUBJ_REL
  ADD ROLL_TYPE NUMBER(*, 0) DEFAULT 1;

--
-- Create column "TO_DATE" on table "SUBJ_REL"
--
ALTER TABLE SUBJ_REL
  ADD TO_DATE DATE DEFAULT TO_DATE('2099.12.31. 23:59:59','YYYY.MM.DD. HH24:MI:SS') NOT NULL;

--
-- Create column "ROLL_TYPE" on table "SUBJ_REL"
--
ALTER TABLE SUBJ_REL
  ADD ROLL_TYPE NUMBER(*, 0) DEFAULT 1;

CREATE TABLE DM_SUBJECT (
  DM_SUBJECT_ID NUMBER(12, 0) NOT NULL,
  SUBJ_TYPE_ID NUMBER(12, 0) NOT NULL,
  SUBJ_PARAM_TYPE_ID  NUMBER(12, 0) NOT NULL,
  MANDATORY  NUMBER(1, 0) default 0 not null,
  MULTIPLY   NUMBER(1, 0) default 0 not null,
  DESCRIPTION VARCHAR2(255 BYTE),
  CRD TIMESTAMP(6),
  CRU VARCHAR2(30 BYTE),
  MDD TIMESTAMP(6),
  MDU VARCHAR2(30 BYTE),
  CONSTRAINT PK_DM_SUBJECT UNIQUE (DM_SUBJECT_ID) 
);

CREATE TRIGGER TRG_DM_SUBJECT
BEFORE INSERT OR UPDATE ON DM_SUBJECT FOR EACH ROW
BEGIN
  IF INSERTING
  THEN
    IF :new.DM_SUBJECT_ID IS NULL OR :new.DM_SUBJECT_ID = 0
    THEN
SELECT SEQ_BASE.NEXTVAL
  INTO :NEW.DM_SUBJECT_ID
  FROM DUAL;
END IF;
    :new.CRD := SYSTIMESTAMP;
      --LÉTREHOZÁS IDŐPONTJA
    :NEW.CRU := NVL(V('APP_USER'), USER);
 --APEX USER AKI LÉTREHOZZA A REKORDOT
  ELSIF UPDATING
  THEN
    :new.MDD := SYSTIMESTAMP;
      --MÓDOSÍTÁS IDŐPONTJA
    :NEW.MDU := NVL(V('APP_USER'), USER);
 --APEX USER AKI MÓDOSÍT
  END IF;
END;




