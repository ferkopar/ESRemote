--------------------------------------------------------
--  DDL for Trigger TRG2_DM_TRANSLATE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG2_DM_TRANSLATE" 
BEFORE INSERT OR UPDATE ON AMNIS.DM_TRANSLATE FOR EACH ROW
BEGIN
IF INSERTING THEN
IF 
 :NEW.TRANSLATE_ID IS NULL THEN
  SELECT SEQ_BASE.NEXTVAL 
 INTO :NEW.TRANSLATE_ID FROM DUAL;
END IF;
:NEW.CRD:=SYSTIMESTAMP;		   --LÉTREHOZÁS IDŐPONTJA
:NEW.CRU:=(NVL(V('APP_USER'),USER));       --APEX USER AKI LÉTREHOZZA A REKORDOT
ELSIF UPDATING
THEN
  :NEW.MDD:=SYSTIMESTAMP;	     --MÓDOSÍTÁS IDŐPONTJA
  :NEW.MDU:=(NVL(V('APP_USER'),USER));       --APEX USER AKI MÓDOSÍT
END IF;
END;
/
ALTER TRIGGER "TRG2_DM_TRANSLATE" ENABLE;
