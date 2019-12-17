--
-- GET_OLD_SF  (Function) 
--
CREATE OR REPLACE FUNCTION MASTER.Get_Old_Sf(pNom_Dok NUMBER, pNom_Sf NUMBER, pOld_dok NUMBER, pOld_sf NUMBER) RETURN NUMBER IS
  vOld_Old_sf NUMBER;
  vOld_Old_dok NUMBER;
BEGIN
  -- ������� ���������� ����� ��������������� ����� ��� ������������ � �� � �������� (����� �����) � 
  -- ������ �������� ����� �������������� �� � ���� ������� ���� ��������������
  IF NVL(pOld_Sf,0)=0 THEN -- ���� ��� ������ �� �������������� ����
    RETURN NULL;
  ELSE
    IF NVL(pOld_Sf,0)=NVL(pNom_Sf,0) THEN -- ���� �������������� � �������������� ����� �����, �� �������������� ���� - ���������
	  -- ��������� �� �������� �� �������������� ���� �������������� ��� ������� (������� �������������)
	  BEGIN
  	    SELECT Old_nom_sf,Old_nom_dok INTO vOld_old_sf,vOld_old_dok FROM BILLS WHERE nom_dok=pOld_Dok;
      EXCEPTION
        WHEN OTHERS THEN
  	      vOld_old_sf:=0;
		  vOld_old_dok:=0;
      END;
 	  IF NVL(vOld_Old_Sf,0)=0 THEN -- ���� �������������� ���� �� ��������� �� ������
	    RETURN NULL;
	  ELSE -- ���� �������������� ���� �������� �������������� ��� �������
	    RETURN vOld_Old_sf;
	  END IF;
	ELSE
	  RETURN pOld_sf;
	END IF;
  END IF;	      		   
END Get_Old_sf;
/

