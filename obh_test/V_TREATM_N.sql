--------------------------------------------------------
--  DDL for View V_TREATM_N
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_TREATM_N" ("TREATM_ID", "TREATM_NAME", "TREATM_TYPE_ID", "STATUS_ID", "STATE_START_ID", "STATE_END_ID", "TREATM_CATEGORY_ID", "EPI_ID", "MM_ID", "TIME_START", "TIME_END", "SUBJ1_ID", "TYPE1_ID", "SUBJ2_ID", "TYPE2_ID", "DESCRIPTION", "CRU", "CRD", "MDD", "MDU", "WK_TB_CODE", "WK_COMMENT", "WK_NAME", "DATA_OWNER_ID", "FROM_DATE", "TO_DATE", "TREATM_NAME_ID") AS 
  SELECT 
   "TREATM_ID","TREATM_NAME","TREATM_TYPE_ID","STATUS_ID","STATE_START_ID","STATE_END_ID","TREATM_CATEGORY_ID","EPI_ID","MM_ID","TIME_START","TIME_END","SUBJ1_ID","TYPE1_ID","SUBJ2_ID","TYPE2_ID","DESCRIPTION","CRU","CRD","MDD","MDU","WK_TB_CODE","WK_COMMENT","WK_NAME","DATA_OWNER_ID","FROM_DATE","TO_DATE","TREATM_NAME_ID" 
FROM 
 TREATM
WHERE TREATM_GROUP_ID = 1601
  and STATUS_ID != 919;
