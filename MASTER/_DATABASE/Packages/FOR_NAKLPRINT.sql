--
-- FOR_NAKLPRINT  (Package) 
--
CREATE OR REPLACE PACKAGE MASTER.FOR_NAKLPRINT
AS
/******************************************************************************
   NAME:       FOR_NAKLPRINT
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        27.12.2005             1. Created this package.
******************************************************************************/

/*****************************************************************************
   ��� ���� ����������� p_nakl=reestr.nakl_id ��� p_nakl=nakl.id 
******************************************************************************/

/*��������� � �������� ������*/
   FUNCTION rekv_zagr (p_nakl NUMBER) RETURN VARCHAR2;
/*����� ������ � NN �� ���������� ���������. C����� ��������� ;       */
   FUNCTION StrokaN (stroka VARCHAR2,nn NUMBER,smb VARCHAR2) RETURN VARCHAR2;
   /*���������� ��������� S1-������� �������/����� ����������,S2-���������� ���,S3-���������� �� �������,S4-�������*/
   FUNCTION Get_S(p_nakl NUMBER, n NUMBER) RETURN VARCHAR2;
/*� ��������� �����*/
   FUNCTION AV_KART(AV_KART NUMBER,KOD VARCHAR2,KOD_GR VARCHAR2,PASP_ID VARCHAR2) RETURN VARCHAR2;
/*�������������� ���������� ��� ������������� �����*/
   FUNCTION Dop_gr_inf(p_nakl NUMBER,cnt NUMBER,KOD_NPR VARCHAR2,KOD_GD VARCHAR2,DATE_OFORML DATE) RETURN VARCHAR2;
   /*���������� '�����������' ��� '���������'*/
   FUNCTION SobsTitle(p_nakl NUMBER,TIP_SOBS NUMBER) RETURN VARCHAR2;
   /*���������� ��� ������������ ������, ���� ��� ��� - '', ���� ������������� ��������� �� '��. ��� ���� ���������'*/
   FUNCTION SobsName(p_nakl NUMBER,VAGOWNER_NAME VARCHAR2) RETURN VARCHAR2;
   /*������� ���������� ���������� SobstExist(����������� ����������) � SobstOne(����������� ������ 1 � ���� ����.) 
   ��� ���������� ������������ � ���������� ������� ���� ������� ���������
   ������� � �������� ������� ��� � ��������� ��������� �.�. ������ ����������
   ���������� ������ ������ ������. Info='SobstExist' ��� Info='SobstOne'*/
   FUNCTION SobsInfo(p_nakl NUMBER,info VARCHAR2) return BOOLEAN;
   /* ������������� ���������. cnt-���������� ����� ������*/
   FUNCTION Dop_vzisk(p_nakl NUMBER,cnt NUMBER) RETURN VARCHAR2;

/*  ������� ���������� ���� �� ������� �������������� ���������� � ����� ��� ����� �������� ������� ���������� �����
�������� ident:vzisk1,vzisk2,vzisk3,vzisk4,gr1_txt,gr2_txt,gr3_txt,gr4_txt.���� ��������� ����������, �� � vzisk1,vzisk2
������������ �� ���������� �������� */
   FUNCTION Dop_nakl(p_nakl NUMBER, ident VARCHAR2) RETURN VARCHAR2;
   /* ���������� �������� ����� ���� ��� ��������� ��������� */
   FUNCTION Itog_mest(rodv NUMBER,shab_form NUMBER,p_nakl NUMBER,forma NUMBER) RETURN VARCHAR2;
   /* ���������� ���-�� ������� ��� ��������� ��������� */
   FUNCTION all_cnt(p_nakl NUMBER,forma NUMBER) RETURN NUMBER;
   /*���������� ����� ��������. ���������� PROPIS_S ������� �� ��������. ��� ������������� PROPIS_S*/
   FUNCTION propis(cc VARCHAR2, atr NUMBER) RETURN VARCHAR2;
   /* ����� ������ �����*/
   FUNCTION Defi_mass(p_nakl NUMBER,RODV NUMBER,IS_RUS NUMBER,FORMA NUMBER,KOD_NPR VARCHAR2,
                      VZLIV NUMBER,DEFI_MASS NUMBER) RETURN VARCHAR2;
   /* ���������� �������� ������ �� ���� ZPU,forma-��� ���������, dop-�����. ���.�����*/
   FUNCTION Zag_plomba(forma NUMBER,p_typ NUMBER,dop NUMBER) RETURN VARCHAR2;
   /* ���������� ����� ������ �� ����������� �������� reestr.plomba1 ��� reestr.plomba2, dop-�����. ���.�����*/
   FUNCTION plomba(plomba VARCHAR2,dop NUMBER) RETURN VARCHAR2;
   /*�������� ������ �������� ��� ������ �� ���. ������� ��������� ������� �� ���� ������ � ���*/
   FUNCTION nakl_para(rodv NUMBER, kod_npr VARCHAR2) RETURN VARCHAR2;
   /*����� ������ �������� ��� ������ �� ���. ������� ��������� ������� �� ���� ������ � ���*/
   FUNCTION nakl_glav(rodv NUMBER, kod_npr VARCHAR2) RETURN VARCHAR2;
   /*������� ����� ��� ���� ������� �������� � ���������*/
   FUNCTION all_ves(p_nakl NUMBER, forma NUMBER) return NUMBER;
   /*������� ��� ������ ���� ������� �������� � ���������*/
   FUNCTION all_brutto(p_nakl NUMBER) return NUMBER;
   /*������� ��� ���� ����(�������) �������� � ���������*/
   FUNCTION all_tara(p_nakl NUMBER) return NUMBER;
   /*������� ��� �������� ���� ������� �������� � ���������*/
   FUNCTION bag_ves(p_nakl NUMBER) return NUMBER;
   /*������� ������ ��������� �������� ������� */
   FUNCTION sertif(p_nakl NUMBER, str_fakt VARCHAR2) return VARCHAR2;
   /* ������ ����� ��������������� ���� ������� �������*/
   FUNCTION RosInsList(p_nakl NUMBER) RETURN VARCHAR2;
   /* ���-�� ����� ���������������*/
   FUNCTION RosInsCnt(p_nakl NUMBER) RETURN NUMBER;
   /*������ ��������� ��������� �������� � ���������*/
   FUNCTION PaspList(p_nakl NUMBER) RETURN VARCHAR2;
   /*������� �������������!!! ���������� ��� ��������� ���*/
   FUNCTION fu_fam(oper_id number,is_neft number,add_post number) RETURN VARCHAR2;
   /*���������� ��� ����� � �������� ���������*/
   FUNCTION get_file_sign(oper_id number,is_neft number,add_post number) RETURN VARCHAR2;
   /*���������� ���������� ������� � ��������� �� �������*/
   FUNCTION kol_vag(p_nakl NUMBER) RETURN NUMBER;
   /*���������� ������� ������ ������������ ������ ��� ������� ������������� ������������
     ������������ �� �������� info: info='SobsOne' ��� info='SobsExist'*/
   FUNCTION SobsInfo_voz(p_nakl NUMBER,info VARCHAR2) return NUMBER;
   
END for_naklprint;
/

