--------------------------------------------------------
--  DDL for Function USER_ROLE_LEVEL
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "USER_ROLE_LEVEL" (user varchar2)
  RETURN number
AS
BEGIN
  if user in ('FPARDI','RENDEK','LGABORI') then
    return 0;
  elsif user in ('ZWENINGER') then
    return 1;
  else
    return 2;
  end if;
END;

/
