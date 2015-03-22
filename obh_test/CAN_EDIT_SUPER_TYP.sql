--------------------------------------------------------
--  DDL for Function CAN_EDIT_SUPER_TYP
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "CAN_EDIT_SUPER_TYP" (user varchar2)
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
