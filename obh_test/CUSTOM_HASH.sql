--------------------------------------------------------
--  DDL for Function CUSTOM_HASH
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "CUSTOM_HASH" (
    p_username IN VARCHAR2,
    p_password IN VARCHAR2)
  RETURN VARCHAR2
IS
  l_password VARCHAR2(4000);
  l_salt     VARCHAR2(4000) := 'U37ET77M2KIMB90R8JL31G0YU2QI0Y';
BEGIN
  l_password := utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5 (input_string => p_password || SUBSTR(l_salt,10,13) || p_username || SUBSTR(l_salt, 4,10)));
  -- l_password := utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5 (input_string => p_password || p_username));
  RETURN l_password;
END custom_hash;

/
