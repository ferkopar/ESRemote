--------------------------------------------------------
--  DDL for Function GET_DOC_DEFAULT_LIST
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_DOC_DEFAULT_LIST" 
  (
     p_doc_id NUMBER
  )
  RETURN NUMBER
AS
BEGIN
   if p_doc_id = 100100 then
     return 100104;
   elsif p_doc_id = 100120 then
     return 100122;
   elsif p_doc_id = 100130 then
     return 100132;
   else return null;
  end if;
END;

/
