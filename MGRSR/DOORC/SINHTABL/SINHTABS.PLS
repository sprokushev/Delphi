PACKAGE sinhtabl IS
-- ����
  RootDbf  VARCHAR(30) := 'F:\';
  TovPrDbf VARCHAR(30) := RootDbf || 'TOV_PR\DBF\';
  TovPrArh VARCHAR(30) := RootDbf || 'TOV_PR\ARHIV\';
  UchetDbf VARCHAR(30) := RootDbf || 'UCHET\DBF\';
  ExpGuid  VARCHAR(30) := RootDbf || 'EXPORT\GUID\';
  DbaDbf   VARCHAR(30) := RootDbf || 'DBA\DBF\';

PROCEDURE tt;
  PROCEDURE sinhall;         -- ����� �������������
  PROCEDURE receive_raznar;  -- ���� ����������
  PROCEDURE raznar_rw;       -- ������������� ������
  PROCEDURE stan(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);            -- �������
  PROCEDURE gdor(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);            -- ������
  PROCEDURE pred_st(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);         -- �/� ���� �����������
  PROCEDURE predpr(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);          -- �����������
  PROCEDURE sobstv(PathDbf IN VARCHAR2 DEFAULT UchetDbf);          -- ������������
  PROCEDURE region(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);          -- �������
  PROCEDURE states(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);          -- ������
  PROCEDURE vetka(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);           -- ����� ����������
  PROCEDURE raznar(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);          -- ������ �� ��������
  PROCEDURE prod(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);            -- �/�������
  PROCEDURE prod_gd_rod(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);     -- ��� ����� ���.���.

  PROCEDURE check_rec(Regime PLS_INTEGER DEFAULT 0, FullNameSource IN VARCHAR2,
    FieldSource IN VARCHAR2, NameSinhr IN VARCHAR2,FieldSinhr IN VARCHAR2); -- �������� �������
  PROCEDURE sinhid(Regime PLS_INTEGER DEFAULT 0, NameSource IN VARCHAR2,
    FieldSource IN VARCHAR2,FullNameSinhr IN VARCHAR2,FieldSinhr IN VARCHAR2); -- ������������� id-������
  PROCEDURE del_razn;    -- �������� ������� � ����������
  PROCEDURE ora_id_dbf;  -- ���������� ORA_ID � raznar-�����
  PROCEDURE Otgr_Gd;     -- ������������� ������� �������� �/�
  PROCEDURE num_tip;     -- ���������� ����� �������������
  PROCEDURE types;       -- ��������� ������������� �/�
  PROCEDURE cist_typ;    -- ���������� ��� ���������������� ���������� ����  
  PROCEDURE cist_vsl;    -- ���������� ��� ����� �����
  PROCEDURE kodifika;    -- ����������� ����������� ��������
  PROCEDURE ident;       -- ���������� �������������
  PROCEDURE pasport(lBegDate IN DATE DEFAULT SYSDATE - 30 );     -- ��������� ���������  
END;