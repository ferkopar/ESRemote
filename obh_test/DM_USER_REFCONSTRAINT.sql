--------------------------------------------------------
--  Ref Constraints for Table DM_USER
--------------------------------------------------------

  ALTER TABLE "DM_USER" ADD CONSTRAINT "FK_DMRU_DSRT" FOREIGN KEY ("STATUS_ID")
	  REFERENCES "DM_SUPER_TYP" ("SUPER_TYP_ID") ENABLE;
