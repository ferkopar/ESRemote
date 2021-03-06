--------------------------------------------------------
--  DDL for Trigger LTRG_DM_REGULATION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LTRG_DM_REGULATION" 
AFTER INSERT OR UPDATE OR DELETE ON AMNIS.DM_REGULATION FOR EACH ROW
DECLARE
BEGIN
BEGIN
DECLARE
V_TNAME VARCHAR2(30) := 'DM_REGULATION';
VALUE_EX EXCEPTION;
INSERT_EXC EXCEPTION;
BEGIN
IF updating THEN
BEGIN
IF   (:new.REGUL_ID IS NULL AND :old.REGUL_ID IS NOT NULL)
  OR (:new.REGUL_ID IS NOT NULL AND :old.REGUL_ID IS NULL)
  OR (:new.REGUL_ID != :old.REGUL_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'REGUL_ID',:old.REGUL_ID,:new.REGUL_ID,v('EPI_ID') );
END IF;
IF   (:new.REGUL_NAME IS NULL AND :old.REGUL_NAME IS NOT NULL)
  OR (:new.REGUL_NAME IS NOT NULL AND :old.REGUL_NAME IS NULL)
  OR (:new.REGUL_NAME != :old.REGUL_NAME) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'REGUL_NAME',:old.REGUL_NAME,:new.REGUL_NAME,v('EPI_ID') );
END IF;
IF   (:new.REGUL_TYPE_ID IS NULL AND :old.REGUL_TYPE_ID IS NOT NULL)
  OR (:new.REGUL_TYPE_ID IS NOT NULL AND :old.REGUL_TYPE_ID IS NULL)
  OR (:new.REGUL_TYPE_ID != :old.REGUL_TYPE_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'REGUL_TYPE_ID',:old.REGUL_TYPE_ID,:new.REGUL_TYPE_ID,v('EPI_ID') );
END IF;
IF   (:new.TYPE_TABLE1 IS NULL AND :old.TYPE_TABLE1 IS NOT NULL)
  OR (:new.TYPE_TABLE1 IS NOT NULL AND :old.TYPE_TABLE1 IS NULL)
  OR (:new.TYPE_TABLE1 != :old.TYPE_TABLE1) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_TABLE1',:old.TYPE_TABLE1,:new.TYPE_TABLE1,v('EPI_ID') );
END IF;
IF   (:new.TYPE_TYPE1 IS NULL AND :old.TYPE_TYPE1 IS NOT NULL)
  OR (:new.TYPE_TYPE1 IS NOT NULL AND :old.TYPE_TYPE1 IS NULL)
  OR (:new.TYPE_TYPE1 != :old.TYPE_TYPE1) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_TYPE1',:old.TYPE_TYPE1,:new.TYPE_TYPE1,v('EPI_ID') );
END IF;
IF   (:new.TYPE_VALUE1 IS NULL AND :old.TYPE_VALUE1 IS NOT NULL)
  OR (:new.TYPE_VALUE1 IS NOT NULL AND :old.TYPE_VALUE1 IS NULL)
  OR (:new.TYPE_VALUE1 != :old.TYPE_VALUE1) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_VALUE1',:old.TYPE_VALUE1,:new.TYPE_VALUE1,v('EPI_ID') );
END IF;
IF   (:new.TYPE_COLUMN1 IS NULL AND :old.TYPE_COLUMN1 IS NOT NULL)
  OR (:new.TYPE_COLUMN1 IS NOT NULL AND :old.TYPE_COLUMN1 IS NULL)
  OR (:new.TYPE_COLUMN1 != :old.TYPE_COLUMN1) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_COLUMN1',:old.TYPE_COLUMN1,:new.TYPE_COLUMN1,v('EPI_ID') );
END IF;
IF   (:new.TYPE_TABLE2 IS NULL AND :old.TYPE_TABLE2 IS NOT NULL)
  OR (:new.TYPE_TABLE2 IS NOT NULL AND :old.TYPE_TABLE2 IS NULL)
  OR (:new.TYPE_TABLE2 != :old.TYPE_TABLE2) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_TABLE2',:old.TYPE_TABLE2,:new.TYPE_TABLE2,v('EPI_ID') );
END IF;
IF   (:new.TYPE_TYPE2 IS NULL AND :old.TYPE_TYPE2 IS NOT NULL)
  OR (:new.TYPE_TYPE2 IS NOT NULL AND :old.TYPE_TYPE2 IS NULL)
  OR (:new.TYPE_TYPE2 != :old.TYPE_TYPE2) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_TYPE2',:old.TYPE_TYPE2,:new.TYPE_TYPE2,v('EPI_ID') );
END IF;
IF   (:new.TYPE_COLUMN2 IS NULL AND :old.TYPE_COLUMN2 IS NOT NULL)
  OR (:new.TYPE_COLUMN2 IS NOT NULL AND :old.TYPE_COLUMN2 IS NULL)
  OR (:new.TYPE_COLUMN2 != :old.TYPE_COLUMN2) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_COLUMN2',:old.TYPE_COLUMN2,:new.TYPE_COLUMN2,v('EPI_ID') );
END IF;
IF   (:new.APEX_PAGE IS NULL AND :old.APEX_PAGE IS NOT NULL)
  OR (:new.APEX_PAGE IS NOT NULL AND :old.APEX_PAGE IS NULL)
  OR (:new.APEX_PAGE != :old.APEX_PAGE) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'APEX_PAGE',:old.APEX_PAGE,:new.APEX_PAGE,v('EPI_ID') );
END IF;
IF   (:new.APEX_VARIABLE IS NULL AND :old.APEX_VARIABLE IS NOT NULL)
  OR (:new.APEX_VARIABLE IS NOT NULL AND :old.APEX_VARIABLE IS NULL)
  OR (:new.APEX_VARIABLE != :old.APEX_VARIABLE) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'APEX_VARIABLE',:old.APEX_VARIABLE,:new.APEX_VARIABLE,v('EPI_ID') );
END IF;
IF   (:new.TPRIORITY IS NULL AND :old.TPRIORITY IS NOT NULL)
  OR (:new.TPRIORITY IS NOT NULL AND :old.TPRIORITY IS NULL)
  OR (:new.TPRIORITY != :old.TPRIORITY) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TPRIORITY',:old.TPRIORITY,:new.TPRIORITY,v('EPI_ID') );
END IF;
IF   (:new.TOPTIONAL IS NULL AND :old.TOPTIONAL IS NOT NULL)
  OR (:new.TOPTIONAL IS NOT NULL AND :old.TOPTIONAL IS NULL)
  OR (:new.TOPTIONAL != :old.TOPTIONAL) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TOPTIONAL',:old.TOPTIONAL,:new.TOPTIONAL,v('EPI_ID') );
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
:new.REGUL_ID,'U',admin_pkg.apex_user,
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
:new.REGUL_ID,'U',admin_pkg.apex_user,
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
:new.REGUL_ID,'U',admin_pkg.apex_user,
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
:new.REGUL_ID,'U',admin_pkg.apex_user,
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
:new.REGUL_ID,'U',admin_pkg.apex_user,
'MDU',:old.MDU,:new.MDU,v('EPI_ID') );
END IF;
IF   (:new.TYPE_VALUE2 IS NULL AND :old.TYPE_VALUE2 IS NOT NULL)
  OR (:new.TYPE_VALUE2 IS NOT NULL AND :old.TYPE_VALUE2 IS NULL)
  OR (:new.TYPE_VALUE2 != :old.TYPE_VALUE2) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_VALUE2',:old.TYPE_VALUE2,:new.TYPE_VALUE2,v('EPI_ID') );
END IF;
IF   (:new.TYPE_TABLE3 IS NULL AND :old.TYPE_TABLE3 IS NOT NULL)
  OR (:new.TYPE_TABLE3 IS NOT NULL AND :old.TYPE_TABLE3 IS NULL)
  OR (:new.TYPE_TABLE3 != :old.TYPE_TABLE3) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_TABLE3',:old.TYPE_TABLE3,:new.TYPE_TABLE3,v('EPI_ID') );
END IF;
IF   (:new.TYPE_TYPE3 IS NULL AND :old.TYPE_TYPE3 IS NOT NULL)
  OR (:new.TYPE_TYPE3 IS NOT NULL AND :old.TYPE_TYPE3 IS NULL)
  OR (:new.TYPE_TYPE3 != :old.TYPE_TYPE3) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_TYPE3',:old.TYPE_TYPE3,:new.TYPE_TYPE3,v('EPI_ID') );
END IF;
IF   (:new.TYPE_VALUE3 IS NULL AND :old.TYPE_VALUE3 IS NOT NULL)
  OR (:new.TYPE_VALUE3 IS NOT NULL AND :old.TYPE_VALUE3 IS NULL)
  OR (:new.TYPE_VALUE3 != :old.TYPE_VALUE3) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_VALUE3',:old.TYPE_VALUE3,:new.TYPE_VALUE3,v('EPI_ID') );
END IF;
IF   (:new.TYPE_COLUMN3 IS NULL AND :old.TYPE_COLUMN3 IS NOT NULL)
  OR (:new.TYPE_COLUMN3 IS NOT NULL AND :old.TYPE_COLUMN3 IS NULL)
  OR (:new.TYPE_COLUMN3 != :old.TYPE_COLUMN3) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_COLUMN3',:old.TYPE_COLUMN3,:new.TYPE_COLUMN3,v('EPI_ID') );
END IF;
IF   (:new.W_TYPE_NAME3 IS NULL AND :old.W_TYPE_NAME3 IS NOT NULL)
  OR (:new.W_TYPE_NAME3 IS NOT NULL AND :old.W_TYPE_NAME3 IS NULL)
  OR (:new.W_TYPE_NAME3 != :old.W_TYPE_NAME3) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'W_TYPE_NAME3',:old.W_TYPE_NAME3,:new.W_TYPE_NAME3,v('EPI_ID') );
END IF;
IF   (:new.W_TYPE_NAME1 IS NULL AND :old.W_TYPE_NAME1 IS NOT NULL)
  OR (:new.W_TYPE_NAME1 IS NOT NULL AND :old.W_TYPE_NAME1 IS NULL)
  OR (:new.W_TYPE_NAME1 != :old.W_TYPE_NAME1) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'W_TYPE_NAME1',:old.W_TYPE_NAME1,:new.W_TYPE_NAME1,v('EPI_ID') );
END IF;
IF   (:new.W_TYPE_NAME2 IS NULL AND :old.W_TYPE_NAME2 IS NOT NULL)
  OR (:new.W_TYPE_NAME2 IS NOT NULL AND :old.W_TYPE_NAME2 IS NULL)
  OR (:new.W_TYPE_NAME2 != :old.W_TYPE_NAME2) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'W_TYPE_NAME2',:old.W_TYPE_NAME2,:new.W_TYPE_NAME2,v('EPI_ID') );
END IF;
IF   (:new.TYPE_CONTROL1 IS NULL AND :old.TYPE_CONTROL1 IS NOT NULL)
  OR (:new.TYPE_CONTROL1 IS NOT NULL AND :old.TYPE_CONTROL1 IS NULL)
  OR (:new.TYPE_CONTROL1 != :old.TYPE_CONTROL1) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_CONTROL1',:old.TYPE_CONTROL1,:new.TYPE_CONTROL1,v('EPI_ID') );
END IF;
IF   (:new.TYPE_CONTROL2 IS NULL AND :old.TYPE_CONTROL2 IS NOT NULL)
  OR (:new.TYPE_CONTROL2 IS NOT NULL AND :old.TYPE_CONTROL2 IS NULL)
  OR (:new.TYPE_CONTROL2 != :old.TYPE_CONTROL2) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_CONTROL2',:old.TYPE_CONTROL2,:new.TYPE_CONTROL2,v('EPI_ID') );
END IF;
IF   (:new.TYPE_CONTROL3 IS NULL AND :old.TYPE_CONTROL3 IS NOT NULL)
  OR (:new.TYPE_CONTROL3 IS NOT NULL AND :old.TYPE_CONTROL3 IS NULL)
  OR (:new.TYPE_CONTROL3 != :old.TYPE_CONTROL3) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_CONTROL3',:old.TYPE_CONTROL3,:new.TYPE_CONTROL3,v('EPI_ID') );
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
:new.REGUL_ID,'U',admin_pkg.apex_user,
'STATUS_ID',:old.STATUS_ID,:new.STATUS_ID,v('EPI_ID') );
END IF;
IF   (:new.ROLE_ID IS NULL AND :old.ROLE_ID IS NOT NULL)
  OR (:new.ROLE_ID IS NOT NULL AND :old.ROLE_ID IS NULL)
  OR (:new.ROLE_ID != :old.ROLE_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'ROLE_ID',:old.ROLE_ID,:new.ROLE_ID,v('EPI_ID') );
END IF;
IF   (:new.TYPE_TABLE4 IS NULL AND :old.TYPE_TABLE4 IS NOT NULL)
  OR (:new.TYPE_TABLE4 IS NOT NULL AND :old.TYPE_TABLE4 IS NULL)
  OR (:new.TYPE_TABLE4 != :old.TYPE_TABLE4) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_TABLE4',:old.TYPE_TABLE4,:new.TYPE_TABLE4,v('EPI_ID') );
END IF;
IF   (:new.TYPE_COLUMN4 IS NULL AND :old.TYPE_COLUMN4 IS NOT NULL)
  OR (:new.TYPE_COLUMN4 IS NOT NULL AND :old.TYPE_COLUMN4 IS NULL)
  OR (:new.TYPE_COLUMN4 != :old.TYPE_COLUMN4) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_COLUMN4',:old.TYPE_COLUMN4,:new.TYPE_COLUMN4,v('EPI_ID') );
END IF;
IF   (:new.TYPE_TYPE4 IS NULL AND :old.TYPE_TYPE4 IS NOT NULL)
  OR (:new.TYPE_TYPE4 IS NOT NULL AND :old.TYPE_TYPE4 IS NULL)
  OR (:new.TYPE_TYPE4 != :old.TYPE_TYPE4) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_TYPE4',:old.TYPE_TYPE4,:new.TYPE_TYPE4,v('EPI_ID') );
END IF;
IF   (:new.TYPE_VALUE4 IS NULL AND :old.TYPE_VALUE4 IS NOT NULL)
  OR (:new.TYPE_VALUE4 IS NOT NULL AND :old.TYPE_VALUE4 IS NULL)
  OR (:new.TYPE_VALUE4 != :old.TYPE_VALUE4) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_VALUE4',:old.TYPE_VALUE4,:new.TYPE_VALUE4,v('EPI_ID') );
END IF;
IF   (:new.TYPE_CONTROL4 IS NULL AND :old.TYPE_CONTROL4 IS NOT NULL)
  OR (:new.TYPE_CONTROL4 IS NOT NULL AND :old.TYPE_CONTROL4 IS NULL)
  OR (:new.TYPE_CONTROL4 != :old.TYPE_CONTROL4) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.REGUL_ID,'U',admin_pkg.apex_user,
'TYPE_CONTROL4',:old.TYPE_CONTROL4,:new.TYPE_CONTROL4,v('EPI_ID') );
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
:old.REGUL_ID,'D',admin_pkg.apex_user,
'REGUL_ID',:old.REGUL_ID,:new.REGUL_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'REGUL_NAME',:old.REGUL_NAME,:new.REGUL_NAME,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'REGUL_TYPE_ID',:old.REGUL_TYPE_ID,:new.REGUL_TYPE_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_TABLE1',:old.TYPE_TABLE1,:new.TYPE_TABLE1,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_TYPE1',:old.TYPE_TYPE1,:new.TYPE_TYPE1,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_VALUE1',:old.TYPE_VALUE1,:new.TYPE_VALUE1,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_COLUMN1',:old.TYPE_COLUMN1,:new.TYPE_COLUMN1,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_TABLE2',:old.TYPE_TABLE2,:new.TYPE_TABLE2,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_TYPE2',:old.TYPE_TYPE2,:new.TYPE_TYPE2,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_COLUMN2',:old.TYPE_COLUMN2,:new.TYPE_COLUMN2,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'APEX_PAGE',:old.APEX_PAGE,:new.APEX_PAGE,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'APEX_VARIABLE',:old.APEX_VARIABLE,:new.APEX_VARIABLE,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TPRIORITY',:old.TPRIORITY,:new.TPRIORITY,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TOPTIONAL',:old.TOPTIONAL,:new.TOPTIONAL,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'DESCRIPTION',:old.DESCRIPTION,:new.DESCRIPTION,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'FROM_DATE',:old.FROM_DATE,:new.FROM_DATE,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TO_DATE',:old.TO_DATE,:new.TO_DATE,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'CRU',:old.CRU,:new.CRU,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'MDU',:old.MDU,:new.MDU,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_VALUE2',:old.TYPE_VALUE2,:new.TYPE_VALUE2,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_TABLE3',:old.TYPE_TABLE3,:new.TYPE_TABLE3,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_TYPE3',:old.TYPE_TYPE3,:new.TYPE_TYPE3,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_VALUE3',:old.TYPE_VALUE3,:new.TYPE_VALUE3,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_COLUMN3',:old.TYPE_COLUMN3,:new.TYPE_COLUMN3,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'W_TYPE_NAME3',:old.W_TYPE_NAME3,:new.W_TYPE_NAME3,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'W_TYPE_NAME1',:old.W_TYPE_NAME1,:new.W_TYPE_NAME1,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'W_TYPE_NAME2',:old.W_TYPE_NAME2,:new.W_TYPE_NAME2,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_CONTROL1',:old.TYPE_CONTROL1,:new.TYPE_CONTROL1,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_CONTROL2',:old.TYPE_CONTROL2,:new.TYPE_CONTROL2,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_CONTROL3',:old.TYPE_CONTROL3,:new.TYPE_CONTROL3,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'STATUS_ID',:old.STATUS_ID,:new.STATUS_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'ROLE_ID',:old.ROLE_ID,:new.ROLE_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_TABLE4',:old.TYPE_TABLE4,:new.TYPE_TABLE4,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_COLUMN4',:old.TYPE_COLUMN4,:new.TYPE_COLUMN4,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_TYPE4',:old.TYPE_TYPE4,:new.TYPE_TYPE4,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_VALUE4',:old.TYPE_VALUE4,:new.TYPE_VALUE4,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.REGUL_ID,'D',admin_pkg.apex_user,
'TYPE_CONTROL4',:old.TYPE_CONTROL4,:new.TYPE_CONTROL4,v('EPI_ID') );
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
:new.REGUL_ID,'I',admin_pkg.apex_user,
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
ALTER TRIGGER "LTRG_DM_REGULATION" ENABLE;
