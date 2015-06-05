--------------------------------------------------------
--  DDL for Trigger LTRG_GIS_SUBJ_EPI_REL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LTRG_GIS_SUBJ_EPI_REL" 
AFTER INSERT OR UPDATE OR DELETE ON AMNIS.GIS_SUBJ_EPI_REL FOR EACH ROW
DECLARE
BEGIN
BEGIN
DECLARE
V_TNAME VARCHAR2(30) := 'GIS_SUBJ_EPI_REL';
VALUE_EX EXCEPTION;
INSERT_EXC EXCEPTION;
BEGIN
IF updating THEN
BEGIN
IF   (:new.REL_ID IS NULL AND :old.REL_ID IS NOT NULL)
  OR (:new.REL_ID IS NOT NULL AND :old.REL_ID IS NULL)
  OR (:new.REL_ID != :old.REL_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REL_ID,'U',admin_pkg.apex_user,
'REL_ID',:old.REL_ID,:new.REL_ID,v('EPI_ID') );
END IF;
IF   (:new.REL_TYPE_ID IS NULL AND :old.REL_TYPE_ID IS NOT NULL)
  OR (:new.REL_TYPE_ID IS NOT NULL AND :old.REL_TYPE_ID IS NULL)
  OR (:new.REL_TYPE_ID != :old.REL_TYPE_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REL_ID,'U',admin_pkg.apex_user,
'REL_TYPE_ID',:old.REL_TYPE_ID,:new.REL_TYPE_ID,v('EPI_ID') );
END IF;
IF   (:new.GIS_ID IS NULL AND :old.GIS_ID IS NOT NULL)
  OR (:new.GIS_ID IS NOT NULL AND :old.GIS_ID IS NULL)
  OR (:new.GIS_ID != :old.GIS_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REL_ID,'U',admin_pkg.apex_user,
'GIS_ID',:old.GIS_ID,:new.GIS_ID,v('EPI_ID') );
END IF;
IF   (:new.SUBJ_ID IS NULL AND :old.SUBJ_ID IS NOT NULL)
  OR (:new.SUBJ_ID IS NOT NULL AND :old.SUBJ_ID IS NULL)
  OR (:new.SUBJ_ID != :old.SUBJ_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REL_ID,'U',admin_pkg.apex_user,
'SUBJ_ID',:old.SUBJ_ID,:new.SUBJ_ID,v('EPI_ID') );
END IF;
IF   (:new.EPI_ID IS NULL AND :old.EPI_ID IS NOT NULL)
  OR (:new.EPI_ID IS NOT NULL AND :old.EPI_ID IS NULL)
  OR (:new.EPI_ID != :old.EPI_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REL_ID,'U',admin_pkg.apex_user,
'EPI_ID',:old.EPI_ID,:new.EPI_ID,v('EPI_ID') );
END IF;
IF   (:new.DESCRIPTION IS NULL AND :old.DESCRIPTION IS NOT NULL)
  OR (:new.DESCRIPTION IS NOT NULL AND :old.DESCRIPTION IS NULL)
  OR (:new.DESCRIPTION != :old.DESCRIPTION) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REL_ID,'U',admin_pkg.apex_user,
'DESCRIPTION',:old.DESCRIPTION,:new.DESCRIPTION,v('EPI_ID') );
END IF;
IF   (:new.CRU IS NULL AND :old.CRU IS NOT NULL)
  OR (:new.CRU IS NOT NULL AND :old.CRU IS NULL)
  OR (:new.CRU != :old.CRU) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REL_ID,'U',admin_pkg.apex_user,
'CRU',:old.CRU,:new.CRU,v('EPI_ID') );
END IF;
IF   (:new.MDU IS NULL AND :old.MDU IS NOT NULL)
  OR (:new.MDU IS NOT NULL AND :old.MDU IS NULL)
  OR (:new.MDU != :old.MDU) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REL_ID,'U',admin_pkg.apex_user,
'MDU',:old.MDU,:new.MDU,v('EPI_ID') );
END IF;
IF   (:new.W_REL_TYPE IS NULL AND :old.W_REL_TYPE IS NOT NULL)
  OR (:new.W_REL_TYPE IS NOT NULL AND :old.W_REL_TYPE IS NULL)
  OR (:new.W_REL_TYPE != :old.W_REL_TYPE) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REL_ID,'U',admin_pkg.apex_user,
'W_REL_TYPE',:old.W_REL_TYPE,:new.W_REL_TYPE,v('EPI_ID') );
END IF;
IF   (:new.STATUS_ID IS NULL AND :old.STATUS_ID IS NOT NULL)
  OR (:new.STATUS_ID IS NOT NULL AND :old.STATUS_ID IS NULL)
  OR (:new.STATUS_ID != :old.STATUS_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REL_ID,'U',admin_pkg.apex_user,
'STATUS_ID',:old.STATUS_ID,:new.STATUS_ID,v('EPI_ID') );
END IF;
EXCEPTION
WHEN VALUE_ERROR THEN RAISE VALUE_EX;
WHEN OTHERS THEN RAISE INSERT_EXC;
END;
END IF;
IF deleting THEN
BEGIN
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REL_ID,'D',admin_pkg.apex_user,
'REL_ID',:old.REL_ID,:new.REL_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REL_ID,'D',admin_pkg.apex_user,
'REL_TYPE_ID',:old.REL_TYPE_ID,:new.REL_TYPE_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REL_ID,'D',admin_pkg.apex_user,
'GIS_ID',:old.GIS_ID,:new.GIS_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REL_ID,'D',admin_pkg.apex_user,
'SUBJ_ID',:old.SUBJ_ID,:new.SUBJ_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REL_ID,'D',admin_pkg.apex_user,
'EPI_ID',:old.EPI_ID,:new.EPI_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REL_ID,'D',admin_pkg.apex_user,
'DESCRIPTION',:old.DESCRIPTION,:new.DESCRIPTION,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REL_ID,'D',admin_pkg.apex_user,
'CRU',:old.CRU,:new.CRU,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REL_ID,'D',admin_pkg.apex_user,
'MDU',:old.MDU,:new.MDU,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REL_ID,'D',admin_pkg.apex_user,
'W_REL_TYPE',:old.W_REL_TYPE,:new.W_REL_TYPE,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REL_ID,'D',admin_pkg.apex_user,
'STATUS_ID',:old.STATUS_ID,:new.STATUS_ID,v('EPI_ID') );
EXCEPTION
WHEN VALUE_ERROR THEN RAISE VALUE_EX;
WHEN OTHERS THEN RAISE INSERT_EXC;
END;
END IF;
IF inserting THEN
BEGIN
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
 RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REL_ID,'I',admin_pkg.apex_user,
null,null,null,v('EPI_ID') );
EXCEPTION
WHEN VALUE_ERROR THEN RAISE VALUE_EX;
WHEN OTHERS THEN RAISE INSERT_EXC;
END;
END IF;
EXCEPTION
WHEN VALUE_EX THEN
raise_application_error(-20201,'Value error on LOG_TABLE insert:');
WHEN INSERT_EXC THEN
raise_application_error(-20202,'Error on LOG_TABLE insert!');
END;
END;
END;
/
ALTER TRIGGER "LTRG_GIS_SUBJ_EPI_REL" ENABLE;