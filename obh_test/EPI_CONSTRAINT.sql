--------------------------------------------------------
--  Constraints for Table EPI
--------------------------------------------------------

  ALTER TABLE "EPI" ADD CONSTRAINT "PK_EPI" PRIMARY KEY ("EPI_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "EPI" MODIFY ("STATUS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "EPI" MODIFY ("EPI_ID" NOT NULL ENABLE);
