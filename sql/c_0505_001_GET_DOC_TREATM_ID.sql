﻿CREATE OR REPLACE FUNCTION OBH_TEST.GET_DOC_TREATM_ID (p_doc_id NUMBER)
  RETURN NUMBER
AS
  retval NUMBER (12,0);
BEGIN
  select TREATM_REL.TREATM_ID2 INTO retval FROM TREATM_REL WHERE TREATM_ID1 = p_doc_id AND REL_TYPE_ID = 1308590191;
  RETURN retval;
EXCEPTION
  WHEN OTHERS THEN 
    RETURN null;
END;
/