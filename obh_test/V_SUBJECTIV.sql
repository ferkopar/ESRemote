--------------------------------------------------------
--  DDL for View V_SUBJECTIV
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_SUBJECTIV" ("SUBJ_ID", "SUBJ_NAME", "SUBJ_TYPE_ID", "T_SUBJ_TYPE_NAME", "FIRST_NAME", "LAST_NAME", "TITLE", "B_DATE", "M_NAME", "DESCRIPTION", "CRU", "CRD", "MDU", "MDD", "STATUS_ID", "PARENT_SUBJ_ID", "EMAIL", "PHONE", "M_PHONE", "DATAS", "MISSING_PAR") AS 
  SELECT
    --    ROWID,
    SUBJ_ID,
    SUBJ_NAME,
    TYPE_ID,
    BASE_PKG.DM_TRANSLATE_F ('DM_SUPER_TYP' ,'TYPE_ID' ,TYPE_ID ,BASE_PKG.V_LANG_F ) T_SUBJ_TYPE_NAME,
    null,
    null,
    null,
    null,
    null,
    DESCRIPTION,
    CRU,
    CRD,
    MDU,
    MDD,
    null,
    null,
    null,
    null,
    null,
    base_pkg.SUBJECTIV_DATA_F(subj_id) DATAS,
    null MISSING_PAR
  FROM SUBJECT s;
