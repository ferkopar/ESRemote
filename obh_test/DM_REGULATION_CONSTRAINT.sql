--------------------------------------------------------
--  Constraints for Table DM_REGULATION
--------------------------------------------------------

  ALTER TABLE "DM_REGULATION" ADD CONSTRAINT "CKC_TOPTIONAL_DM_REGUL" CHECK (TOPTIONAL IS NULL OR (TOPTIONAL IN ('Y','N','O'))) ENABLE;
 
  ALTER TABLE "DM_REGULATION" MODIFY ("REGUL_ID" NOT NULL ENABLE);
