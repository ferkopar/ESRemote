--------------------------------------------------------
--  DDL for Function GET_TREATM_CREATE_BTN_TEXT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_TREATM_CREATE_BTN_TEXT" (p_treatm_group_id NUMBER, p_action VARCHAR2 DEFAULT null)
  RETURN VARCHAR2
AS
v_action  VARCHAR2(50);
BEGIN
   IF p_action IS NOT NULL AND p_action = 'COPY' THEN
     v_action := 'létrehozása';
   ELSE
     v_action := 'mentése'; 
   END IF;
   if    p_treatm_group_id = 1601 then return 'Normafej '||v_action;
   elsif p_treatm_group_id = 1603 then return 'Tervfej '||v_action;
   elsif p_treatm_group_id = 1604 then return 'Tényfej '||v_action;
   else  return 'TREATM fej'; 
end if;
END;

/
