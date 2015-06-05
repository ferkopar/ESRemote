--------------------------------------------------------
--  Ref Constraints for Table SUBJECT
--------------------------------------------------------

  ALTER TABLE "SUBJECT" ADD CONSTRAINT "FK_SUBJ_DMST" FOREIGN KEY ("TYPE_ID")
	  REFERENCES "DM_SUPER_TYP" ("SUPER_TYP_ID") ENABLE;
