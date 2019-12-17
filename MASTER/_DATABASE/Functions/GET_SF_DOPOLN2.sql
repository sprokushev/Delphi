--
-- GET_SF_DOPOLN2  (Function) 
--
CREATE OR REPLACE FUNCTION MASTER.Get_Sf_Dopoln2  (pBill_IdNpr VARCHAR2, pBill_NameNpr VARCHAR2, pBillPos_IdNpr VARCHAR2, pBillPos_NameNpr VARCHAR2,
 pDogNumber VARCHAR2, pDogDate DATE, pNomDok NUMBER, pDateKvit DATE, pDateMos DATE, pNumAkt VARCHAR2, pNaznOtg NUMBER) RETURN VARCHAR2 AS
BEGIN
  -- ���������� ���������� ��� ��
  -- pBill_IdNpr - �/�� � ��
  -- pBillPos_IdNpr - �/�� � ������� ��
  -- pDogNumber - ������� 
  -- pDogDate - ���� �������� 
  -- pNomDok - BILLS.NOM_DOK
  -- pNumAkt - N ����
  -- pDateKvit - ���� ���������  
  IF pBill_IdNpr IN ('10090','10091','10092','10062','10063','10055','10095','10097','10098','10058') THEN 
    RETURN '�������� �������� '|| pDogNumber || ' �� ' || TO_CHAR(pDogDate,'dd.mm.yyyy') ||'�. ';
  ELSE
    IF pBill_IdNpr IN ('10093','10094','10096') THEN 
	  RETURN pBillPos_NameNpr || ' �� '||NLS_LOWER(Rusmonth(pDateKvit)) || ' �������� �������� '|| pDogNumber || ' �� ' || TO_CHAR(pDogDate,'dd.mm.yyyy') ||'�. ';
	ELSE   
      IF pNaznOtg=9  THEN 
--        RETURN '��� ������-�������� � ' || Get_List_Nakl_Num(pNomDok) || ' �� ' || TO_CHAR(pDateKvit,'dd.mm.yyyy') ||' �. ';
	    RETURN '��� ������-�������� � ' || pNumAkt || ' �� ' || TO_CHAR(pDateKvit,'dd.mm.yyyy') ||'�. ';
	  ELSE
        IF pBill_IdNpr='10080'  THEN 
	      RETURN '��� ������-�������� � ' || pNumAkt || ' �� ' || TO_CHAR(pDateKvit,'dd.mm.yyyy') ||'�. ';
	    ELSE
          IF pBill_IdNpr<'10100' AND pBill_IdNpr<>'10080' THEN 
		    RETURN '�������� ������ ������ �� ' || TO_CHAR(pDateMos,'dd.mm.yyyy') ||'�. ' ;
    	  ELSE 
	  	    RETURN '����. � ' || Get_List_Nakl_Num(pNomDok) || ' �� ' || TO_CHAR(pDateKvit,'dd.mm.yyyy') ||' �. ';
		  END IF;
	    END IF;
	  END IF;	
	END IF;
  END IF;	  	   
END Get_Sf_Dopoln2;

/

