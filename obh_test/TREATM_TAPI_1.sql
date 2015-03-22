--------------------------------------------------------
--  DDL for Package Body TREATM_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "TREATM_TAPI" 
IS
  -- insert
PROCEDURE ins(
      p_TIME_START         IN TREATM.TIME_START%type DEFAULT NULL ,
      p_SUBJ2_ID           IN TREATM.SUBJ2_ID%type DEFAULT NULL ,
      p_CRU                IN TREATM.CRU%type DEFAULT NULL ,
      p_STATE_START_ID     IN TREATM.STATE_START_ID%type DEFAULT NULL ,
      p_TO_DATE            IN TREATM.TO_DATE%type DEFAULT NULL ,
      p_STATUS_ID          IN TREATM.STATUS_ID%type DEFAULT NULL ,
      p_MDU                IN TREATM.MDU%type DEFAULT NULL ,
      p_TREATM_CATEGORY_ID IN TREATM.TREATM_CATEGORY_ID%type DEFAULT NULL ,
      p_STATE_END_ID       IN TREATM.STATE_END_ID%type DEFAULT NULL ,
      p_TYPE2_ID           IN TREATM.TYPE2_ID%type DEFAULT NULL ,
      p_TREATM_GROUP_ID    IN TREATM.TREATM_GROUP_ID%type DEFAULT NULL ,
      p_TREATM_NAME        IN TREATM.TREATM_NAME%type DEFAULT NULL ,
      p_MDD                IN TREATM.MDD%type DEFAULT NULL ,
      p_TREATM_ID          IN TREATM.TREATM_ID%type ,
      p_TREATM_NAME_ID     IN TREATM.TREATM_NAME_ID%type DEFAULT NULL ,
      p_WK_NAME            IN TREATM.WK_NAME%type DEFAULT NULL ,
      p_DESCRIPTION        IN TREATM.DESCRIPTION%type DEFAULT NULL ,
      p_DATA_OWNER_ID      IN TREATM.DATA_OWNER_ID%type DEFAULT NULL ,
      p_MM_ID              IN TREATM.MM_ID%type DEFAULT NULL ,
      p_WK_TB_CODE         IN TREATM.WK_TB_CODE%type DEFAULT NULL ,
      p_WK_COMMENT         IN TREATM.WK_COMMENT%type DEFAULT NULL ,
      p_FROM_DATE          IN TREATM.FROM_DATE%type DEFAULT NULL ,
      p_TYPE1_ID           IN TREATM.TYPE1_ID%type DEFAULT NULL ,
      p_CRD                IN TREATM.CRD%type DEFAULT NULL ,
      p_SUBJ1_ID           IN TREATM.SUBJ1_ID%type DEFAULT NULL ,
      p_TIME_END           IN TREATM.TIME_END%type DEFAULT NULL ,
      p_EPI_ID             IN TREATM.EPI_ID%type DEFAULT NULL ,
      p_TREATM_TYPE_ID     IN TREATM.TREATM_TYPE_ID%type DEFAULT NULL )
IS
  v_treatm_id TREATM.TREATM_ID%TYPE;
  v_error_text VARCHAR2 (2000);
BEGIN

  IF p_treatm_id IS NULL THEN 
    select seq_base.nextval into v_treatm_id FROM dual d;
  ELSE
    v_treatm_id := p_treatm_id;
    END IF;
  IF p_status_id != 921 THEN 
    v_error_text := apex_condtion
                    (
                           p_treatm_id => p_treatm_id,
                           p_treatm_name => p_treatm_name,
                           p_treatm_group_id => p_treatm_group_id ,
                           p_TREATM_TYPE_ID => p_TREATM_TYPE_ID,
                           p_TREATM_CATEGORY_ID => p_TREATM_CATEGORY_ID,
                           p_TYPE1_ID => p_TYPE1_ID,
                           p_TYPE2_ID => p_TYPE2_ID,
                           p_SUBJ1_ID => p_SUBJ1_ID ,
                           p_SUBJ2_ID => p_SUBJ2_ID,
                           p_STATE_START_ID => p_STATE_START_ID,
                           p_STATE_END_ID => p_STATE_END_ID ,
                           p_TIME_START => p_TIME_START ,
                           p_TIME_END => p_TIME_END,
                           p_from_date => p_from_date,
                           p_to_date => p_to_date,
                           p_STATUS_ID => p_STATUS_ID
                    );
    IF v_error_text != NULL THEN
      RAISE_APPLICATION_ERROR(-20000,v_error_text); 
    END IF;  
  END IF;
  INSERT
  INTO TREATM
    (
      TIME_START ,
      SUBJ2_ID ,
      CRU ,
      STATE_START_ID ,
      TO_DATE ,
      STATUS_ID ,
      MDU ,
      TREATM_CATEGORY_ID ,
      STATE_END_ID ,
      TYPE2_ID ,
      TREATM_GROUP_ID ,
      TREATM_NAME ,
      MDD ,
      TREATM_ID ,
      TREATM_NAME_ID ,
      WK_NAME ,
      DESCRIPTION ,
      DATA_OWNER_ID ,
      MM_ID ,
      WK_TB_CODE ,
      WK_COMMENT ,
      FROM_DATE ,
      TYPE1_ID ,
      CRD ,
      SUBJ1_ID ,
      TIME_END ,
      EPI_ID ,
      TREATM_TYPE_ID
    )
    VALUES
    (
      p_TIME_START ,
      p_SUBJ2_ID ,
      p_CRU ,
      p_STATE_START_ID ,
      nvl(p_to_date,to_date('2999.12.31','YYYY.MM.DD')),
      p_STATUS_ID ,
      p_MDU ,
      p_TREATM_CATEGORY_ID ,
      p_STATE_END_ID ,
      p_TYPE2_ID ,
      p_TREATM_GROUP_ID ,
      p_TREATM_NAME ,
      p_MDD ,
      v_TREATM_ID ,
      nvl(p_treatm_name_id,v_treatm_id) ,
      p_WK_NAME ,
      p_DESCRIPTION ,
      p_DATA_OWNER_ID ,
      p_MM_ID ,
      p_WK_TB_CODE ,
      p_WK_COMMENT ,
      p_FROM_DATE ,
      p_TYPE1_ID ,
      p_CRD ,
      p_SUBJ1_ID ,
      p_TIME_END ,
      p_EPI_ID ,
      p_TREATM_TYPE_ID
    );
END;
-- update
PROCEDURE upd
  (
    p_TIME_START         IN TREATM.TIME_START%type DEFAULT NULL ,
    p_SUBJ2_ID           IN TREATM.SUBJ2_ID%type DEFAULT NULL ,
    p_CRU                IN TREATM.CRU%type DEFAULT NULL ,
    p_STATE_START_ID     IN TREATM.STATE_START_ID%type DEFAULT NULL ,
    p_TO_DATE            IN TREATM.TO_DATE%type DEFAULT NULL ,
    p_STATUS_ID          IN TREATM.STATUS_ID%type DEFAULT NULL ,
    p_MDU                IN TREATM.MDU%type DEFAULT NULL ,
    p_TREATM_CATEGORY_ID IN TREATM.TREATM_CATEGORY_ID%type DEFAULT NULL ,
    p_STATE_END_ID       IN TREATM.STATE_END_ID%type DEFAULT NULL ,
    p_TYPE2_ID           IN TREATM.TYPE2_ID%type DEFAULT NULL ,
    p_TREATM_GROUP_ID    IN TREATM.TREATM_GROUP_ID%type DEFAULT NULL ,
    p_TREATM_NAME        IN TREATM.TREATM_NAME%type DEFAULT NULL ,
    p_MDD                IN TREATM.MDD%type DEFAULT NULL ,
    p_TREATM_ID          IN TREATM.TREATM_ID%type ,
    p_TREATM_NAME_ID     IN TREATM.TREATM_NAME_ID%type DEFAULT NULL ,
    p_WK_NAME            IN TREATM.WK_NAME%type DEFAULT NULL ,
    p_DESCRIPTION        IN TREATM.DESCRIPTION%type DEFAULT NULL ,
    p_DATA_OWNER_ID      IN TREATM.DATA_OWNER_ID%type DEFAULT NULL ,
    p_MM_ID              IN TREATM.MM_ID%type DEFAULT NULL ,
    p_WK_TB_CODE         IN TREATM.WK_TB_CODE%type DEFAULT NULL ,
    p_WK_COMMENT         IN TREATM.WK_COMMENT%type DEFAULT NULL ,
    p_FROM_DATE          IN TREATM.FROM_DATE%type DEFAULT NULL ,
    p_TYPE1_ID           IN TREATM.TYPE1_ID%type DEFAULT NULL ,
    p_CRD                IN TREATM.CRD%type DEFAULT NULL ,
    p_SUBJ1_ID           IN TREATM.SUBJ1_ID%type DEFAULT NULL ,
    p_TIME_END           IN TREATM.TIME_END%type DEFAULT NULL ,
    p_EPI_ID             IN TREATM.EPI_ID%type DEFAULT NULL ,
    p_TREATM_TYPE_ID     IN TREATM.TREATM_TYPE_ID%type DEFAULT NULL
  )
IS
v_error_text VARCHAR2 (2000);
v_new_treatm_id NUMBER (12,0);
v_treatm_row TREATM%ROWTYPE;

BEGIN
  IF p_status_id != 921 THEN 
    v_error_text := apex_condtion
                    (
                           p_treatm_id => p_treatm_id,
                           p_treatm_name => p_treatm_name,
                           p_treatm_group_id => p_treatm_group_id ,
                           p_TREATM_TYPE_ID => p_TREATM_TYPE_ID,
                           p_TREATM_CATEGORY_ID => p_TREATM_CATEGORY_ID,
                           p_TYPE1_ID => p_TYPE1_ID,
                           p_TYPE2_ID => p_TYPE2_ID,
                           p_SUBJ1_ID => p_SUBJ1_ID ,
                           p_SUBJ2_ID => p_SUBJ2_ID,
                           p_STATE_START_ID => p_STATE_START_ID,
                           p_STATE_END_ID => p_STATE_END_ID ,
                           p_TIME_START => p_TIME_START ,
                           p_TIME_END => p_TIME_END,
                           p_from_date => p_from_date,
                           p_to_date => p_to_date,
                           p_STATUS_ID => p_STATUS_ID
                    );
    IF v_error_text != NULL THEN
      RAISE_APPLICATION_ERROR(-20000,v_error_text); 
    END IF;  
  END IF;
  select * into v_treatm_row FROM treatm where treatm_id = p_treatm_id;
  if v_treatm_row.status_id = 918
     and ( 
           p_TREATM_NAME != v_treatm_row.TREATM_NAME 
        or p_TREATM_GROUP_ID !=v_treatm_row.TREATM_GROUP_ID
        or p_TYPE1_ID !=v_treatm_row.TYPE1_ID
        or p_SUBJ1_ID !=v_treatm_row.SUBJ1_ID
        or p_TYPE2_ID !=v_treatm_row.TYPE2_ID
        or p_SUBJ2_ID !=v_treatm_row.SUBJ2_ID
        or p_TREATM_CATEGORY_ID !=v_treatm_row.TREATM_CATEGORY_ID
        or p_TREATM_TYPE_ID !=v_treatm_row.TREATM_TYPE_ID
        or p_STATE_START_ID !=v_treatm_row.STATE_START_ID
        or p_STATE_END_ID !=v_treatm_row.STATE_END_ID
     )
     then    
    select seq_base.NEXTVAL INTO v_new_treatm_id from dual;   
    update TREATM SET STATUS_ID = 919,TO_DATE = SYSDATE where TREATM_ID = p_TREATM_ID;
    ins(
      p_TIME_START         => p_TIME_START,
      p_SUBJ2_ID           => p_SUBJ2_ID,
      p_STATE_START_ID     => p_STATE_START_ID,
      p_TO_DATE            => p_TO_DATE ,
      p_STATUS_ID          => p_STATUS_ID   ,
      p_TREATM_CATEGORY_ID => p_TREATM_CATEGORY_ID  ,
      p_STATE_END_ID       => p_STATE_END_ID,
      p_TYPE2_ID           => p_TYPE2_ID,
      p_TREATM_GROUP_ID    => p_TREATM_GROUP_ID,
      p_TREATM_NAME        => p_TREATM_NAME,
      p_TREATM_ID          => v_new_treatm_id,
      p_TREATM_NAME_ID     => p_TREATM_NAME_ID,
      p_DESCRIPTION        => p_DESCRIPTION,
      p_DATA_OWNER_ID      => p_DATA_OWNER_ID,
      p_MM_ID              => p_MM_ID,
      p_FROM_DATE          => SYSDATE + 1,
      p_TYPE1_ID           => p_TYPE1_ID,
      p_SUBJ1_ID           => p_SUBJ1_ID,
      p_TIME_END           => p_TIME_END,
      p_EPI_ID             => p_EPI_ID,
      p_TREATM_TYPE_ID     => p_TREATM_TYPE_ID);
      
  else
  UPDATE TREATM
  SET TIME_START       = p_TIME_START ,
    SUBJ2_ID           = p_SUBJ2_ID ,
    CRU                = p_CRU ,
    STATE_START_ID     = p_STATE_START_ID ,
    TO_DATE            = p_TO_DATE ,
    STATUS_ID          = p_STATUS_ID ,
    MDU                = p_MDU ,
    TREATM_CATEGORY_ID = p_TREATM_CATEGORY_ID ,
    STATE_END_ID       = p_STATE_END_ID ,
    TYPE2_ID           = p_TYPE2_ID ,
    TREATM_GROUP_ID    = p_TREATM_GROUP_ID ,
    TREATM_NAME        = p_TREATM_NAME ,
    MDD                = p_MDD ,
    TREATM_NAME_ID     = p_TREATM_NAME_ID ,
    WK_NAME            = p_WK_NAME ,
    DESCRIPTION        = p_DESCRIPTION ,
    DATA_OWNER_ID      = p_DATA_OWNER_ID ,
    MM_ID              = p_MM_ID ,
    WK_TB_CODE         = p_WK_TB_CODE ,
    WK_COMMENT         = p_WK_COMMENT ,
    FROM_DATE          = p_FROM_DATE ,
    TYPE1_ID           = p_TYPE1_ID ,
    CRD                = p_CRD ,
    SUBJ1_ID           = p_SUBJ1_ID ,
    TIME_END           = p_TIME_END ,
    EPI_ID             = p_EPI_ID ,
    TREATM_TYPE_ID     = p_TREATM_TYPE_ID
  WHERE TREATM_ID      = p_TREATM_ID;
end if;
END;
-- del
PROCEDURE del(
    p_TREATM_ID IN TREATM.TREATM_ID%type )
IS
BEGIN
  DELETE FROM TREATM WHERE TREATM_ID = p_TREATM_ID;
END;
-- invalidate
PROCEDURE invalidate(p_treatm_id_to_invalidate IN TREATM.TREATM_ID%TYPE)
IS
v_treatm_row TREATM%ROWTYPE;
BEGIN
  INSERT INTO wk_pf_audit_table values ('p_treatm_id_to_invalidate',p_treatm_id_to_invalidate);
  select * into v_treatm_row from treatm where treatm_id = p_treatm_id_to_invalidate;
  INSERT INTO wk_pf_audit_table values ('v_treatm_row.status_id',v_treatm_row.status_id );
  if(v_treatm_row.status_id = 917) then
    delete from treatm_param where treatm_id = p_treatm_id_to_invalidate;
    del(p_treatm_id_to_invalidate);
  else 
  UPDATE TREATM
    SET status_id = 919
    WHERE treatm_id = p_treatm_id_to_invalidate;
  UPDATE TREATM_PARAM
    SET status_id = 919
    WHERE treatm_id = p_treatm_id_to_invalidate;
  end if;
END;
--copy
FUNCTION copy(p_TREATM_ID IN TREATM.TREATM_ID%TYPE,
              p_TREATM_GROUP_ID  IN TREATM.TREATM_GROUP_ID%TYPE,
              p_copy_type VARCHAR2 DEFAULT 'P304_LEVEL') RETURN NUMBER
IS
  
  BEGIN
    
    IF p_treatm_id IS NULL THEN
      RETURN NULL;
    END IF;
    IF p_copy_type = 'P304_LEVEL' THEN
      RETURN copy_tree(p_TREATM_ID,p_TREATM_GROUP_ID);
    ELSIF p_copy_type = 'P304_TREE' THEN
      RETURN copy_tree(p_TREATM_ID,p_TREATM_GROUP_ID); 
    ELSIF p_copy_type = 'P304_LEAF' THEN
      RETURN copy_tree(p_TREATM_ID,p_TREATM_GROUP_ID);   
    ELSE 
      raise_application_error(-20000,'Nem implementált másolás típus:'||p_copy_type); 
    END IF; 
  END;
  

FUNCTION copy_n(p_TREATM_ROW IN TREATM%ROWTYPE,
                  p_TREATM_GROUP_ID  IN TREATM.TREATM_GROUP_ID%type)RETURN NUMBER
    IS
      v_teatm_id TREATM.TREATM_ID%TYPE;
      v_param_id NUMBER;
    BEGIN
      SELECT seq_base.nextval INTO v_teatm_id FROM dual d;
      ins(
            p_TIME_START => p_treatm_row.TIME_START, 
            p_SUBJ2_ID => p_treatm_row.SUBJ2_ID ,
            p_STATE_START_ID => p_treatm_row.STATE_START_ID ,
            p_TO_DATE => p_treatm_row.TO_DATE  ,
            p_STATUS_ID => 921 ,
            p_TREATM_CATEGORY_ID => p_treatm_row.TREATM_CATEGORY_ID  ,
            p_STATE_END_ID => p_treatm_row.STATE_END_ID,
            p_TYPE2_ID  => p_treatm_row.TYPE2_ID ,
            p_treatm_group_id => p_treatm_group_id ,
            p_TREATM_NAME => p_treatm_row.TREATM_NAME ,
            p_TREATM_ID =>   v_teatm_id,
            p_TREATM_NAME_ID  => p_treatm_row.TREATM_NAME_ID ,
            p_DESCRIPTION     => 'forrás:'||p_treatm_row.TREATM_NAME || ' ' ||p_treatm_row.DESCRIPTION,
            p_DATA_OWNER_ID => p_treatm_row.DATA_OWNER_ID ,
            p_MM_ID => p_treatm_row.MM_ID ,
            p_FROM_DATE => p_treatm_row.FROM_DATE ,
            p_TYPE1_ID => p_treatm_row.TYPE1_ID,
            p_SUBJ1_ID => p_treatm_row.SUBJ1_ID ,
            p_TIME_END => p_treatm_row.TIME_END ,
            p_EPI_ID  => p_treatm_row.EPI_ID ,
            p_TREATM_TYPE_ID  => p_treatm_row.TREATM_TYPE_ID );

           FOR param IN (SELECT * FROM treatm_param WHERE p_treatm_row.treatm_id = treatm_param.treatm_id)
             LOOP
               select seq_base.nextval INTO v_param_id FROM dual;
               treatm_param_tapi.ins(
    
                  p_TREATM_PARAM_ID => v_param_id ,
                  p_STATUS_ID       => 921 ,
                  p_TO_DATE         => param.TO_DATE ,
                  p_SUBJ_ID         => param.SUBJ_ID  ,
                  p_UNIT_TYPE_ID    => param.UNIT_TYPE_ID ,
                  p_DESCRIPTION     => param.DESCRIPTION ,
                  p_SUBJ_TYPE_ID    => param.SUBJ_TYPE_ID ,
                  p_ORDER_NO        => param.ORDER_NO  ,
                  p_MM_ID           => param.MM_ID ,
                  p_FROM_DATE       => param.FROM_DATE ,
                  p_treatm_param1_id => param.TREATM_PARAM_ID ,
                  p_VALUE_TYPE_ID   => param.VALUE_TYPE_ID ,
                  p_TREATM_ID       => v_teatm_id ,
                  p_VALUE           => param.VALUE ,
                  p_PARAM_TYPE_ID   => param.PARAM_TYPE_ID,
                  p_EPI_ID          => param.EPI_ID );
              END LOOP;

           FOR child IN (SELECT treatm_id1 FROM treatm_rel WHERE p_treatm_row.treatm_id = treatm_rel.treatm_id2)
            LOOP
              
              treatm_rel_tapi.ins(
                                    p_TREATM_ID2   => v_teatm_id ,
                                    p_TREATM_ID1   => child.TREATM_ID1,
                                    p_REL_TYPE_ID  => 1610,
                                    p_Status_id    => 921
                                );

            END LOOP;

       RETURN v_teatm_id;
    END;

FUNCTION   copy_tree(p_TREATM_ID IN TREATM.TREATM_ID%TYPE,
                p_TREATM_GROUP_ID  IN TREATM.TREATM_GROUP_ID%type)RETURN NUMBER
    IS
    v_teatm_id TREATM.TREATM_ID%TYPE;
    v_child_id TREATM.TREATM_ID%TYPE;
    v_treatm_row treatm%ROWTYPE;
    v_param_id treatm_param.treatm_param_id%TYPE;
    v_cnt NUMBER (12,0);
    v_new_treatm_id NUMBER(12,0);
    BEGIN
     
      SELECT count(1) INTO v_cnt FROM treatm_copy_temp WHERE treatm_id =  p_treatm_id;
      IF v_cnt > 0 THEN
        select new_treatm_id INTO v_new_treatm_id from treatm_copy_temp WHERE treatm_id =  p_treatm_id;
        RETURN (v_new_treatm_id);
      END IF;

      SELECT seq_base.nextval INTO v_teatm_id FROM dual d;
      SELECT * INTO v_treatm_row FROM treatm WHERE treatm_id = p_TREATM_ID;
      INSERT INTO treatm_copy_temp (treatm_id,new_treatm_id) VALUES (p_treatm_id,v_teatm_id);

     ins(
    p_TIME_START => v_treatm_row.TIME_START, 
    p_SUBJ2_ID => v_treatm_row.SUBJ2_ID ,
    p_STATE_START_ID => v_treatm_row.STATE_START_ID ,
    p_TO_DATE => v_treatm_row.TO_DATE  ,
    p_STATUS_ID => 921 ,
    p_TREATM_CATEGORY_ID => v_treatm_row.TREATM_CATEGORY_ID  ,
    p_STATE_END_ID => v_treatm_row.STATE_END_ID,
    p_TYPE2_ID  => v_treatm_row.TYPE2_ID ,
    p_treatm_group_id => p_treatm_group_id ,
    p_TREATM_NAME => v_treatm_row.TREATM_NAME ,
    p_TREATM_ID =>   v_teatm_id,
    p_TREATM_NAME_ID  => v_treatm_row.TREATM_NAME_ID ,
    p_DESCRIPTION     => 'forrás:'||v_treatm_row.TREATM_NAME || ' ' ||v_treatm_row.DESCRIPTION,
    p_DATA_OWNER_ID => v_treatm_row.DATA_OWNER_ID ,
    p_MM_ID => v_treatm_row.MM_ID ,
    p_FROM_DATE => v_treatm_row.FROM_DATE ,
    p_TYPE1_ID => v_treatm_row.TYPE1_ID,
    p_SUBJ1_ID => v_treatm_row.SUBJ1_ID ,
    p_TIME_END => v_treatm_row.TIME_END ,
    p_EPI_ID  => v_treatm_row.EPI_ID ,
    p_TREATM_TYPE_ID  => v_treatm_row.TREATM_TYPE_ID );

    FOR param IN (SELECT * FROM treatm_param WHERE v_treatm_row.treatm_id = treatm_param.treatm_id)
      LOOP
      select seq_base.nextval INTO v_param_id FROM dual;
      treatm_param_tapi.ins(
    
    p_TREATM_PARAM_ID => v_param_id ,
    p_STATUS_ID       => 921 ,
    p_TO_DATE         => param.TO_DATE ,
    p_SUBJ_ID         => param.SUBJ_ID  ,
    p_UNIT_TYPE_ID    => param.UNIT_TYPE_ID ,
    p_DESCRIPTION     => param.DESCRIPTION ,
    p_SUBJ_TYPE_ID    => param.SUBJ_TYPE_ID ,
    p_ORDER_NO        => param.ORDER_NO  ,
    p_MM_ID           => param.MM_ID ,
    p_FROM_DATE       => param.FROM_DATE ,
    p_treatm_param1_id => param.TREATM_PARAM_ID ,
    p_VALUE_TYPE_ID   => param.VALUE_TYPE_ID ,
    p_TREATM_ID       => v_teatm_id ,
    p_VALUE           => param.VALUE ,
    p_PARAM_TYPE_ID   => param.PARAM_TYPE_ID,
    p_EPI_ID          => param.EPI_ID );

      END LOOP;

      FOR child IN (SELECT treatm_id1 FROM treatm_rel WHERE v_treatm_row.treatm_id = treatm_rel.treatm_id2)
        LOOP
         v_child_id := copy_tree(child.treatm_id1,p_treatm_group_id);
         treatm_rel_tapi.ins(
            p_TREATM_ID2   => v_teatm_id ,
            p_TREATM_ID1   => v_child_id ,
            p_REL_TYPE_ID  => 1610,
            p_Status_id    => 921
        );

        END LOOP;

      RETURN v_teatm_id;
    END;

  PROCEDURE activate(p_TREATM_ID IN TREATM.TREATM_ID%TYPE)
    IS
    v_treatm_row treatm%ROWTYPE;
    v_param_id treatm_param.treatm_param_id%TYPE;
    v_cnt NUMBER (12,0);
    v_error_text VARCHAR2(2000);
    BEGIN   
      /*  
      SELECT count(1) INTO v_cnt FROM treatm_copy_temp WHERE treatm_id =  p_treatm_id;
      IF v_cnt > 0 THEN
        RETURN;
      END IF;
      */
      BEGIN
        SELECT * into v_treatm_row FROM treatm  WHERE p_treatm_id = treatm_id;
       EXCEPTION
        WHEN OTHERS THEN
           raise_application_error(-20000,'Nem lelt ilyen treatment_id-t:'||p_treatm_id);
      END;
      v_error_text := apex_condtion
                    (
                           p_treatm_id          => v_treatm_row.treatm_id,
                           p_treatm_name        => v_treatm_row.treatm_name,
                           p_treatm_group_id    => v_treatm_row.treatm_group_id ,
                           p_TREATM_TYPE_ID     => v_treatm_row.TREATM_TYPE_ID,
                           p_TREATM_CATEGORY_ID => v_treatm_row.TREATM_CATEGORY_ID,
                           p_TYPE1_ID           => v_treatm_row.TYPE1_ID,
                           p_TYPE2_ID           => v_treatm_row.TYPE2_ID,
                           p_SUBJ1_ID           => v_treatm_row.SUBJ1_ID ,
                           p_SUBJ2_ID           => v_treatm_row.SUBJ2_ID,
                           p_STATE_START_ID     => v_treatm_row.STATE_START_ID,
                           p_STATE_END_ID       => v_treatm_row.STATE_END_ID ,
                           p_TIME_START         => v_treatm_row.TIME_START ,
                           p_TIME_END           => v_treatm_row.TIME_END,
                           p_from_date          => v_treatm_row.from_date,
                           p_to_date            => v_treatm_row.to_date,
                           p_STATUS_ID          => 917
                    );
    IF v_error_text != NULL THEN
      RAISE_APPLICATION_ERROR(-20000,v_error_text); 
    END IF;  
      --INSERT INTO treatm_copy_temp (treatm_id,new_treatm_id) VALUES (p_treatm_id,null);
      update treatm SET status_id = 917 where treatm_id = p_treatm_id;
      UPDATE treatm_param SET status_id = 917 where treatm_id = p_treatm_id;
      UPDATE treatm_rel SET status_id = 917 WHERE p_treatm_id = treatm_rel.treatm_id2; 
      FOR child IN (SELECT treatm_id1 FROM treatm_rel WHERE p_treatm_id = treatm_rel.treatm_id2)
        LOOP
         activate(child.treatm_id1);
        END LOOP;
    END;
    

FUNCTION apex_condtion(  p_treatm_id treatm.treatm_id%TYPE DEFAULT NULL,
                           p_treatm_name TREATM.TREATM_NAME%TYPE,
                           p_treatm_group_id TREATM.TREATM_GROUP_ID%TYPE,
                           p_TREATM_TYPE_ID TREATM.TREATM_TYPE_ID%TYPE,
                           p_TREATM_CATEGORY_ID TREATM.TREATM_CATEGORY_ID%TYPE,
                           p_TYPE1_ID TREATM.TYPE1_ID%TYPE,
                           p_TYPE2_ID TREATM.TYPE2_ID%TYPE,
                           p_SUBJ1_ID TREATM.SUBJ1_ID%TYPE  DEFAULT NULL,
                           p_SUBJ2_ID TREATM.SUBJ2_ID%TYPE  DEFAULT NULL,
                           p_STATE_START_ID treatm.state_start_id%TYPE DEFAULT NULL,
                           p_STATE_END_ID treatm.state_end_id%TYPE DEFAULT NULL,
                           p_TIME_START treatm.TIME_START%TYPE DEFAULT NULL,
                           p_TIME_END treatm.time_end%TYPE DEFAULT NULL,
                           p_from_date treatm.from_date%TYPE,
                           p_to_date treatm.to_date%TYPE,
                           p_STATUS_ID treatm.status_id%TYPE
                       ) RETURN VARCHAR2
IS
  BEGIN
    EXECUTE IMMEDIATE('TRUNCATE TABLE wk_pf_audit_table');
    INSERT INTO wk_pf_audit_table VALUES ('p_treatm_id',p_treatm_id);
    INSERT INTO wk_pf_audit_table VALUES ('p_treatm_name',p_treatm_name);
    INSERT INTO wk_pf_audit_table VALUES ('p_treatm_group_id',p_treatm_group_id);
    INSERT INTO wk_pf_audit_table VALUES ('p_TREATM_TYPE_ID',p_TREATM_TYPE_ID);
    INSERT INTO wk_pf_audit_table VALUES ('p_TREATM_CATEGORY_ID',p_TREATM_CATEGORY_ID);
    INSERT INTO wk_pf_audit_table VALUES ('p_TYPE1_ID',p_TYPE1_ID);
    INSERT INTO wk_pf_audit_table VALUES ('p_TYPE2_ID',p_TYPE2_ID);
    INSERT INTO wk_pf_audit_table VALUES ('p_SUBJ2_ID',p_SUBJ2_ID);
    INSERT INTO wk_pf_audit_table VALUES ('p_STATE_START_ID',p_STATE_START_ID);
    INSERT INTO wk_pf_audit_table VALUES ('p_STATE_END_ID',p_STATE_END_ID);
    INSERT INTO wk_pf_audit_table VALUES ('p_STATE_END_ID',p_STATE_END_ID);
    INSERT INTO wk_pf_audit_table VALUES ('p_TIME_START',p_STATE_END_ID);
    INSERT INTO wk_pf_audit_table VALUES ('p_TIME_END',p_STATE_END_ID);
    INSERT INTO wk_pf_audit_table VALUES ('p_STATE_END_ID',p_STATE_END_ID);
    INSERT INTO wk_pf_audit_table VALUES ('p_from_date',p_from_date);
    INSERT INTO wk_pf_audit_table VALUES ('p_to_date',p_to_date);
    INSERT INTO wk_pf_audit_table VALUES ('p_STATUS_ID',p_STATUS_ID);
    COMMIT;

    IF p_from_date > p_to_date THEN 
        
        INSERT INTO wk_pf_audit_table VALUES ('hiba','A záró dátum nem lehet kisebb a kezdő dátumnál');
        COMMIT;
        RETURN 'A záró dátum nem lehet kisebb a kezdő dátumnál';
    END IF;
    IF p_treatm_group_id  = 1601 THEN /*Norma*/
        RETURN apex_condtion_norma(  
                           p_treatm_id => p_treatm_id,
                           p_treatm_name => p_treatm_name,
                           p_treatm_group_id => p_treatm_group_id,
                           p_TREATM_TYPE_ID => p_TREATM_TYPE_ID,
                           p_TREATM_CATEGORY_ID => p_TREATM_CATEGORY_ID,
                           p_TYPE1_ID => p_TYPE1_ID,
                           p_TYPE2_ID => p_TYPE2_ID,
                           p_from_date => p_from_date,
                           p_to_date => p_to_date,
                           p_STATUS_ID => p_STATUS_ID
                       );
      ELSE 
         RETURN apex_condtion_other(  
                           p_treatm_id  => p_treatm_id,
                           p_treatm_name  => p_treatm_name,
                           p_treatm_group_id  => p_treatm_group_id,
                           p_TREATM_TYPE_ID  => p_TREATM_TYPE_ID ,
                           p_TREATM_CATEGORY_ID => p_TREATM_CATEGORY_ID,
                           p_TYPE1_ID  => p_TYPE1_ID,
                           p_TYPE2_ID  => p_TYPE2_ID,
                           p_SUBJ1_ID  => p_SUBJ1_ID,
                           p_SUBJ2_ID  => p_SUBJ2_ID,
                           p_STATE_START_ID  => p_STATE_START_ID,
                           p_STATE_END_ID  => p_STATE_END_ID,
                           p_TIME_START  => p_TIME_START,
                           p_TIME_END  => p_TIME_END,
                           p_from_date  => p_from_date,
                           p_to_date  => p_to_date,
                           p_STATUS_ID  => p_STATUS_ID
                       );
    END IF;


  END; 


FUNCTION apex_condtion_norma(  p_treatm_id treatm.treatm_id%TYPE DEFAULT NULL,
                           p_treatm_name TREATM.TREATM_NAME%TYPE,
                           p_treatm_group_id TREATM.TREATM_GROUP_ID%TYPE,
                           p_TREATM_TYPE_ID TREATM.TREATM_TYPE_ID%TYPE,
                           p_TREATM_CATEGORY_ID TREATM.TREATM_CATEGORY_ID%TYPE,
                           p_TYPE1_ID TREATM.TYPE1_ID%TYPE,
                           p_TYPE2_ID TREATM.TYPE2_ID%TYPE,
                           p_from_date treatm.from_date%TYPE,
                           p_to_date treatm.to_date%TYPE,
                           p_STATUS_ID treatm.status_id%TYPE
                       ) RETURN VARCHAR2
is
  l_rows pls_integer;
  v_error_text VARCHAR2(2000) := 'Már létezik sor a következő értékekkel';
  BEGIN
    SELECT count(1) INTO l_rows FROM treatm 
      WHERE  
      TREATM.TREATM_GROUP_ID = p_treatm_group_id
      AND (p_treatm_id IS NULL OR p_treatm_id != treatm_id)
      AND TREATM.TREATM_NAME = p_treatm_name 
      AND TREATM.TREATM_TYPE_ID = p_TREATM_TYPE_ID
      AND TREATM.TREATM_CATEGORY_ID = p_TREATM_CATEGORY_ID
      AND TREATM.TYPE1_ID = p_TYPE1_ID
      AND TREATM.TYPE2_ID = p_TYPE2_ID 
      AND NOT  DATE_INTERVALL.OVERLAP(FROM_DATE, TO_DATE, p_from_date, p_to_date) = -1
      AND STATUS_ID NOT IN (919,921);     
      IF l_rows > 0 THEN 
        v_error_text := v_error_text ||  '<br/>&emsp;p_treatm_group_id    :'|| lookup_super_type_name(p_treatm_group_id);
        v_error_text := v_error_text ||  '<br/>&emsp;p_treatm_name        :'|| p_treatm_name;
        v_error_text := v_error_text ||  '<br/>&emsp;p_treatm_type_id     :'|| lookup_super_type_name(p_TREATM_TYPE_ID);   
        v_error_text := v_error_text ||  '<br/>&emsp;p_treatm_category_id :'|| lookup_super_type_name(p_TREATM_CATEGORY_ID);
        v_error_text := v_error_text ||  '<br/>&emsp;p__type1_id          :'|| lookup_super_type_name(p_TYPE1_ID);
        v_error_text := v_error_text ||  '<br/>&emsp;p_type2_id           :'|| lookup_super_type_name(p_TYPE2_ID);       
        v_error_text := v_error_text ||  '<br/>&emsp;p_from_date          :'|| to_char(p_from_date,'YYYY.MM.DD');
        v_error_text := v_error_text ||  '<br/>&emsp;p_to_date            :'|| to_char(p_to_date,'YYYY.MM.DD');
       -- v_error_text := v_error_text ||  '<br/>&emsp;p_status_id          :'|| lookup_super_type_name(p_STATUS_ID);
        RETURN v_error_text;
      END IF;      
    RETURN NULL;
  END;

  FUNCTION apex_condtion_other(  
                           p_treatm_id treatm.treatm_id%TYPE DEFAULT NULL,
                           p_treatm_name TREATM.TREATM_NAME%TYPE,
                           p_treatm_group_id TREATM.TREATM_GROUP_ID%TYPE,
                           p_TREATM_TYPE_ID TREATM.TREATM_TYPE_ID%TYPE,
                           p_TREATM_CATEGORY_ID TREATM.TREATM_CATEGORY_ID%TYPE,
                           p_TYPE1_ID TREATM.TYPE1_ID%TYPE,
                           p_TYPE2_ID TREATM.TYPE2_ID%TYPE,
                           p_SUBJ1_ID TREATM.SUBJ1_ID%TYPE  DEFAULT NULL,
                           p_SUBJ2_ID TREATM.SUBJ2_ID%TYPE  DEFAULT NULL,
                           p_STATE_START_ID treatm.state_start_id%TYPE DEFAULT NULL,
                           p_STATE_END_ID treatm.state_end_id%TYPE DEFAULT NULL,
                           p_TIME_START treatm.TIME_START%TYPE DEFAULT NULL,
                           p_TIME_END treatm.time_end%TYPE DEFAULT NULL,
                           p_from_date treatm.from_date%TYPE,
                           p_to_date treatm.to_date%TYPE,
                           p_STATUS_ID treatm.status_id%TYPE
                       ) RETURN VARCHAR2
    AS
    l_rows pls_integer;
    v_error_text VARCHAR2(2000) := 'Már létezik sor a következő értékekkel';
    BEGIN 
      SELECT count(1) INTO l_rows FROM treatm 
      WHERE  
      TREATM.TREATM_GROUP_ID = p_treatm_group_id
      AND (p_treatm_id IS NULL OR p_treatm_id != treatm_id)
      AND TREATM.TREATM_NAME = p_treatm_name 
      AND TREATM.TREATM_TYPE_ID = p_TREATM_TYPE_ID
      AND TREATM.TREATM_CATEGORY_ID = p_TREATM_CATEGORY_ID
      AND TREATM.TYPE1_ID = p_TYPE1_ID
      AND TREATM.TYPE2_ID = p_TYPE2_ID 
      AND nvl(treatm.subj1_id,-1) = nvl(p_subj1_id,-1)
      AND nvl(treatm.subj2_id,-1) = nvl(p_subj2_id,-1)
      AND nvl(treatm.state_start_id,-1) = nvl( p_state_start_id,-1 )
      AND nvl(treatm.state_end_id,-1) = nvl( p_state_end_id,-1)
      AND nvl(treatm.time_start,sysdate) = nvl(p_time_start,sysdate )
      AND nvl(treatm.time_end,sysdate) = nvl( p_time_end,sysdate )
      AND NOT  DATE_INTERVALL.OVERLAP(FROM_DATE, TO_DATE, p_from_date, p_to_date) = -1
      AND STATUS_ID NOT IN (919,921);     
      IF l_rows > 0 THEN 
        v_error_text := v_error_text ||  '<br/>&emsp;p_treatm_group_id    :'|| lookup_super_type_name(p_treatm_group_id);
        v_error_text := v_error_text ||  '<br/>&emsp;p_treatm_name        :'|| p_treatm_name;
        v_error_text := v_error_text ||  '<br/>&emsp;p_treatm_type_id     :'|| lookup_super_type_name(p_TREATM_TYPE_ID);   
        v_error_text := v_error_text ||  '<br/>&emsp;p_treatm_category_id :'|| lookup_super_type_name(p_TREATM_CATEGORY_ID);
        v_error_text := v_error_text ||  '<br/>&emsp;p__type1_id          :'|| lookup_super_type_name(p_TYPE1_ID);
        v_error_text := v_error_text ||  '<br/>&emsp;p_type2_id           :'|| lookup_super_type_name(p_TYPE2_ID);
        v_error_text := v_error_text ||  '<br/>&emsp;p_subj1_id           :'|| lookup_subj_name(p_subj1_id);
        v_error_text := v_error_text ||  '<br/>&emsp;p_subj2_id           :'|| lookup_subj_name(p_subj2_id);
        v_error_text := v_error_text ||  '<br/>&emsp;p_state_start_id     :'|| lookup_super_type_name(p_state_start_id);
        v_error_text := v_error_text ||  '<br/>&emsp;p_state_end_id       :'|| lookup_super_type_name(p_state_end_id);
        v_error_text := v_error_text ||  '<br/>&emsp;p_time_start          :'|| to_char(p_time_start,'YYYY.MM.DD');
        v_error_text := v_error_text ||  '<br/>&emsp;p_time_end           :'|| to_char(p_time_end,'YYYY.MM.DD');
        v_error_text := v_error_text ||  '<br/>&emsp;p_from_date          :'|| to_char(p_from_date,'YYYY.MM.DD');
        v_error_text := v_error_text ||  '<br/>&emsp;p_to_date            :'|| to_char(p_to_date,'YYYY.MM.DD');
        --v_error_text := v_error_text ||  '<br/>&emsp;p_status_id          :'|| lookup_super_type_name(p_STATUS_ID);
        RETURN v_error_text;
      END IF;  
     INSERT INTO wk_pf_audit_table VALUES ('ok','Nem volt');
             COMMIT;      
    RETURN NULL;
    END;

END TREATM_tapi;

/
