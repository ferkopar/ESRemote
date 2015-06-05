--------------------------------------------------------
--  DDL for Trigger LTRG_GIS_DATA
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LTRG_GIS_DATA" 
AFTER INSERT OR UPDATE OR DELETE ON AMNIS.GIS_DATA FOR EACH ROW
DECLARE
BEGIN
BEGIN
DECLARE
V_TNAME VARCHAR2(30) := 'GIS_DATA';
VALUE_EX EXCEPTION;
INSERT_EXC EXCEPTION;
BEGIN
IF updating THEN
BEGIN
IF   (:new.GIS_ID IS NULL AND :old.GIS_ID IS NOT NULL)
  OR (:new.GIS_ID IS NOT NULL AND :old.GIS_ID IS NULL)
  OR (:new.GIS_ID != :old.GIS_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'GIS_ID',:old.GIS_ID,:new.GIS_ID,v('EPI_ID') );
END IF;
IF   (:new.GIS_TYPE_ID IS NULL AND :old.GIS_TYPE_ID IS NOT NULL)
  OR (:new.GIS_TYPE_ID IS NOT NULL AND :old.GIS_TYPE_ID IS NULL)
  OR (:new.GIS_TYPE_ID != :old.GIS_TYPE_ID) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'GIS_TYPE_ID',:old.GIS_TYPE_ID,:new.GIS_TYPE_ID,v('EPI_ID') );
END IF;
IF   (:new.COUNTRY IS NULL AND :old.COUNTRY IS NOT NULL)
  OR (:new.COUNTRY IS NOT NULL AND :old.COUNTRY IS NULL)
  OR (:new.COUNTRY != :old.COUNTRY) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'COUNTRY',:old.COUNTRY,:new.COUNTRY,v('EPI_ID') );
END IF;
IF   (:new.CITY IS NULL AND :old.CITY IS NOT NULL)
  OR (:new.CITY IS NOT NULL AND :old.CITY IS NULL)
  OR (:new.CITY != :old.CITY) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'CITY',:old.CITY,:new.CITY,v('EPI_ID') );
END IF;
IF   (:new.PLZ IS NULL AND :old.PLZ IS NOT NULL)
  OR (:new.PLZ IS NOT NULL AND :old.PLZ IS NULL)
  OR (:new.PLZ != :old.PLZ) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'PLZ',:old.PLZ,:new.PLZ,v('EPI_ID') );
END IF;
IF   (:new.ADRESS IS NULL AND :old.ADRESS IS NOT NULL)
  OR (:new.ADRESS IS NOT NULL AND :old.ADRESS IS NULL)
  OR (:new.ADRESS != :old.ADRESS) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'ADRESS',:old.ADRESS,:new.ADRESS,v('EPI_ID') );
END IF;
IF   (:new.STREET IS NULL AND :old.STREET IS NOT NULL)
  OR (:new.STREET IS NOT NULL AND :old.STREET IS NULL)
  OR (:new.STREET != :old.STREET) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'STREET',:old.STREET,:new.STREET,v('EPI_ID') );
END IF;
IF   (:new.HOUSE_NUM IS NULL AND :old.HOUSE_NUM IS NOT NULL)
  OR (:new.HOUSE_NUM IS NOT NULL AND :old.HOUSE_NUM IS NULL)
  OR (:new.HOUSE_NUM != :old.HOUSE_NUM) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'HOUSE_NUM',:old.HOUSE_NUM,:new.HOUSE_NUM,v('EPI_ID') );
END IF;
IF   (:new.LAT IS NULL AND :old.LAT IS NOT NULL)
  OR (:new.LAT IS NOT NULL AND :old.LAT IS NULL)
  OR (:new.LAT != :old.LAT) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'LAT',:old.LAT,:new.LAT,v('EPI_ID') );
END IF;
IF   (:new.LON IS NULL AND :old.LON IS NOT NULL)
  OR (:new.LON IS NOT NULL AND :old.LON IS NULL)
  OR (:new.LON != :old.LON) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'LON',:old.LON,:new.LON,v('EPI_ID') );
END IF;
IF   (:new.LATLON IS NULL AND :old.LATLON IS NOT NULL)
  OR (:new.LATLON IS NOT NULL AND :old.LATLON IS NULL)
  OR (:new.LATLON != :old.LATLON) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'LATLON',:old.LATLON,:new.LATLON,v('EPI_ID') );
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
:new.GIS_ID,'U',admin_pkg.apex_user,
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
:new.GIS_ID,'U',admin_pkg.apex_user,
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
:new.GIS_ID,'U',admin_pkg.apex_user,
'MDU',:old.MDU,:new.MDU,v('EPI_ID') );
END IF;
IF   (:new.W_COUNTRY_DUOCODE IS NULL AND :old.W_COUNTRY_DUOCODE IS NOT NULL)
  OR (:new.W_COUNTRY_DUOCODE IS NOT NULL AND :old.W_COUNTRY_DUOCODE IS NULL)
  OR (:new.W_COUNTRY_DUOCODE != :old.W_COUNTRY_DUOCODE) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'W_COUNTRY_DUOCODE',:old.W_COUNTRY_DUOCODE,:new.W_COUNTRY_DUOCODE,v('EPI_ID') );
END IF;
IF   (:new.W_CRM_COUNTRY IS NULL AND :old.W_CRM_COUNTRY IS NOT NULL)
  OR (:new.W_CRM_COUNTRY IS NOT NULL AND :old.W_CRM_COUNTRY IS NULL)
  OR (:new.W_CRM_COUNTRY != :old.W_CRM_COUNTRY) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'W_CRM_COUNTRY',:old.W_CRM_COUNTRY,:new.W_CRM_COUNTRY,v('EPI_ID') );
END IF;
IF   (:new.W_CRM_CITY IS NULL AND :old.W_CRM_CITY IS NOT NULL)
  OR (:new.W_CRM_CITY IS NOT NULL AND :old.W_CRM_CITY IS NULL)
  OR (:new.W_CRM_CITY != :old.W_CRM_CITY) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'W_CRM_CITY',:old.W_CRM_CITY,:new.W_CRM_CITY,v('EPI_ID') );
END IF;
IF   (:new.COUNTY IS NULL AND :old.COUNTY IS NOT NULL)
  OR (:new.COUNTY IS NOT NULL AND :old.COUNTY IS NULL)
  OR (:new.COUNTY != :old.COUNTY) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'COUNTY',:old.COUNTY,:new.COUNTY,v('EPI_ID') );
END IF;
IF   (:new.WK_COUNTRY_CODE IS NULL AND :old.WK_COUNTRY_CODE IS NOT NULL)
  OR (:new.WK_COUNTRY_CODE IS NOT NULL AND :old.WK_COUNTRY_CODE IS NULL)
  OR (:new.WK_COUNTRY_CODE != :old.WK_COUNTRY_CODE) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'WK_COUNTRY_CODE',:old.WK_COUNTRY_CODE,:new.WK_COUNTRY_CODE,v('EPI_ID') );
END IF;
IF   (:new.WK_ADM_NAME1 IS NULL AND :old.WK_ADM_NAME1 IS NOT NULL)
  OR (:new.WK_ADM_NAME1 IS NOT NULL AND :old.WK_ADM_NAME1 IS NULL)
  OR (:new.WK_ADM_NAME1 != :old.WK_ADM_NAME1) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'WK_ADM_NAME1',:old.WK_ADM_NAME1,:new.WK_ADM_NAME1,v('EPI_ID') );
END IF;
IF   (:new.WK_ADM_CODE1 IS NULL AND :old.WK_ADM_CODE1 IS NOT NULL)
  OR (:new.WK_ADM_CODE1 IS NOT NULL AND :old.WK_ADM_CODE1 IS NULL)
  OR (:new.WK_ADM_CODE1 != :old.WK_ADM_CODE1) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'WK_ADM_CODE1',:old.WK_ADM_CODE1,:new.WK_ADM_CODE1,v('EPI_ID') );
END IF;
IF   (:new.WK_ADM_NAME2 IS NULL AND :old.WK_ADM_NAME2 IS NOT NULL)
  OR (:new.WK_ADM_NAME2 IS NOT NULL AND :old.WK_ADM_NAME2 IS NULL)
  OR (:new.WK_ADM_NAME2 != :old.WK_ADM_NAME2) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'WK_ADM_NAME2',:old.WK_ADM_NAME2,:new.WK_ADM_NAME2,v('EPI_ID') );
END IF;
IF   (:new.WK_ADM_CODE2 IS NULL AND :old.WK_ADM_CODE2 IS NOT NULL)
  OR (:new.WK_ADM_CODE2 IS NOT NULL AND :old.WK_ADM_CODE2 IS NULL)
  OR (:new.WK_ADM_CODE2 != :old.WK_ADM_CODE2) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'WK_ADM_CODE2',:old.WK_ADM_CODE2,:new.WK_ADM_CODE2,v('EPI_ID') );
END IF;
IF   (:new.WK_ERROR IS NULL AND :old.WK_ERROR IS NOT NULL)
  OR (:new.WK_ERROR IS NOT NULL AND :old.WK_ERROR IS NULL)
  OR (:new.WK_ERROR != :old.WK_ERROR) THEN 
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:new.GIS_ID,'U',admin_pkg.apex_user,
'WK_ERROR',:old.WK_ERROR,:new.WK_ERROR,v('EPI_ID') );
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
:new.GIS_ID,'U',admin_pkg.apex_user,
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
:old.GIS_ID,'D',admin_pkg.apex_user,
'GIS_ID',:old.GIS_ID,:new.GIS_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'GIS_TYPE_ID',:old.GIS_TYPE_ID,:new.GIS_TYPE_ID,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'COUNTRY',:old.COUNTRY,:new.COUNTRY,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'CITY',:old.CITY,:new.CITY,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'PLZ',:old.PLZ,:new.PLZ,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'ADRESS',:old.ADRESS,:new.ADRESS,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'STREET',:old.STREET,:new.STREET,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'HOUSE_NUM',:old.HOUSE_NUM,:new.HOUSE_NUM,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'LAT',:old.LAT,:new.LAT,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'LON',:old.LON,:new.LON,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'LATLON',:old.LATLON,:new.LATLON,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'DESCRIPTION',:old.DESCRIPTION,:new.DESCRIPTION,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'CRU',:old.CRU,:new.CRU,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'MDU',:old.MDU,:new.MDU,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'W_COUNTRY_DUOCODE',:old.W_COUNTRY_DUOCODE,:new.W_COUNTRY_DUOCODE,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'W_CRM_COUNTRY',:old.W_CRM_COUNTRY,:new.W_CRM_COUNTRY,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'W_CRM_CITY',:old.W_CRM_CITY,:new.W_CRM_CITY,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'COUNTY',:old.COUNTY,:new.COUNTY,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'WK_COUNTRY_CODE',:old.WK_COUNTRY_CODE,:new.WK_COUNTRY_CODE,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'WK_ADM_NAME1',:old.WK_ADM_NAME1,:new.WK_ADM_NAME1,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'WK_ADM_CODE1',:old.WK_ADM_CODE1,:new.WK_ADM_CODE1,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'WK_ADM_NAME2',:old.WK_ADM_NAME2,:new.WK_ADM_NAME2,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'WK_ADM_CODE2',:old.WK_ADM_CODE2,:new.WK_ADM_CODE2,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
'WK_ERROR',:old.WK_ERROR,:new.WK_ERROR,v('EPI_ID') );
INSERT INTO LOG_TABLE
(LOG_ID, OPERATION_TIME, TABLE_NAME,
RECORD_ID, OPERATION_TYPE, USER_NAME,
 COLUMN_NAME, OLD_VALUE, NEW_VALUE,EPI_ID)
VALUES
(SEQ_LTRG_ID.nextval,sysdate,V_TNAME,
:old.GIS_ID,'D',admin_pkg.apex_user,
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
:new.GIS_ID,'I',admin_pkg.apex_user,
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
ALTER TRIGGER "LTRG_GIS_DATA" ENABLE;