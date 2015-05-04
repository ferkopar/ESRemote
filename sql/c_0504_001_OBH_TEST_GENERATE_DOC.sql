CREATE OR REPLACE FUNCTION OBH_TEST.GENERATE_DOC (p_treatm_id NUMBER)
  RETURN NUMBER
AS
l_treatm_row TREATM%ROWTYPE;
l_norma_id NUMBER (12,0);
l_norma_doc_id NUMBER (12,0);
l_new_doc_id NUMBER (12,0);
l_dummy NUMBER (12,0);

BEGIN
  l_treatm_row := GET_TREATM_ROW(p_treatm_id);
  l_norma_id := GET_NORMA_ID(p_treatm_id);
  l_norma_doc_id := GET_NORMA_DOC_ID(l_norma_id);
  l_new_doc_id := COPY_TREATM_AND_PARAMS(l_norma_doc_id);
  l_dummy := INSERT_TREATM_DOC_REL(p_treatm_id,l_new_doc_id);

  -- HACK


  -- /HACK
  RETURN NULL;
END;
/