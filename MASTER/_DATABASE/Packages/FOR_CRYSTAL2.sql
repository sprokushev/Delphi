--
-- FOR_CRYSTAL2  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.For_Crystal2 AS

TYPE CURSTYPE IS REF CURSOR;


PROCEDURE CR_SF_PRINT(DATE_BEG VARCHAR2, DATE_END VARCHAR2,
  PLAT_ID VARCHAR2,DOG_ID VARCHAR2,
  NUM_SF1 VARCHAR2,NUM_SF2 VARCHAR2,
  CRS IN OUT CURSTYPE);
END;

/

