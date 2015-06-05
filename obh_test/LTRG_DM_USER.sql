--------------------------------------------------------
--  DDL for Trigger LTRG_DM_USER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LTRG_DM_USER" 
AFTER INSERT OR UPDATE OR DELETE ON AMNIS.DM_USER FOR EACH ROW
DECLARE
BEGIN
BEGIN
DECLARE
V_TNAME VARCHAR2(30) := 'DM_USER';
VALUE_EX EXCEPTION;
INSERT_EXC EXCEPTION;
BEGIN
IF updating THEN
BEGIN
IF   (:new.USER_NAME IS NULL AND :old.USER_NAME IS NOT NULL)
  OR (:new.USER_NAME IS NOT NULL AND :old.USER_NAME IS NULL)
  OR (:new.USER_NAME != :old.USER_NAME) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.USER_ID,'U',admin_pkg.apex_user,
'USER_NAME',:old.USER_NAME,:new.USER_NAME,v('EPI_ID') );
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
:new.USER_ID,'U',admin_pkg.apex_user,
'DESCRIPTION',:old.DESCRIPTION,:new.DESCRIPTION,v('EPI_ID') );
END IF;
IF   (:new.FROM_DATE IS NULL AND :old.FROM_DATE IS NOT NULL)
  OR (:new.FROM_DATE IS NOT NULL AND :old.FROM_DATE IS NULL)
  OR (:new.FROM_DATE != :old.FROM_DATE) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.USER_ID,'U',admin_pkg.apex_user,
'FROM_DATE',:old.FROM_DATE,:new.FROM_DATE,v('EPI_ID') );
END IF;
IF   (:new.TO_DATE IS NULL AND :old.TO_DATE IS NOT NULL)
  OR (:new.TO_DATE IS NOT NULL AND :old.TO_DATE IS NULL)
  OR (:new.TO_DATE != :old.TO_DATE) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.USER_ID,'U',admin_pkg.apex_user,
'TO_DATE',:old.TO_DATE,:new.TO_DATE,v('EPI_ID') );
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
:new.USER_ID,'U',admin_pkg.apex_user,
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
:new.USER_ID,'U',admin_pkg.apex_user,
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
:new.USER_ID,'U',admin_pkg.apex_user,
'STATUS_ID',:old.STATUS_ID,:new.STATUS_ID,v('EPI_ID') );
END IF;
IF   (:new.USER_PSWD IS NULL AND :old.USER_PSWD IS NOT NULL)
  OR (:new.USER_PSWD IS NOT NULL AND :old.USER_PSWD IS NULL)
  OR (:new.USER_PSWD != :old.USER_PSWD) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.USER_ID,'U',admin_pkg.apex_user,
'USER_PSWD',:old.USER_PSWD,:new.USER_PSWD,v('EPI_ID') );
END IF;
IF   (:new.USER_ID IS NULL AND :old.USER_ID IS NOT NULL)
  OR (:new.USER_ID IS NOT NULL AND :old.USER_ID IS NULL)
  OR (:new.USER_ID != :old.USER_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.USER_ID,'U',admin_pkg.apex_user,
'USER_ID',:old.USER_ID,:new.USER_ID,v('EPI_ID') );
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
:new.USER_ID,'U',admin_pkg.apex_user,
'SUBJ_ID',:old.SUBJ_ID,:new.SUBJ_ID,v('EPI_ID') );
END IF;
IF   (:new.LANGUAGE_ID IS NULL AND :old.LANGUAGE_ID IS NOT NULL)
  OR (:new.LANGUAGE_ID IS NOT NULL AND :old.LANGUAGE_ID IS NULL)
  OR (:new.LANGUAGE_ID != :old.LANGUAGE_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.USER_ID,'U',admin_pkg.apex_user,
'LANGUAGE_ID',:old.LANGUAGE_ID,:new.LANGUAGE_ID,v('EPI_ID') );
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
:old.USER_ID,'D',admin_pkg.apex_user,
'USER_NAME',:old.USER_NAME,:new.USER_NAME,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.USER_ID,'D',admin_pkg.apex_user,
'DESCRIPTION',:old.DESCRIPTION,:new.DESCRIPTION,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.USER_ID,'D',admin_pkg.apex_user,
'FROM_DATE',:old.FROM_DATE,:new.FROM_DATE,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.USER_ID,'D',admin_pkg.apex_user,
'TO_DATE',:old.TO_DATE,:new.TO_DATE,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.USER_ID,'D',admin_pkg.apex_user,
'CRU',:old.CRU,:new.CRU,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.USER_ID,'D',admin_pkg.apex_user,
'MDU',:old.MDU,:new.MDU,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.USER_ID,'D',admin_pkg.apex_user,
'STATUS_ID',:old.STATUS_ID,:new.STATUS_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.USER_ID,'D',admin_pkg.apex_user,
'USER_PSWD',:old.USER_PSWD,:new.USER_PSWD,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.USER_ID,'D',admin_pkg.apex_user,
'USER_ID',:old.USER_ID,:new.USER_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.USER_ID,'D',admin_pkg.apex_user,
'SUBJ_ID',:old.SUBJ_ID,:new.SUBJ_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.USER_ID,'D',admin_pkg.apex_user,
'LANGUAGE_ID',:old.LANGUAGE_ID,:new.LANGUAGE_ID,v('EPI_ID') );
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
:new.USER_ID,'I',admin_pkg.apex_user,
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
ALTER TRIGGER "LTRG_DM_USER" DISABLE;
