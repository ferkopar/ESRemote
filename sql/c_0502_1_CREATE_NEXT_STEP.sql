CREATE OR REPLACE PROCEDURE OBH_TEST.CREATE_NEXT_STEP (p_treatm_id NUMBER, p_is_doc VARCHAR2 DEFAULT 'NO')
AS

l_next_norma_id number(12,0);
l_norma_id number(12,0);
l_next number(12,0);

l_user_id number(12,0);
l_alert_id number(12,0);
l_message_id number(12,0);
l_norma_doc_id number(12,0);
l_dummy number(12,0);
l_new_doc_id number(12,0);

l_source_row treatm%ROWTYPE;
l_norma_row treatm%ROWTYPE;
l_treatm_id number(12,0);

BEGIN
    IF p_is_doc = 'YES' THEN
     l_treatm_id := GET_DOC_TREATM_ID (p_treatm_id);
    ELSE 
     l_treatm_id := p_treatm_id;
   END IF;
   l_norma_id := GET_NORMA_ID(p_treatm_id);
   select * into l_source_row FROM TREATM WHERE TREATM_ID = p_treatm_id;
   select VALUE_TYPE_ID INTO l_next_norma_id from TREATM_PARAM WHERE TREATM_ID = l_norma_id AND PARAM_TYPE_ID = 1308590034;
   SELECT * into l_norma_row FROM TREATM WHERE TREATM_ID = l_next_norma_id;
   l_next := COPY_TREATM_AND_PARAMS(l_next_norma_id);
   BEGIN
     SELECT alert_text_id into l_message_id from W_PF_TREATM_ALERT_TEXT where TREATM_ID = l_next_norma_id;
    EXCEPTION WHEN OTHERS THEN
     l_message_id := 100;
   END;
   
--   SELECT alert_text_id into l_message_id from W_PF_TREATM_ALERT_TEXT where TREATM_ID = l_next_norma_id;
   l_dummy := INSERT_TREATM_N_K_REL(l_next_norma_id,l_next);
   update TREATM set TREATM_GROUP_ID = 1604
    ,TREATM_NAME = LOOKUP_SUBJ_NAME(l_source_row.subj2_id)||'-' || LOOKUP_SUPER_TYPE_NAME(l_norma_row.treatm_type_id)  
    ,TYPE1_ID = l_source_row.TYPE1_ID
    ,TYPE2_ID = l_source_row.TYPE2_ID
    ,SUBJ1_ID = l_source_row.SUBJ1_ID
    ,SUBJ2_ID = l_source_row.SUBJ2_ID
   WHERE TREATM_ID = l_next;

--  begin
--    SELECT treatm_id1 INTO l_norma_doc_id FROM TREATM_REL WHERE TREATM_ID2 = l_next_norma_id AND REL_TYPE_ID = 1308590191;
--    l_new_doc_id := COPY_TREATM_AND_PARAMS(l_norma_doc_id);
--    l_dummy := INSERT_TREATM_DOC_REL(l_next,l_new_doc_id);
--  exception when others then
--    null;
--  end;
  -- HACK
  if l_next_norma_id = 1308590711 then -- kezelés
     l_user_id := get_subj_id('PNAGY');
  elsif l_next_norma_id = 1308590708 then -- számla készítés
     l_user_id := get_subj_id('PNAGY');
  elsif l_next_norma_id = 1308590704 then -- számla kiegyenlítés
     l_user_id := get_subj_id('MFEHER');
  elsif l_next_norma_id = 1308590714 then -- Beérkező paciensek fogadása
     l_user_id := get_subj_id('MFEHER');
     l_dummy := INSERT_TREATM_DOC_REL(l_next,GET_NORMA_DOC_ID(p_treatm_id));
  end if;
-- /HACK
  INSERT INTO ALERT (ALERT_TYPE_ID, MESSAGE_ID, SUBJ_ID, U_COMMENT)
                  VALUES (100,l_message_id,l_user_id,LOOKUP_SUBJ_NAME(l_source_row.subj2_id)) RETURNING alert_id INTO l_alert_id;     
       INSERT INTO ALERT_PARAM (ALERT_ID,PARAM_TYPE_ID,APEX_PAGE)
                     VALUES (l_alert_id,30201,400);
       INSERT INTO ALERT_PARAM (ALERT_ID,PARAM_TYPE_ID,APEX_VARIABLE,VALUE)
                     VALUES (l_alert_id,30202,'P400_TREATM_ID',l_next);
       INSERT INTO ALERT_PARAM (ALERT_ID,PARAM_TYPE_ID,VALUE)
                   VALUES (l_alert_id,30203,'NEXT');
      
END;
/