--------------------------------------------------------
--  DDL for View V_ADAT_BEERKEZES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_ADAT_BEERKEZES" ("BEERKEZES_ID", "SUBJ_ID", "SUBJ_NAME", "STATUS_ID", "STATUS_NAME", "MM_ID", "MM_FILE_NAME", "MM_FILE_STATUS", "DESCRIPTION", "FROM_DATE", "TO_DATE", "PARAM_FDATE", "PARAM_TDATE", "INC_TYPE_ID", "LIST_TYPE_ID", "LIST_TYPE_NAME", "INCOME_NAME", "DATA_OWNER_ID", "INTERVALL_TYPE_ID", "CRU", "CRD", "MDU", "MDD") AS 
  select 
  data_inco_id, 
  SUBJ_ID, 
  lookup_subj_name(SUBJ_ID) subj_name,
  STATUS_ID, 
  lookup_super_type_name(STATUS_ID) status_name,
  MM_ID, 
 (select file_name from mm_files where mm_files.mm_id = DATA_INCO.MM_ID ) MM_FILE_NAME,
 (select status_id from mm_files where mm_files.mm_id = DATA_INCO.MM_ID ) MM_FILE_STATUS,
  DESCRIPTION, 
  FROM_DATE,
  TO_DATE,
  PARAM_FDATE,
  PARAM_TDATE,
  INC_TYPE_ID,
  LIST_TYPE_ID,
  lookup_super_type_name(LIST_TYPE_ID) LIST_TYPE_NAME,
  lookup_super_type_name(INC_TYPE_ID) INCOME_NAME,
  DATA_OWNER_ID,
  (SELECT  super_typ_id FROM DM_SUPER_TYP DST 
    WHERE DST.FROM_DATE = DATA_INCO.from_date
    AND DST.TO_DATE = DATA_INCO.from_date
    AND DST.GROUND_LEVEL_ID =20100) intervall_type_id,
  CRU,CRD,MDU,MDD 
from 
DATA_INCO;
