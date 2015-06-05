--------------------------------------------------------
--  Constraints for Table APEX_MENU_TEMP
--------------------------------------------------------

  ALTER TABLE "APEX_MENU_TEMP" ADD CONSTRAINT "APEX_MENU_TEMP_PK" PRIMARY KEY ("USER_ID", "TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "APEX_MENU_TEMP" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "APEX_MENU_TEMP" MODIFY ("TYPE_ID" NOT NULL ENABLE);