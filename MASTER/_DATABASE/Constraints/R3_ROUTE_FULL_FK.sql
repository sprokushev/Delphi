-- 
-- Foreign Key Constraints for Table R3_ROUTE_FULL 
-- 
ALTER TABLE MASTER.R3_ROUTE_FULL ADD (
  CONSTRAINT ROUTE_FULL_KNANF_FK 
  FOREIGN KEY (KNANF) 
  REFERENCES MASTER.R3_ROUTENODES (KNOTE)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.R3_ROUTE_FULL ADD (
  CONSTRAINT ROUTE_FULL_KNEND_FK 
  FOREIGN KEY (KNEND) 
  REFERENCES MASTER.R3_ROUTENODES (KNOTE)
  ENABLE NOVALIDATE);

ALTER TABLE MASTER.R3_ROUTE_FULL ADD (
  CONSTRAINT ROUTE_FULL_ROUTES_FK 
  FOREIGN KEY (ROUTE) 
  REFERENCES MASTER.R3_ROUTES (ROUTE)
  ENABLE NOVALIDATE);

