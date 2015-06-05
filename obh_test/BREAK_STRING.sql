--------------------------------------------------------
--  DDL for Function BREAK_STRING
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "BREAK_STRING" 
(
  IN_STR IN VARCHAR2  
, CHAR_NO IN NUMBER  
) RETURN VARCHAR2 AS 
v_cnt number(5,0) := 0;
v_retval varchar2(20000) := '';
v_char varchar2(2) ;
BEGIN
  if IN_STR is not null then
   FOR i in 1 .. length(IN_STR)
            LOOP
              BEGIN
               v_char := substr(IN_STR,i,1);
               v_cnt := v_cnt + 1;
               if v_cnt > char_no then
                  if v_char = ' ' then
                   v_retval := v_retval || '<br/>';
                   v_cnt := 0;
                  else 
                   v_retval := v_retval || v_char;
                  end if;
               else
                  v_retval := v_retval || v_char;            
               end if;
                EXCEPTION
                  WHEN OTHERS THEN
                    EXIT;
               END;
             END LOOP;
   else
   v_retval :='';
   end if;
  return v_retval;
END BREAK_STRING;

/
