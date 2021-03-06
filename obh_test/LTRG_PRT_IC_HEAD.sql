--------------------------------------------------------
--  DDL for Trigger LTRG_PRT_IC_HEAD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LTRG_PRT_IC_HEAD" 
AFTER INSERT OR UPDATE OR DELETE ON AMNIS.PRT_IC_HEAD FOR EACH ROW
DECLARE
BEGIN
BEGIN
DECLARE
V_TNAME VARCHAR2(30) := 'PRT_IC_HEAD';
VALUE_EX EXCEPTION;
INSERT_EXC EXCEPTION;
BEGIN
IF updating THEN
BEGIN
IF   (:new.IC_ID IS NULL AND :old.IC_ID IS NOT NULL)
  OR (:new.IC_ID IS NOT NULL AND :old.IC_ID IS NULL)
  OR (:new.IC_ID != :old.IC_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.IC_ID,'U',admin_pkg.apex_user,
'IC_ID',:old.IC_ID,:new.IC_ID,v('EPI_ID') );
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
:new.IC_ID,'U',admin_pkg.apex_user,
'EPI_ID',:old.EPI_ID,:new.EPI_ID,v('EPI_ID') );
END IF;
IF   (:new.IC_SOURCE IS NULL AND :old.IC_SOURCE IS NOT NULL)
  OR (:new.IC_SOURCE IS NOT NULL AND :old.IC_SOURCE IS NULL)
  OR (:new.IC_SOURCE != :old.IC_SOURCE) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.IC_ID,'U',admin_pkg.apex_user,
'IC_SOURCE',:old.IC_SOURCE,:new.IC_SOURCE,v('EPI_ID') );
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
:new.IC_ID,'U',admin_pkg.apex_user,
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
:new.IC_ID,'U',admin_pkg.apex_user,
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
:new.IC_ID,'U',admin_pkg.apex_user,
'MDU',:old.MDU,:new.MDU,v('EPI_ID') );
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
:new.IC_ID,'U',admin_pkg.apex_user,
'STATUS_ID',:old.STATUS_ID,:new.STATUS_ID,v('EPI_ID') );
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
:new.IC_ID,'U',admin_pkg.apex_user,
'SUBJ_ID',:old.SUBJ_ID,:new.SUBJ_ID,v('EPI_ID') );
END IF;
IF   (:new.IC_EPI_ID IS NULL AND :old.IC_EPI_ID IS NOT NULL)
  OR (:new.IC_EPI_ID IS NOT NULL AND :old.IC_EPI_ID IS NULL)
  OR (:new.IC_EPI_ID != :old.IC_EPI_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.IC_ID,'U',admin_pkg.apex_user,
'IC_EPI_ID',:old.IC_EPI_ID,:new.IC_EPI_ID,v('EPI_ID') );
END IF;
IF   (:new.IC_TYPE_ID IS NULL AND :old.IC_TYPE_ID IS NOT NULL)
  OR (:new.IC_TYPE_ID IS NOT NULL AND :old.IC_TYPE_ID IS NULL)
  OR (:new.IC_TYPE_ID != :old.IC_TYPE_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.IC_ID,'U',admin_pkg.apex_user,
'IC_TYPE_ID',:old.IC_TYPE_ID,:new.IC_TYPE_ID,v('EPI_ID') );
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
:old.IC_ID,'D',admin_pkg.apex_user,
'IC_ID',:old.IC_ID,:new.IC_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.IC_ID,'D',admin_pkg.apex_user,
'EPI_ID',:old.EPI_ID,:new.EPI_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.IC_ID,'D',admin_pkg.apex_user,
'IC_SOURCE',:old.IC_SOURCE,:new.IC_SOURCE,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.IC_ID,'D',admin_pkg.apex_user,
'DESCRIPTION',:old.DESCRIPTION,:new.DESCRIPTION,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.IC_ID,'D',admin_pkg.apex_user,
'CRU',:old.CRU,:new.CRU,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.IC_ID,'D',admin_pkg.apex_user,
'MDU',:old.MDU,:new.MDU,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.IC_ID,'D',admin_pkg.apex_user,
'STATUS_ID',:old.STATUS_ID,:new.STATUS_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.IC_ID,'D',admin_pkg.apex_user,
'SUBJ_ID',:old.SUBJ_ID,:new.SUBJ_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.IC_ID,'D',admin_pkg.apex_user,
'IC_EPI_ID',:old.IC_EPI_ID,:new.IC_EPI_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.IC_ID,'D',admin_pkg.apex_user,
'IC_TYPE_ID',:old.IC_TYPE_ID,:new.IC_TYPE_ID,v('EPI_ID') );
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
:new.IC_ID,'I',admin_pkg.apex_user,
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
ALTER TRIGGER "LTRG_PRT_IC_HEAD" ENABLE;
