**********************************************************
*
*	EVOTCH.PRG - Ежедневные кодограммы в Москву
*
**********************************************************
PUBLIC m.rezult
PRIVATE m.flag

m.flag = gTMFlags + 'evotch.t-m'
m.rezult = ''
m.name_rezult=''

* 1) Кодограмма OSTS "Приемка н/продуктов от НПЗ"
*DO (gPathDoPrg + 'ost.prg') WITH 'S', DATE()-1

* 2) Кодограмма PNPS "Остатки н/продуктов"
*DO (gPathDoPrg + 'pnp.prg') WITH 'S', DATE()-1

* 3) Кодограмма VDDMM_E "Отгрузка н/продуктов на экспорт"
*DO (gPathDoPrg + 'vddmm_e.prg') WITH 'S', DATE()-1

* 4) Кодограмма OPRS "Оперативные сведения о прием.и реализации"
DO (gPathDoPrg + 'oprs.prg') WITH DATE()-1

RELEASE m.rezult
fl = FCREATE(m.flag)
= FCLOSE(fl)
