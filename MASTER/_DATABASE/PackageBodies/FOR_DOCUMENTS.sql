--
-- FOR_DOCUMENTS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY MASTER.For_Documents AS

-- ������
PROCEDURE RaiseError (pText VARCHAR2) AS
BEGIN
  ROLLBACK;
  RAISE_APPLICATION_ERROR(For_Scripts.SG$NO_CORRECT, pText);
END;

-- ����� �������� �� ���������� (ID<>pDocId)
-- ������������ ��������:
-- 				>0 - ����� ���������� ���������
--				0 - �� ����������
-- 				<0 - ������
FUNCTION CHECK_EXIST(pDocType NUMBER, pMestoId NUMBER, pDocId VARCHAR2, pDocPrefix VARCHAR2, pDocNum NUMBER, pDocDate DATE) RETURN NUMBER AS
res NUMBER;
vFIELD_PREFIX VARCHAR2(50);
vFIELD_NUM VARCHAR2(50);
vFIELD_DATE VARCHAR2(50);
vFIELD_ID VARCHAR2(50);
vFIELD_ID_TYPE VARCHAR2(50);
vTABLENAME VARCHAR2(50);
vFIELD_MESTO VARCHAR2(50);
vAND VARCHAR2(10);
vSQL VARCHAR2(4000);
cur INTEGER; -- ������
fdbk INTEGER; -- ���������  EXECUTE
BEGIN
  res:=FOR_SCRIPTS.SG$NO_ROW;
  FOR lcur IN (SELECT a.DOC_RULE_ID, a.FROM_DATE, a.TO_DATE,
                      b.FIELD_NUM, b.FIELD_DATE, b.FIELD_PREFIX, b.FIELD_ID,
					  b.TABLENAME, b.FIELD_MESTO, b.FIELD_ID_TYPE
               FROM KLS_DOC_NUMS a, KLS_DOC_TYPES b
			   WHERE a.DOC_TYPE_ID=b.ID AND a.DOC_TYPE_ID=pDocType
			     AND a.MESTO_ID=pMestoId AND a.DOC_PREFIX||' '=pDocPrefix||' '
			     AND (a.DOC_RULE_ID<>2 OR pDocDate BETWEEN a.FROM_DATE AND a.TO_DATE)
			   )
  LOOP
    -- �������� ������� ���� ��������� ��� ���������� ����� ���������� �������

	-- ���������� ������ �� ����� ���������
	vFIELD_ID:=NLS_UPPER(lcur.FIELD_ID);
	vFIELD_ID_TYPE:=NLS_UPPER(lcur.FIELD_ID_TYPE);
	vFIELD_NUM:=NLS_UPPER(lcur.FIELD_NUM);
	vFIELD_DATE:=NLS_UPPER(lcur.FIELD_DATE);
	vFIELD_PREFIX:=NLS_UPPER(lcur.FIELD_PREFIX);
	vFIELD_MESTO:=NLS_UPPER(lcur.FIELD_MESTO);
	vTABLENAME:=NLS_UPPER(lcur.TABLENAME);

	vSQL:='SELECT /*+ RULE */ '||vFIELD_NUM||' as DOC_NUM FROM '||vTABLENAME;
	vAND:=' WHERE ';

	IF vFIELD_ID||' '<>' ' THEN
	  IF vFIELD_ID_TYPE='NUMBER' THEN
	    IF NVL(TO_NUMBER(pDocId),0)<>0 THEN
          vSQL:=vSQL||vAND||vFIELD_ID||'<>'||pDocId;
          vAND:=' AND ';
	    END IF;
	  END IF;
	  IF vFIELD_ID_TYPE='VARCHAR2' THEN
	    IF pDocId||' '<>' ' THEN
          vSQL:=vSQL||vAND||vFIELD_ID||'<>'''||pDocId||'''';
          vAND:=' AND ';
	    END IF;
	  END IF;
	END IF;
	IF vFIELD_NUM||' '<>' ' THEN
      vSQL:=vSQL||vAND||vFIELD_NUM||'='||TO_CHAR(pDocNum);
      vAND:=' AND ';
	END IF;
    IF vFIELD_MESTO||' '<>' ' THEN
	  vSQL:=vSQL||vAND||vFIELD_MESTO||'='||TO_CHAR(pMestoId);
      vAND:=' AND ';
	END IF;
	IF lcur.DOC_RULE_ID=2 AND vFIELD_DATE||' '<>' ' THEN
	  vSQL:=vSQL||vAND||'('||vFIELD_DATE||' BETWEEN TO_DATE('''||TO_CHAR(lcur.FROM_DATE,'dd.mm.yyyy')||''',''dd.mm.yyyy'') AND TO_DATE('''||TO_CHAR(lcur.TO_DATE,'dd.mm.yyyy')||''',''dd.mm.yyyy'') )';
      vAND:=' AND ';
	END IF;
	IF vFIELD_PREFIX||' '<>' ' THEN
	  vSQL:=vSQL||vAND||vFIELD_PREFIX||'||'' ''='''||TO_CHAR(pDocPrefix)||' ''';
      vAND:=' AND ';
	END IF;

    -- ��������� ������� ��������� � ������������ �����������
    -- ��������� ������
    cur := DBMS_SQL.OPEN_CURSOR;
    -- ������� �������
    DBMS_SQL.PARSE(cur,vSQL,DBMS_SQL.NATIVE);
    -- ���������� ����
    DBMS_SQL.DEFINE_COLUMN (cur, 1, res);
    -- ������������ ������� �������
	res:=0;
    fdbk := DBMS_SQL.EXECUTE (cur);
    LOOP
      EXIT WHEN DBMS_SQL.FETCH_ROWS (cur) = 0;
	  -- ������ ����
      DBMS_SQL.COLUMN_VALUE (cur, 1, res);
	  res:=NVL(res,0);
	  EXIT;
  	END LOOP;
  	-- ��������� ������
    DBMS_SQL.CLOSE_CURSOR (cur);
    EXIT;
  END LOOP;

  RETURN res;
EXCEPTION
  WHEN OTHERS THEN
    RETURN FOR_SCRIPTS.SG$ERROR;
END;


-- ��������� ����� ��������� � ������� �� �������������� ������ �������������
-- ������������ ��������:
-- 				1 - ��� ����������
--				0 - �� ����������
-- 				<0 - ������
FUNCTION CHECK_RESERV(pDocType NUMBER, pMestoId NUMBER, pDocPrefix VARCHAR2, pDocNum NUMBER, pDocDate DATE) RETURN NUMBER AS
BEGIN
  FOR lcur IN (SELECT 1 as IS_EXIST
               FROM KLS_DOC_RESERV a, KLS_DOC_NUMS b
			   WHERE a.DOC_TYPE_ID=pDocType AND a.MESTO_ID=pMestoId
			     AND a.NEXT_DOC_NUM=pDocNum AND (a.DOC_PREFIX||' '=pDocPrefix||' ')
			     AND (b.DOC_RULE_ID<>2 OR pDocDate BETWEEN b.FROM_DATE AND b.TO_DATE)
			     AND NOT
				      (TERMINAL_NAME=For_Init.GetCurrTerm AND
                       OSUSER_NAME=For_Init.GetCurrUser)
			  )
  LOOP
    -- �������� ������� ���� � ����� �� ������� ��� ��������������
	RETURN 1;
  END LOOP;

  RETURN 0;
END;

-- �������� ������ ����������������� ������� �������� ������������ ��� ���� ���������
PROCEDURE CLEAR_RESERV (pDocType NUMBER, pMestoId NUMBER) AS
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  DELETE FROM KLS_DOC_RESERV
   WHERE TERMINAL_NAME=For_Init.GetCurrTerm
     AND OSUSER_NAME=For_Init.GetCurrUser
	 AND DOC_TYPE_ID=pDocType
	 AND MESTO_ID=pMestoId;
  COMMIT;
END;

-- �������� �������� ������� �� �������� �������������� �����
-- 0 - ��� ������������������ �����
-- >0 - KLS_DOC_NUMS.ID
FUNCTION GET_DOC_NUMS_RESERV (pDocType NUMBER, pMestoId NUMBER) RETURN NUMBER AS
res NUMBER;
BEGIN
  SELECT DOC_NUMS_ID INTO res FROM  KLS_DOC_RESERV
   WHERE TERMINAL_NAME=For_Init.GetCurrTerm
     AND OSUSER_NAME=For_Init.GetCurrUser
	 AND DOC_TYPE_ID=pDocType
	 AND MESTO_ID=pMestoId;
  RETURN res;
EXCEPTION
  WHEN OTHERS THEN
    RETURN 0;
END;

-- �������� ����������������� �����
-- 0 - ��� ������������������ �����
-- >0 - ����������������� �����
FUNCTION GET_RESERV (pDocType NUMBER, pMestoId NUMBER) RETURN NUMBER AS
res NUMBER;
BEGIN
  SELECT NEXT_DOC_NUM INTO res FROM  KLS_DOC_RESERV
   WHERE TERMINAL_NAME=For_Init.GetCurrTerm
     AND OSUSER_NAME=For_Init.GetCurrUser
	 AND DOC_TYPE_ID=pDocType
	 AND MESTO_ID=pMestoId;
  RETURN res;
EXCEPTION
  WHEN OTHERS THEN
    RETURN 0;
END;

-- ���������� ��������� ����� ���������
-- ������������ �������� - ����� ���������
FUNCTION GET_NEXT_NUM(pDocType NUMBER, pMestoId NUMBER, pDocPrefix VARCHAR2, pDocDate DATE) RETURN NUMBER AS
PRAGMA AUTONOMOUS_TRANSACTION;
res NUMBER;
i NUMBER;
BEGIN
  res:=FOR_SCRIPTS.SG$NO_ROW;

  FOR lcur IN (SELECT *
               FROM KLS_DOC_NUMS
			   WHERE DOC_TYPE_ID=pDocType AND MESTO_ID=pMestoId
			     AND (DOC_RULE_ID<>2 OR pDocDate BETWEEN FROM_DATE AND TO_DATE)
				 AND DOC_PREFIX||' '=Trim(pDocPrefix)||' '
			   FOR UPDATE)
  LOOP
    -- �������� ������� ���� ��������� ��� ���������� ����� ���������� �������

    -- 1.���������� �������� ������� �� �������� ��� �������������� �����
	res:=0;
  	i:=GET_DOC_NUMS_RESERV(pDocType,pMestoId);
	IF i=lcur.ID THEN
	  -- ���� ����������� ������� ��������������� ����� �� ���������, �� �������� ���
	  -- �������������� �����, �� ���������� ������ ����������������� �����
	  res:=GET_RESERV(pDocType,pMestoId);
	  IF res>0 THEN
        -- ��������� ������� ��������� � ������������ ����������� � ��
	    IF CHECK_EXIST(pDocType,pMestoId,0,pDocPrefix,res,pDocDate)=0 THEN
          -- ��������� �� ������� ������ � ������� ������� ������ �������������
	      IF CHECK_RESERV(pDocType,pMestoId,pDocPrefix,res,pDocDate)=0 THEN
		    ROLLBACK;
	        RETURN res;
		  END IF;
		END IF;
	  END IF;
	END IF;

	-- 2. ���� �������� ������� ��������� ��� �������������� �� �������������
	-- �� ����������� �� ������

	-- ������� ������ �������������� �������� ������������
    CLEAR_RESERV(pDocType,pMestoId);

    res:=NVL(lcur.LAST_DOC_NUM,0);

    -- ������ ������������ ���-�� �������� �� ������� ��������� ���
	-- ���������� ������������
    i:=1000;
    WHILE i>0 LOOP
  	  -- �������� ��������� �����
	  res:=res+1;

      -- ��������� �� ���������� ����������
      IF res<lcur.MIN_DOC_NUM THEN
	    res:=lcur.MIN_DOC_NUM;
  	  END IF;
      -- ��������� �� ����������� ����������
	  IF res>NVL(lcur.MAX_DOC_NUM,0) AND NVL(lcur.MAX_DOC_NUM,0)<>0 THEN
	    res:=lcur.MIN_DOC_NUM;
  	  END IF;

  	  -- ��������� ������� ��������� c ������������ ����������� � ��
	  IF CHECK_EXIST(pDocType,pMestoId,0,pDocPrefix,res,pDocDate)=0 THEN
    	-- ��������� �� ������� ������ � ������� ������� ������ �������������
	    IF CHECK_RESERV(pDocType,pMestoId,pDocPrefix,res,pDOcDate)=0 THEN
	      -- ����� �� �����, �����������
		  INSERT INTO KLS_DOC_RESERV (DOC_TYPE_ID, MESTO_ID, NEXT_DOC_NUM,DOC_NUMS_ID,DOC_PREFIX)
 		     VALUES(pDocType,pMestoId,res,lcur.ID,pDocPrefix);
		  COMMIT;
		  RETURN res;
	    ELSE
	      i:=i-1;
	    END IF;
      ELSE
	    i:=i-1;
	  END IF;
	END LOOP;

    -- ���� ����� �� ����� �����, ������ ����� �� ��� ������
	-- � ���� ��������� ������
    ROLLBACK;
    RaiseError('�� ������� �������� ����� ���������!');
    EXIT;
  END LOOP;

  ROLLBACK;
  IF res=FOR_SCRIPTS.SG$NO_ROW THEN
    RaiseError('�������� ������� �� ��������� ������ �� ��������� � ����������� ������� ����������!');
  END IF;

  RETURN res;
END;


-- ��������� ����� ���������
PROCEDURE SET_NUM(pDocType NUMBER, pMestoId NUMBER, pDocId VARCHAR2, pDocPrefix VARCHAR2, pDocNum NUMBER, pDocDate DATE) AS
res NUMBER;
i NUMBER;
BEGIN
  IF pDocNum<=0 THEN
    RaiseError('�������� � ������� <=0 ������ ���������! ������� ���������� �����.');
  END IF;

  -- 1.������� ������ �������������� �������� ������������
  CLEAR_RESERV(pDocType,pMestoId);

  -- 2.��������� ����� ���������
  res:=FOR_SCRIPTS.SG$NO_ROW;
  FOR lcur IN (SELECT *
               FROM KLS_DOC_NUMS
			   WHERE DOC_TYPE_ID=pDocType AND MESTO_ID=pMestoId
			     AND (DOC_RULE_ID<>2 OR pDocDate BETWEEN FROM_DATE AND TO_DATE)
				 AND (DOC_PREFIX||' '=pDocPrefix||' ')
			   FOR UPDATE)
  LOOP
    -- �������� ������� ���� ��������� ��� ���������� ����� ���������� �������

	-- ��������� �� ������� ��������� � ������������ ����������� � ��
	IF CHECK_EXIST(pDocType,pMestoId,pDocId,pDocPrefix,pDocNum,pDocDate)=0 THEN
      -- �������� �����������
	  IF NVL(lcur.LAST_DOC_NUM,0)<pDocNum THEN
		-- ��������� ����� ���������� ���������
		UPDATE KLS_DOC_NUMS SET LAST_DOC_NUM=pDocNum WHERE ID=lcur.ID;
	    RETURN;
	  ELSE
		-- �� ��������� ����� ���������� ���������
		-- ��������� �� ��� ��� �������� ������ �������������
		RETURN;
	  END IF;
	END IF;

    -- ���� ����� �� ����� �����, ������ ����������� ����� ��� �����
	-- � ���� ��������� ������
    RaiseError('�������� � ������� '||pDocPrefix||' '||TO_CHAR(pDocNum)||' ��� ����������!');
    RETURN;
  END LOOP;

  IF res=FOR_SCRIPTS.SG$NO_ROW THEN
    RaiseError('�������� ������� �� ��������� ������ �� ��������� � ����������� ������� ����������!');
  END IF;
END;

END;
/

