﻿CREATE OR REPLACE FUNCTION OBH_TEST.GEN_SUB_TREATM (p_treatm_id number)
  RETURN number
AS
  cursor params is
    select * from TREATM_PARAM where TREATM_ID = p_treatm_id;
  l_treatm_row treatm%rowtype;
  l_new_treatm_id number(12,0);
  l_new_doc_id  number(12,0);
  l_norma_id NUMBER(12,0);
  l_norma_doc_id NUMBER(12,0);
  l_dummy NUMBER(12,0);

BEGIN
  
  l_norma_id := GET_NORMA_ID(p_treatm_id);
  --SELECT treatm_id2 into l_norma_id FROM TREATM_REL WHERE TREATM_ID1 = p_treatm_id and REL_TYPE_ID =  1308590116;
  l_new_treatm_id := COPY_TREATM_AND_PARAMS(p_treatm_id);
  l_dummy := INSERT_TREATM_SUB(l_new_treatm_id,p_treatm_id);
  l_dummy := INSERT_TREATM_N_K_REL(l_norma_id,l_new_treatm_id);
--  begin
--    SELECT treatm_id1 INTO l_norma_doc_id FROM TREATM_REL WHERE TREATM_ID2 = l_norma_id AND REL_TYPE_ID = 1308590191;
--    l_new_doc_id := COPY_TREATM_AND_PARAMS(l_norma_doc_id);
--    l_dummy := INSERT_TREATM_DOC_REL(l_new_treatm_id,l_new_doc_id);
--  exception when others then
--    null;
--  end;
  
  return l_new_treatm_id;
  
END;
/