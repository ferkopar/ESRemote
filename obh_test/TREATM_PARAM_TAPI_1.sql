--------------------------------------------------------
--  DDL for Package Body TREATM_PARAM_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "TREATM_PARAM_TAPI" 
IS
  -- insert
PROCEDURE ins(

    p_CRU              IN TREATM_PARAM.CRU%type DEFAULT NULL ,
    p_TREATM_PARAM_ID  IN TREATM_PARAM.TREATM_PARAM_ID%type ,
    p_STATUS_ID        IN TREATM_PARAM.STATUS_ID%type DEFAULT NULL ,
    p_TO_DATE          IN TREATM_PARAM.TO_DATE%type DEFAULT NULL ,
    p_SUBJ_ID          IN TREATM_PARAM.SUBJ_ID%type DEFAULT NULL ,
    p_UNIT_TYPE_ID     IN TREATM_PARAM.UNIT_TYPE_ID%type DEFAULT NULL ,
    p_DESCRIPTION      IN TREATM_PARAM.DESCRIPTION%type DEFAULT NULL ,
    p_SUBJ_TYPE_ID     IN TREATM_PARAM.SUBJ_TYPE_ID%type DEFAULT NULL ,
    p_MDU              IN TREATM_PARAM.MDU%type DEFAULT NULL ,
    p_ORDER_NO         IN TREATM_PARAM.ORDER_NO%type DEFAULT NULL ,
    p_MM_ID            IN TREATM_PARAM.MM_ID%type DEFAULT NULL ,
    p_FROM_DATE        IN TREATM_PARAM.FROM_DATE%type DEFAULT NULL ,
    p_TREATM_PARAM1_ID IN TREATM_PARAM.TREATM_PARAM1_ID%type DEFAULT NULL ,
    p_W_PARAM_TYPE     IN TREATM_PARAM.W_PARAM_TYPE%type DEFAULT NULL ,
    p_CRD              IN TREATM_PARAM.CRD%type DEFAULT NULL ,
    p_VALUE_TYPE_ID    IN TREATM_PARAM.VALUE_TYPE_ID%type DEFAULT NULL ,
    p_MDD              IN TREATM_PARAM.MDD%type DEFAULT NULL ,
    p_TREATM_ID        IN TREATM_PARAM.TREATM_ID%type DEFAULT NULL ,
    p_VALUE            IN TREATM_PARAM.VALUE%type DEFAULT NULL ,
    p_PARAM_TYPE_ID    IN TREATM_PARAM.PARAM_TYPE_ID%type ,
    p_EPI_ID           IN TREATM_PARAM.EPI_ID%type )
IS
BEGIN
  INSERT
  INTO TREATM_PARAM
    (
      CRU ,
      TREATM_PARAM_ID ,
      STATUS_ID ,
      TO_DATE ,
      SUBJ_ID ,
      UNIT_TYPE_ID ,
      DESCRIPTION ,
      SUBJ_TYPE_ID ,
      MDU ,
      ORDER_NO ,
      MM_ID ,
      FROM_DATE ,
      TREATM_PARAM1_ID ,
      W_PARAM_TYPE ,
      CRD ,
      VALUE_TYPE_ID ,
      MDD ,
      TREATM_ID ,
      VALUE ,
      PARAM_TYPE_ID ,
      EPI_ID
    )
    VALUES
    (
      p_CRU ,
      p_TREATM_PARAM_ID ,
      p_STATUS_ID ,
      p_TO_DATE ,
      p_SUBJ_ID ,
      p_UNIT_TYPE_ID ,
      p_DESCRIPTION ,
      p_SUBJ_TYPE_ID ,
      p_MDU ,
      p_ORDER_NO ,
      p_MM_ID ,
      p_FROM_DATE ,
      p_TREATM_PARAM1_ID ,
      p_W_PARAM_TYPE ,
      p_CRD ,
      p_VALUE_TYPE_ID ,
      p_MDD ,
      p_TREATM_ID ,
      p_VALUE ,
      p_PARAM_TYPE_ID ,
      p_EPI_ID
    );
END;
-- update
PROCEDURE upd
  (
    p_CRU              IN TREATM_PARAM.CRU%type DEFAULT NULL ,
    p_TREATM_PARAM_ID  IN TREATM_PARAM.TREATM_PARAM_ID%type ,
    p_STATUS_ID        IN TREATM_PARAM.STATUS_ID%type DEFAULT NULL ,
    p_TO_DATE          IN TREATM_PARAM.TO_DATE%type DEFAULT NULL ,
    p_SUBJ_ID          IN TREATM_PARAM.SUBJ_ID%type DEFAULT NULL ,
    p_UNIT_TYPE_ID     IN TREATM_PARAM.UNIT_TYPE_ID%type DEFAULT NULL ,
    p_DESCRIPTION      IN TREATM_PARAM.DESCRIPTION%type DEFAULT NULL ,
    p_SUBJ_TYPE_ID     IN TREATM_PARAM.SUBJ_TYPE_ID%type DEFAULT NULL ,
    p_MDU              IN TREATM_PARAM.MDU%type DEFAULT NULL ,
    p_ORDER_NO         IN TREATM_PARAM.ORDER_NO%type DEFAULT NULL ,
    p_MM_ID            IN TREATM_PARAM.MM_ID%type DEFAULT NULL ,
    p_FROM_DATE        IN TREATM_PARAM.FROM_DATE%type DEFAULT NULL ,
    p_TREATM_PARAM1_ID IN TREATM_PARAM.TREATM_PARAM1_ID%type DEFAULT NULL ,
    p_W_PARAM_TYPE     IN TREATM_PARAM.W_PARAM_TYPE%type DEFAULT NULL ,
    p_CRD              IN TREATM_PARAM.CRD%type DEFAULT NULL ,
    p_VALUE_TYPE_ID    IN TREATM_PARAM.VALUE_TYPE_ID%type DEFAULT NULL ,
    p_MDD              IN TREATM_PARAM.MDD%type DEFAULT NULL ,
    p_TREATM_ID        IN TREATM_PARAM.TREATM_ID%type DEFAULT NULL ,
    p_VALUE            IN TREATM_PARAM.VALUE%type DEFAULT NULL ,
    p_PARAM_TYPE_ID    IN TREATM_PARAM.PARAM_TYPE_ID%type ,
    p_EPI_ID           IN TREATM_PARAM.EPI_ID%type
  )
IS
v_TREATM_PARAM_ROW TREATM_PARAM%ROWTYPE;
v_treatm_param_id number(12,0);
BEGIN
  select * into v_TREATM_PARAM_ROW FROM TREATM_PARAM where treatm_param_id = p_TREATM_PARAM_ID;
  if v_TREATM_PARAM_ROW.status_id = 918
     and ( 
     
           p_TREATM_PARAM1_ID != v_treatm_param_row.TREATM_PARAM1_ID 
        or p_SUBJ_TYPE_id        !=v_treatm_param_row.SUBJ_TYPE_ID 
        or p_SUBJ_ID            !=v_treatm_param_row.SUBJ_ID
        or p_PARAM_TYPE_ID      !=v_treatm_param_row.PARAM_TYPE_ID
        or p_VALUE_TYPE_ID      !=v_treatm_param_row.VALUE_TYPE_ID
        or p_VALUE              !=v_treatm_param_row.VALUE
        or p_UNIT_TYPE_ID       !=v_treatm_param_row.UNIT_TYPE_ID       
     )
     then   
     update treatm_param set to_date = SYSDATE, status_id = 919;
     select seq_base.nextval into v_treatm_param_id from dual;
    ins(  
          p_TREATM_PARAM_ID  => v_treatm_param_id,
          p_STATUS_ID        => p_STATUS_ID,
          p_TO_DATE          => p_TO_DATE,
          p_SUBJ_ID          => p_SUBJ_ID ,
          p_UNIT_TYPE_ID     => p_UNIT_TYPE_ID,
          p_DESCRIPTION      => p_DESCRIPTION,
          p_SUBJ_TYPE_ID     => p_SUBJ_TYPE_ID,
          p_ORDER_NO         => p_ORDER_NO,
          p_MM_ID            => p_MM_ID,
          p_FROM_DATE        => SYSDATE +1,
          p_TREATM_PARAM1_ID => p_TREATM_PARAM1_ID,
          p_VALUE_TYPE_ID    => p_VALUE_TYPE_ID,
          p_TREATM_ID        => p_TREATM_ID ,
          p_VALUE            => p_VALUE ,
          p_PARAM_TYPE_ID    => p_PARAM_TYPE_ID ,
          p_EPI_ID           => p_EPI_ID );
     
  else 
  UPDATE TREATM_PARAM
  SET CRU               = p_CRU ,
    STATUS_ID           = p_STATUS_ID ,
    TO_DATE             = p_TO_DATE ,
    SUBJ_ID             = p_SUBJ_ID ,
    UNIT_TYPE_ID        = p_UNIT_TYPE_ID ,
    DESCRIPTION         = p_DESCRIPTION ,
    SUBJ_TYPE_ID        = p_SUBJ_TYPE_ID ,
    MDU                 = p_MDU ,
    ORDER_NO            = p_ORDER_NO ,
    MM_ID               = p_MM_ID ,
    FROM_DATE           = p_FROM_DATE ,
    TREATM_PARAM1_ID    = p_TREATM_PARAM1_ID ,
    W_PARAM_TYPE        = p_W_PARAM_TYPE ,
    CRD                 = p_CRD ,
    VALUE_TYPE_ID       = p_VALUE_TYPE_ID ,
    MDD                 = p_MDD ,
    TREATM_ID           = p_TREATM_ID ,
    VALUE               = p_VALUE ,
    PARAM_TYPE_ID       = p_PARAM_TYPE_ID ,
    EPI_ID              = p_EPI_ID
  WHERE TREATM_PARAM_ID = p_TREATM_PARAM_ID;
  end if;
END;
-- del
PROCEDURE del(
    p_TREATM_PARAM_ID IN TREATM_PARAM.TREATM_PARAM_ID%type )
IS
BEGIN
  DELETE FROM TREATM_PARAM WHERE TREATM_PARAM_ID = p_TREATM_PARAM_ID;
END;

PROCEDURE invalidate(p_PARAM_ID_TO_INVALIDATE IN treatm_param.treatm_param_id%TYPE)
  IS
  v_status_id treatm_param.status_id%TYPE;
  BEGIN
    SELECT status_id INTO v_status_id FROM treatm_param WHERE treatm_param_id = p_param_id_to_invalidate;
    IF v_status_id = 917 THEN 
      treatm_param_tapi.del(p_param_id_to_invalidate);
    END IF;
    UPDATE treatm_param 
      SET status_id = 919
      WHERE treatm_param_id = p_PARAM_ID_TO_INVALIDATE;
    
  END;
  
  
    
END TREATM_PARAM_tapi;

/
