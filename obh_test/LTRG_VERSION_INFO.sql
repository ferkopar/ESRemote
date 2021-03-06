--------------------------------------------------------
--  DDL for Trigger LTRG_VERSION_INFO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LTRG_VERSION_INFO" 
AFTER INSERT OR UPDATE OR DELETE ON AMNIS.VERSION_INFO FOR EACH ROW
DECLARE
BEGIN
BEGIN
DECLARE
V_TNAME VARCHAR2(30) := 'VERSION_INFO';
VALUE_EX EXCEPTION;
INSERT_EXC EXCEPTION;
BEGIN
IF updating THEN
BEGIN
IF   (:new.VER_INFO_ID IS NULL AND :old.VER_INFO_ID IS NOT NULL)
  OR (:new.VER_INFO_ID IS NOT NULL AND :old.VER_INFO_ID IS NULL)
  OR (:new.VER_INFO_ID != :old.VER_INFO_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.DB_VER_INFO||'||'||:new.VER_INFO_ID,'U',admin_pkg.apex_user,
'VER_INFO_ID',:old.VER_INFO_ID,:new.VER_INFO_ID,v('EPI_ID') );
END IF;
IF   (:new.DB_VER_INFO IS NULL AND :old.DB_VER_INFO IS NOT NULL)
  OR (:new.DB_VER_INFO IS NOT NULL AND :old.DB_VER_INFO IS NULL)
  OR (:new.DB_VER_INFO != :old.DB_VER_INFO) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.DB_VER_INFO||'||'||:new.VER_INFO_ID,'U',admin_pkg.apex_user,
'DB_VER_INFO',:old.DB_VER_INFO,:new.DB_VER_INFO,v('EPI_ID') );
END IF;
IF   (:new.APX_VER_INFO IS NULL AND :old.APX_VER_INFO IS NOT NULL)
  OR (:new.APX_VER_INFO IS NOT NULL AND :old.APX_VER_INFO IS NULL)
  OR (:new.APX_VER_INFO != :old.APX_VER_INFO) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.DB_VER_INFO||'||'||:new.VER_INFO_ID,'U',admin_pkg.apex_user,
'APX_VER_INFO',:old.APX_VER_INFO,:new.APX_VER_INFO,v('EPI_ID') );
END IF;
IF   (:new.APX_MOD_INFO IS NULL AND :old.APX_MOD_INFO IS NOT NULL)
  OR (:new.APX_MOD_INFO IS NOT NULL AND :old.APX_MOD_INFO IS NULL)
  OR (:new.APX_MOD_INFO != :old.APX_MOD_INFO) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.DB_VER_INFO||'||'||:new.VER_INFO_ID,'U',admin_pkg.apex_user,
'APX_MOD_INFO',:old.APX_MOD_INFO,:new.APX_MOD_INFO,v('EPI_ID') );
END IF;
IF   (:new.APX_DEV_USR IS NULL AND :old.APX_DEV_USR IS NOT NULL)
  OR (:new.APX_DEV_USR IS NOT NULL AND :old.APX_DEV_USR IS NULL)
  OR (:new.APX_DEV_USR != :old.APX_DEV_USR) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.DB_VER_INFO||'||'||:new.VER_INFO_ID,'U',admin_pkg.apex_user,
'APX_DEV_USR',:old.APX_DEV_USR,:new.APX_DEV_USR,v('EPI_ID') );
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
:new.DB_VER_INFO||'||'||:new.VER_INFO_ID,'U',admin_pkg.apex_user,
'MDU',:old.MDU,:new.MDU,v('EPI_ID') );
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
:new.DB_VER_INFO||'||'||:new.VER_INFO_ID,'U',admin_pkg.apex_user,
'CRU',:old.CRU,:new.CRU,v('EPI_ID') );
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
:new.DB_VER_INFO||'||'||:new.VER_INFO_ID,'U',admin_pkg.apex_user,
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
:old.DB_VER_INFO||'||'||:old.VER_INFO_ID,'D',admin_pkg.apex_user,
'VER_INFO_ID',:old.VER_INFO_ID,:new.VER_INFO_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.DB_VER_INFO||'||'||:old.VER_INFO_ID,'D',admin_pkg.apex_user,
'DB_VER_INFO',:old.DB_VER_INFO,:new.DB_VER_INFO,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.DB_VER_INFO||'||'||:old.VER_INFO_ID,'D',admin_pkg.apex_user,
'APX_VER_INFO',:old.APX_VER_INFO,:new.APX_VER_INFO,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.DB_VER_INFO||'||'||:old.VER_INFO_ID,'D',admin_pkg.apex_user,
'APX_MOD_INFO',:old.APX_MOD_INFO,:new.APX_MOD_INFO,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.DB_VER_INFO||'||'||:old.VER_INFO_ID,'D',admin_pkg.apex_user,
'APX_DEV_USR',:old.APX_DEV_USR,:new.APX_DEV_USR,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.DB_VER_INFO||'||'||:old.VER_INFO_ID,'D',admin_pkg.apex_user,
'MDU',:old.MDU,:new.MDU,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.DB_VER_INFO||'||'||:old.VER_INFO_ID,'D',admin_pkg.apex_user,
'CRU',:old.CRU,:new.CRU,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.DB_VER_INFO||'||'||:old.VER_INFO_ID,'D',admin_pkg.apex_user,
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
:new.DB_VER_INFO||'||'||:new.VER_INFO_ID,'I',admin_pkg.apex_user,
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
ALTER TRIGGER "LTRG_VERSION_INFO" ENABLE;
