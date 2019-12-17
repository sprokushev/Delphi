unit U_glob_var;

interface
var
        m_id_zayav: real; {id при редактировании заявки}
        m_id_new: real; {id при добавлении заявки}
        m_idreis: real;
        m_idold_reis: real; {id при редактировании рейса}
        m_idnew_reis: real; {id при добавлении рейса}
        m_indred: integer; {m_indred=1 - новая запись, m_indred=2 - редактирование записи}
        arr_z: variant; {массив значений записи}
        m_t_dog: string='7242352'; {договор}
        m_filter1,m_filter2: string; {фильтр заявок}
        m_filt_reis: string;  {фильтр рейсов}
        m_fregdate1,m_fregdate2: TDateTime; {для фильтра по дате reg_date}
        m_date_filt1,m_date_filt2: TDateTime; {для фильтра по дате to_date}
        m_back: string; {форма возврата}
        m_addbr: boolean; {разрешение добавления разбивки}
        m_edit_br: boolean; {разрешение "post" при редактировании разбивки}
        m_even: real; {долго объяснять}
        m_username: string; {username}
        m_date_isp1,m_date_isp2: TDateTime;{период исполнения}
        FromFile,ToFile: string;
        m_otchet: string; {отчет}
        m_month: integer; {месяц отчета}
        m_wherefrom: string; {откуда вызвана форма}
        //AppUserSNP:boolean; // Пользователь СНП
        //AppUserUNP:boolean; // Пользователь УНП
        m_unp,m_fool:boolean;
        m_podpis: real=1;
        m_gdprod: integer;
        m_idnpr: string;
        m_modify: integer=0; {признак "изменить" разбивку}
        m_idbr: real; {ID разбивки и продукт}
        m_poisk: integer=0; {индикатор поиска}
        m_poisk2: integer=0;  {индикатор повторного поиска}
        m_poisk_good: integer=0; {индикатор успешно законченного поиска}
        m_oldiscor: integer=0;
        m_firstime: integer=0;
        m_change_a: integer=0;
        m_change_b: integer=0;
        m_change_br: integer=0; {флаги изменения записей таблиц}
        m_focus_a: integer=0;
        m_focus_b: integer=0;
        m_focus_br: integer=0; {флаги получения фокуса редакт. элементами}
        m_nomz: string='';

implementation

end.
