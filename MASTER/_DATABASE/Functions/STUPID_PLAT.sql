--
-- STUPID_PLAT  (Function) 
--
CREATE OR REPLACE FUNCTION MASTER.STUPID_PLAT(Kod_plat IN NUMBER)
   RETURN VARCHAR2
   IS
   ret VARCHAR(100);
   BEGIN
      RET:='������';
      IF (kod_plat in (456)) THEN
	    RET:=('��� "������-�������-������');
	  END IF;
      IF (kod_plat in (12,717,2794)) THEN
        RET:=('��� "�������� ��� ������');
      END IF;
      IF (kod_plat in (827,828)) THEN
        RET:=('��� "������-��������');
      END IF;
	  RETURN Ret;
    END;

/

