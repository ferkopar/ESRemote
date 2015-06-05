--------------------------------------------------------
--  DDL for View VT_DM_SUPER_TYP1
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VT_DM_SUPER_TYP1" ("LANGUAGE_NAME", "TYPE_ID", "GROUP_ID", "T_TYPE_NAME", "T_GROUP_NAME", "SLEVEL", "SOPTIONAL", "DESCRIPTION", "STAT_TYPE_ID", "FROM_DATE", "TO_DATE", "SUPER_TYPE_NAME", "SUPER_GROUP_NAME", "TABLE_NAME", "TABLE_COLUMN") AS 
  SELECT BASE_PKG.LANGUAGE_NAME_F LANGUAGE_NAME,
    t.SUPER_TYP_ID,
    T.GROUP_ID,
    --DECODE(DENTAL_PKG.DM_TRANSLATE_F ('DM_SUPER_TYP' ,'TYPE_ID' ,TYPE_ID ,DENTAL_PKG.V_LANG_F ),'nn',SUPER_TYPE_NAME ,DENTAL_PKG.DM_TRANSLATE_F ('DM_SUPER_TYP' ,'TYPE_ID' ,TYPE_ID ,DENTAL_PKG.V_LANG_F ))||'('||t.TYPE_ID||')' T_TYPE_NAME,
    t.super_type_name||'('||t.SUPER_TYP_ID||')' as T_TYPE_NAME,
    --DENTAL_PKG.DM_TRANSLATE_F ('DM_SUPER_TYP' ,'TYPE_ID' ,t.GROUP_ID ,DENTAL_PKG.V_LANG_F )
    --||' ('
    --||
    t.SUPER_GROUP_NAME
    ||')'||'('||t.GROUP_ID||')' T_GROUP_NAME,
    t.SLEVEL,
    t.SOPTIONAL,
    t.DESCRIPTION,
    t.STATUS_ID,
    --t.CLASS_ID,
    t.FROM_DATE,
    t.TO_DATE,
    --t.APEX_VARIABLE,
    t.SUPER_TYPE_NAME,
    t.SUPER_GROUP_NAME,
    u.TABLE_NAME,
    u.TABLE_COLUMN
  FROM DM_SUPER_TYP t,
    DM_CAT_USAGE u
  where T.SUPER_TYP_ID =U.CAT_TYPE_ID(+)
  --AND DENTAL_PKG.RIGHTS_READ_ROW_F('DM_SUPER_TYP',TYPE_ID,t.STAT_TYPE_ID)='Y'
    --and DENTAL_PKG.STATUS_VALID_F(t.STAT_TYPE_ID)='Y'
    --and DENTAL_PKG.STATUS_VALID_F(u.STAT_TYPE_ID)='Y'
  --AND (FROM_DATE <=sysdate
  --OR FROM_DATE   IS NULL)
  --AND (TO_DATE    >sysdate
  --or TO_DATE     is null
 -- );;
