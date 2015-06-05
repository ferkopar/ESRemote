--------------------------------------------------------
--  DDL for View V_INVENT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_INVENT" ("LINK", "INVENT_ID", "SUBJ_ID", "SUBJ_NAME", "INVENT_TYPE_ID", "INVENT_TYPE_NAME", "SUPER_GROUP_ID", "MOVE_VALUE", "INVENT_VALUE", "RESERV_VALUE", "ORDER_VALUE", "UNIT_TYPE_ID", "UNIT", "INVENT_NAME", "DESCRIPTION", "EPI_ID", "CRU", "CRD", "MDU", "MDD") AS 
  SELECT 
    INVENT.INVENT_ID AS LINK, 
    INVENT.INVENT_ID AS INVENT_ID, 
    INVENT.SUBJ_ID AS SUBJ_ID, 
    BASE_PKG.SUBJECTIV_NAME_F(INVENT.SUBJ_ID) SUBJ_NAME, 
    INVENT.INVENT_TYPE_ID AS INVENT_TYPE_ID, 
    PKG_INVENT.LOOKUP_SUPER_TYP_NAME(INVENT_TYPE_ID) AS INVENT_TYPE_NAME, 
    PKG_INVENT.LOOKUP_EPI_SUPER_GROUP_ID(INVENT_PARAM.EPI_ID) AS SUPER_GROUP_ID, 
    INVENT.MOVE_VALUE AS MOVE_VALUE, 
    INVENT.INVENT_VALUE AS INVENT_VALUE, 
    INVENT.RESERV_VALUE AS RESERV_VALUE, 
    INVENT.ORDER_VALUE AS ORDER_VALUE, 
    INVENT.UNIT_TYPE_ID AS UNIT_TYPE_ID, 
    PKG_INVENT.LOOKUP_SUPER_TYP_NAME(INVENT.UNIT_TYPE_ID) AS UNIT, 
    INVENT.INVENT_NAME AS INVENT_NAME, 
    INVENT.DESCRIPTION AS DESCRIPTION, 
   -- INVENT.STAT_TYPE_ID AS STAT_TYPE_ID, 
    INVENT_PARAM.EPI_ID AS EPI_ID, 
    INVENT.CRU, 
    INVENT.CRD, 
    INVENT.MDU, 
    INVENT.MDD 
FROM 
    INVENT, 
    INVENT_PARAM 
WHERE 
    INVENT.INVENT_ID = INVENT_PARAM.INVENT_ID;