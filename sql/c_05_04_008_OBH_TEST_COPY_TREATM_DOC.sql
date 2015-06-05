CREATE OR REPLACE FUNCTION OBH_TEST.COPY_TREATM_DOC (p_parent NUMBER, p_child NUMBER)
  RETURN number
AS

  CURSOR source_params(p_parent NUMBER) IS
    SELECT * FROM TREATM_PARAM tp WHERE tp.TREATM_ID = p_parent;

  l_child_norma NUMBER (12,0);
  l_child_norma_doc NUMBER (12,0);
  l_new_doc_id NUMBER (12,0);
  l_source_doc_id NUMBER (12,0);
  l_dummy NUMBER (12,0);
BEGIN

  l_child_norma := GET_NORMA_ID(p_child);
  l_child_norma_doc := GET_TREATM_DOC_ID(l_child_norma);
  l_new_doc_id := COPY_TREATM_AND_PARAMS(l_child_norma_doc);
  l_dummy := INSERT_TREATM_DOC_REL(p_child,l_new_doc_id);
  l_source_doc_id := GET_TREATM_DOC_ID(p_parent);

 -- update TREATM set TYPE1_ID = l_source_row.TYPE1_ID wher 

  FOR source_param IN source_params(l_source_doc_id)
    LOOP
      IF HAS_TREATM_PARAM(l_child_norma_doc,source_param.PARAM_TYPE_ID) = TRUE then
         UPDATE TREATM_PARAM tp SET tp.VALUE = source_param.VALUE,
                                    tp.TREATM_PARAM1_ID = source_param.TREATM_PARAM_ID,
                                    tp.VALUE_TYPE_ID = source_param.TREATM_PARAM_ID,
                                    tp.UNIT_TYPE_ID = source_param.UNIT_TYPE_ID,
                                    tp.SUBJ_TYPE_ID = source_param.SUBJ_TYPE_ID,
                                    tp.SUBJ_ID = source_param.SUBJ_TYPE_ID;
      END IF;
    END LOOP;
    
  RETURN NULL;
END;
/