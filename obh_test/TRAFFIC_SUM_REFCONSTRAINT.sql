--------------------------------------------------------
--  Ref Constraints for Table TRAFFIC_SUM
--------------------------------------------------------

  ALTER TABLE "TRAFFIC_SUM" ADD CONSTRAINT "FK_TRAFFIC_SUM_ADAT_BEERKEZES" FOREIGN KEY ("DATA_INCO_ID")
	  REFERENCES "DATA_INCO" ("DATA_INCO_ID") DISABLE;
