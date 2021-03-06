--------------------------------------------------------
--  DDL for View V_INVENT_EPI_PARAM
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_INVENT_EPI_PARAM" ("EPI_ID", "ORDER_NO", "EPI_SUBJ_ID", "EPI_SUBJ_NAME", "PARAM_TYPE_ID", "PARAM_TYPE_NAME", "VALUE_TYPE_ID", "PARAM_VALUE_TYPE_NAME", "PARAM_VALUE", "UNIT_TYPE_ID", "PARAM_UNIT", "PARAM_DESCRIPTION", "MM_ID", "MM_SUBJ_ID", "MM_SUBJ_NAME", "MM_TYPE_ID", "FILE_NAME", "MM_BLOB", "TITLE", "CRU", "CRD", "MDU", "MDD") AS 
  SELECT 
    EPI_SUBJ_PARAM.EPI_ID, 
    EPI_SUBJ_PARAM.ORDER_NO, 
    EPI_SUBJ_PARAM.EPI_SUBJ_ID, 
    BASE_PKG.SUBJECTIV_NAME_F(EPI_SUBJ_PARAM.SUBJ_ID) EPI_SUBJ_NAME, 
    EPI_SUBJ_PARAM.PARAM_TYPE_ID, 
    PKG_INVENT.LOOKUP_SUPER_TYP_NAME(EPI_SUBJ_PARAM.PARAM_TYPE_ID) PARAM_TYPE_NAME, 
    EPI_SUBJ_PARAM.VALUE_TYPE_ID, 
    PKG_INVENT.LOOKUP_SUPER_TYP_NAME(EPI_SUBJ_PARAM.VALUE_TYPE_ID) PARAM_VALUE_TYPE_NAME, 
    EPI_SUBJ_PARAM.VALUE PARAM_VALUE, 
    EPI_SUBJ_PARAM.UNIT_TYPE_ID UNIT_TYPE_ID, 
    PKG_INVENT.LOOKUP_SUPER_TYP_NAME(EPI_SUBJ_PARAM.UNIT_TYPE_ID) PARAM_UNIT, 
    EPI_SUBJ_PARAM.DESCRIPTION PARAM_DESCRIPTION, 
    EPI_SUBJ_PARAM.MM_ID, 
    MM_FILES.SUBJ_ID MM_SUBJ_ID, 
    BASE_PKG.SUBJECTIV_NAME_F(MM_FILES.SUBJ_ID) MM_SUBJ_NAME, 
    MM_FILES.MM_TYPE_ID, 
    MM_FILES.FILE_NAME, 
    MM_FILES.MM_BLOB, 
    MM_FILES.TITLE, 
    EPI_SUBJ_PARAM.CRU, 
    EPI_SUBJ_PARAM.CRD, 
    EPI_SUBJ_PARAM.MDU, 
    EPI_SUBJ_PARAM.MDD 
FROM 
    EPI_SUBJ_PARAM, 
    MM_FILES 
WHERE 
    EPI_SUBJ_PARAM.MM_ID = MM_FILES.MM_ID(+);
