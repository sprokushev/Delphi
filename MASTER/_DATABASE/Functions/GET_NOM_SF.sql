--
-- GET_NOM_SF  (Function) 
--
CREATE OR REPLACE FUNCTION MASTER.Get_nom_Sf(pMode NUMBER, pNom_Dok NUMBER, pNom_Sf NUMBER, pOld_dok NUMBER, pOld_sf NUMBER, pSumma_Dok NUMBER, pDateVypSf DATE, pDateKvit DATE) RETURN VARCHAR2 IS
  vRes VARCHAR2(200);
BEGIN
  -- ������� ����������: 
  -- pMode=0 			 ����� �� + ����� ��������������� ����� (����� �����) + ���� ��
  -- pMode=1			 ����� �� + ����� ��������������� ����� (����� �����)
  -- pMode=2			 ����� ��
  -- pMode=3			 ����� �� + ���� �� + �.
  vRes:=TO_CHAR(pNom_sf);
  IF NVL(pOld_Sf,0)<>0 AND NVL(pSumma_Dok,0)>0 AND pMode IN (0,1) THEN
    vRes:=vRes || '/' || LTRIM(TO_CHAR(pOld_sf));
  END IF;	
  IF pMode=0 THEN
/*    IF pDateVypSf<pDateKvit THEN
  	  vRes:=vRes || '  ��  ' || TO_CHAR(pDateKvit, 'DD.MM.YYYY');
	ELSE*/   
  	  vRes:=vRes || '  ��  ' || TO_CHAR(pDateVypSf, 'DD.MM.YYYY');
/*    END IF;*/
  END IF;
  IF pMode=3 THEN
/*    IF pDateVypSf<pDateKvit THEN
  	  vRes:=vRes || '  ��  ' || TO_CHAR(pDateKvit, 'DD.MM.YYYY')  || '�.' ;
	ELSE*/   
  	  vRes:=vRes || '  ��  ' || TO_CHAR(pDateVypSf, 'DD.MM.YYYY') || '�.';
/*    END IF;*/
  END IF;
  RETURN vRes; 	
END Get_Nom_Sf;
/

