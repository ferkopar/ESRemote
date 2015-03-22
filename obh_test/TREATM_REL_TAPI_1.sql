--------------------------------------------------------
--  DDL for Package Body TREATM_REL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "TREATM_REL_TAPI" 
IS
  -- insert
PROCEDURE ins(
    p_TIME_START    IN TREATM_REL.TIME_START%type DEFAULT NULL ,
    p_TREATM_ID2    IN TREATM_REL.TREATM_ID2%type ,
    p_CRU           IN TREATM_REL.CRU%type DEFAULT NULL ,
    p_TREATM_ID1    IN TREATM_REL.TREATM_ID1%type ,
    p_TO_DATE       IN TREATM_REL.TO_DATE%type DEFAULT NULL ,
    p_STATUS_ID     IN TREATM_REL.STATUS_ID%type DEFAULT NULL ,
    p_DESCRIPTION   IN TREATM_REL.DESCRIPTION%type DEFAULT NULL ,
    p_MDU           IN TREATM_REL.MDU%type DEFAULT NULL ,
    p_ORDER_NO      IN TREATM_REL.ORDER_NO%type DEFAULT NULL ,
    p_MM_ID         IN TREATM_REL.MM_ID%type DEFAULT NULL ,
    p_FROM_DATE     IN TREATM_REL.FROM_DATE%type DEFAULT NULL ,
    p_TREATM_REL_ID IN TREATM_REL.TREATM_REL_ID%type DEFAULT Null,
    p_REL_TYPE_ID   IN TREATM_REL.REL_TYPE_ID%type ,
    p_CRD           IN TREATM_REL.CRD%type DEFAULT NULL ,
    p_MDD           IN TREATM_REL.MDD%type DEFAULT NULL ,
    p_TIME_END      IN TREATM_REL.TIME_END%type DEFAULT NULL ,
    p_EPI_ID        IN TREATM_REL.EPI_ID%type DEFAULT NULL )
IS
BEGIN
  INSERT
  INTO TREATM_REL
    (
      TIME_START ,
      TREATM_ID2 ,
      CRU ,
      TREATM_ID1 ,
      TO_DATE ,
      STATUS_ID ,
      DESCRIPTION ,
      MDU ,
      ORDER_NO ,
      MM_ID ,
      FROM_DATE ,
      TREATM_REL_ID ,
      REL_TYPE_ID ,
      CRD ,
      MDD ,
      TIME_END ,
      EPI_ID
    )
    VALUES
    (
      p_TIME_START ,
      p_TREATM_ID2 ,
      p_CRU ,
      p_TREATM_ID1 ,
      p_TO_DATE ,
      p_STATUS_ID ,
      p_DESCRIPTION ,
      p_MDU ,
      p_ORDER_NO ,
      p_MM_ID ,
      p_FROM_DATE ,
      p_TREATM_REL_ID ,
      p_REL_TYPE_ID ,
      p_CRD ,
      p_MDD ,
      p_TIME_END ,
      p_EPI_ID
    );
END;
-- update
PROCEDURE upd
  (
    p_TIME_START    IN TREATM_REL.TIME_START%type DEFAULT NULL ,
    p_TREATM_ID2    IN TREATM_REL.TREATM_ID2%type ,
    p_CRU           IN TREATM_REL.CRU%type DEFAULT NULL ,
    p_TREATM_ID1    IN TREATM_REL.TREATM_ID1%type ,
    p_TO_DATE       IN TREATM_REL.TO_DATE%type DEFAULT NULL ,
    p_STATUS_ID     IN TREATM_REL.STATUS_ID%type DEFAULT NULL ,
    p_DESCRIPTION   IN TREATM_REL.DESCRIPTION%type DEFAULT NULL ,
    p_MDU           IN TREATM_REL.MDU%type DEFAULT NULL ,
    p_ORDER_NO      IN TREATM_REL.ORDER_NO%type DEFAULT NULL ,
    p_MM_ID         IN TREATM_REL.MM_ID%type DEFAULT NULL ,
    p_FROM_DATE     IN TREATM_REL.FROM_DATE%type DEFAULT NULL ,
    p_TREATM_REL_ID IN TREATM_REL.TREATM_REL_ID%type ,
    p_REL_TYPE_ID   IN TREATM_REL.REL_TYPE_ID%type ,
    p_CRD           IN TREATM_REL.CRD%type DEFAULT NULL ,
    p_MDD           IN TREATM_REL.MDD%type DEFAULT NULL ,
    p_TIME_END      IN TREATM_REL.TIME_END%type DEFAULT NULL ,
    p_EPI_ID        IN TREATM_REL.EPI_ID%type DEFAULT NULL
  )
IS
BEGIN
  UPDATE TREATM_REL
  SET TIME_START   = p_TIME_START ,
    CRU            = p_CRU ,
    TO_DATE        = p_TO_DATE ,
    STATUS_ID      = p_STATUS_ID ,
    DESCRIPTION    = p_DESCRIPTION ,
    MDU            = p_MDU ,
    ORDER_NO       = p_ORDER_NO ,
    MM_ID          = p_MM_ID ,
    FROM_DATE      = p_FROM_DATE ,
    TREATM_REL_ID  = p_TREATM_REL_ID ,
    REL_TYPE_ID    = p_REL_TYPE_ID ,
    CRD            = p_CRD ,
    MDD            = p_MDD ,
    TIME_END       = p_TIME_END ,
    EPI_ID         = p_EPI_ID
  WHERE TREATM_ID1 = p_TREATM_ID1
  AND TREATM_ID2   = p_TREATM_ID2;
END;
-- del
PROCEDURE del(
    p_TREATM_ID1 IN TREATM_REL.TREATM_ID1%type ,
    p_TREATM_ID2 IN TREATM_REL.TREATM_ID2%type )
IS
BEGIN
  DELETE
  FROM TREATM_REL
  WHERE TREATM_ID1 = p_TREATM_ID1
  AND TREATM_ID2   = p_TREATM_ID2;
END;

  PROCEDURE invalidate (p_rel_to_invalidate IN treatm_rel.treatm_rel_id%TYPE)
    IS
    v_treatm_rel_row treatm_rel%ROWTYPE;
    BEGIN
      BEGIN
         SELECT * INTO v_treatm_rel_row FROM treatm_rel WHERE treatm_rel_id = p_rel_to_invalidate;
      EXCEPTION
        WHEN others THEN
           RAISE_APPLICATION_ERROR(-20000,'Nem található sor treatm_rel:'|| p_rel_to_invalidate);
      END;
      IF v_treatm_rel_row.status_id in (917,921) THEN 
        DELETE FROM treatm_rel WHERE treatm_rel_id = p_rel_to_invalidate;
      END IF;
      UPDATE treatm_rel
        SET STATUS_ID = 919
        WHERE treatm_rel_id = p_rel_to_invalidate;   
    END;
    

END TREATM_REL_tapi;

/
