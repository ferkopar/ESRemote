--------------------------------------------------------
--  Ref Constraints for Table ALERT_PARAM
--------------------------------------------------------

  ALTER TABLE "ALERT_PARAM" ADD CONSTRAINT "FK_ALERT_PARAM_ALERT_ALERT_ID" FOREIGN KEY ("ALERT_ID")
	  REFERENCES "ALERT" ("ALERT_ID") ENABLE;
