--------------------------------------------------------
--  DDL for Trigger TRG_DM_SUPER_TYP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRG_DM_SUPER_TYP" 
BEFORE INSERT OR UPDATE ON AMNIS.DM_SUPER_TYP FOR EACH ROW
begin  
 if INSERTING then if :new.SUPER_TYP_ID is null then
  SELECT SEQ_BASE.NEXTVAL INTO :NEW.SUPER_TYP_ID FROM DUAL;
END IF;
 :new.CRD:=systimestamp;      --LÉTREHOZÁS IDŐPONTJA
 :NEW.CRU:=(NVL(V('APP_USER'),USER)); --APEX USER AKI LÉTREHOZZA A REKORDOT
ELSIF UPDATING THEN
  :new.MDD:=systimestamp;      --MÓDOSÍTÁS IDŐPONTJA
  :NEW.MDU:=(NVL(V('APP_USER'),USER)); --APEX USER AKI MÓDOSÍT
end if;
 if INSERTING or UPDATING then
  :NEW.SUPER_GROUP_NAME := lookup_super_type_name(:NEW.GROUP_ID);
  if :NEW.GROUP_ID is null then
     :NEW.GROUND_LEVEL_ID := :new.SUPER_TYP_ID;
  else
     :NEW.GROUND_LEVEL_ID := SEARCH_GROUND_LEVEL_ID (:NEW.GROUP_ID);
  end if;
END IF; 

END TRG_DM_SUPER_TYP;

/
ALTER TRIGGER "TRG_DM_SUPER_TYP" ENABLE;
