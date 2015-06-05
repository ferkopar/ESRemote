--------------------------------------------------------
--  Constraints for Table TREATM_REL
--------------------------------------------------------

  ALTER TABLE "TREATM_REL" ADD CONSTRAINT "PK_TR_TR" PRIMARY KEY ("TREATM_REL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "TREATM_REL" MODIFY ("TREATM_REL_ID" NOT NULL ENABLE);
 
  ALTER TABLE "TREATM_REL" MODIFY ("TREATM_ID1" NOT NULL ENABLE);
 
  ALTER TABLE "TREATM_REL" MODIFY ("TREATM_ID2" NOT NULL ENABLE);
 
  ALTER TABLE "TREATM_REL" MODIFY ("REL_TYPE_ID" NOT NULL ENABLE);
