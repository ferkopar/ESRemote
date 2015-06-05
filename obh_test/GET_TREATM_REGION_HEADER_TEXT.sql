--------------------------------------------------------
--  DDL for Function GET_TREATM_REGION_HEADER_TEXT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_TREATM_REGION_HEADER_TEXT" (p_treatm_group_id NUMBER)
  RETURN VARCHAR2
AS
BEGIN
   if p_treatm_group_id = 1601 then return 'Normafej';
   elsif p_treatm_group_id = 1603 then return 'Tervfej';
   elsif p_treatm_group_id = 1604 then return 'Tényfej';
   else return 'TREATM fej'; 
end if;
END;

/
