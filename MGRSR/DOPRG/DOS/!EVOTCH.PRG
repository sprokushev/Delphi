**********************************************************
*
*	EVOTCH.PRG - ��������� �����ࠬ�� � ��᪢�
*
**********************************************************
PUBLIC m.rezult
PRIVATE m.flag

m.flag = gTMFlags + 'evotch.t-m'
m.rezult = ''
m.name_rezult=''

* 1) �����ࠬ�� OSTS "�ਥ��� �/�த�⮢ �� ���"
*DO (gPathDoPrg + 'ost.prg') WITH 'S', DATE()-1

* 2) �����ࠬ�� PNPS "���⪨ �/�த�⮢"
*DO (gPathDoPrg + 'pnp.prg') WITH 'S', DATE()-1

* 3) �����ࠬ�� VDDMM_E "���㧪� �/�த�⮢ �� ��ᯮ��"
*DO (gPathDoPrg + 'vddmm_e.prg') WITH 'S', DATE()-1

* 4) �����ࠬ�� OPRS "����⨢�� ᢥ����� � �ਥ�.� ॠ����樨"
DO (gPathDoPrg + 'oprs.prg') WITH DATE()-1

RELEASE m.rezult
fl = FCREATE(m.flag)
= FCLOSE(fl)
