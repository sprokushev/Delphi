PACKAGE sinhtabl IS
-- пути
  RootDbf  VARCHAR(30) := 'F:\';
  TovPrDbf VARCHAR(30) := RootDbf || 'TOV_PR\DBF\';
  TovPrArh VARCHAR(30) := RootDbf || 'TOV_PR\ARHIV\';
  UchetDbf VARCHAR(30) := RootDbf || 'UCHET\DBF\';
  ExpGuid  VARCHAR(30) := RootDbf || 'EXPORT\GUID\';
  DbaDbf   VARCHAR(30) := RootDbf || 'DBA\DBF\';

PROCEDURE tt;
  PROCEDURE sinhall;         -- общая синхронизация
  PROCEDURE receive_raznar;  -- приём разнарядки
  PROCEDURE raznar_rw;       -- синхранизация архива
  PROCEDURE stan(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);            -- станции
  PROCEDURE gdor(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);            -- дороги
  PROCEDURE pred_st(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);         -- ж/д коды предприятий
  PROCEDURE predpr(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);          -- предприяния
  PROCEDURE sobstv(PathDbf IN VARCHAR2 DEFAULT UchetDbf);          -- собственники
  PROCEDURE region(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);          -- область
  PROCEDURE states(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);          -- страны
  PROCEDURE vetka(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);           -- ветка получателя
  PROCEDURE raznar(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);          -- заявки на отгрузку
  PROCEDURE prod(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);            -- н/продукт
  PROCEDURE prod_gd_rod(PathDbf IN VARCHAR2 DEFAULT TovPrDbf);     -- род груза жел.дор.

  PROCEDURE check_rec(Regime PLS_INTEGER DEFAULT 0, FullNameSource IN VARCHAR2,
    FieldSource IN VARCHAR2, NameSinhr IN VARCHAR2,FieldSinhr IN VARCHAR2); -- проверка записей
  PROCEDURE sinhid(Regime PLS_INTEGER DEFAULT 0, NameSource IN VARCHAR2,
    FieldSource IN VARCHAR2,FullNameSinhr IN VARCHAR2,FieldSinhr IN VARCHAR2); -- синхронизация id-таблиц
  PROCEDURE del_razn;    -- удаление записей в разнарядке
  PROCEDURE ora_id_dbf;  -- заполнение ORA_ID в raznar-архив
  PROCEDURE Otgr_Gd;     -- синхронизация текущей отгрузки Ж/Д
  PROCEDURE num_tip;     -- справочник типов вагоноцистерн
  PROCEDURE types;       -- сравочник собственников в/ц
  PROCEDURE cist_typ;    -- справочник тип грузоподьёмность количество осей  
  PROCEDURE kodifika;    -- кодификатор показателей качества
  PROCEDURE pasport(lBegDate IN DATE DEFAULT SYSDATE - 30 );     -- заголовки паспортов  
END;