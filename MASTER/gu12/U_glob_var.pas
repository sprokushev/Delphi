unit U_glob_var;

interface
var
        m_id_zayav: real; {id ��� �������������� ������}
        m_id_new: real; {id ��� ���������� ������}
        m_idreis: real;
        m_idold_reis: real; {id ��� �������������� �����}
        m_idnew_reis: real; {id ��� ���������� �����}
        m_indred: integer; {m_indred=1 - ����� ������, m_indred=2 - �������������� ������}
        arr_z: variant; {������ �������� ������}
        m_t_dog: string='7242352'; {�������}
        m_filter1,m_filter2: string; {������ ������}
        m_filt_reis: string;  {������ ������}
        m_fregdate1,m_fregdate2: TDateTime; {��� ������� �� ���� reg_date}
        m_date_filt1,m_date_filt2: TDateTime; {��� ������� �� ���� to_date}
        m_back: string; {����� ��������}
        m_addbr: boolean; {���������� ���������� ��������}
        m_edit_br: boolean; {���������� "post" ��� �������������� ��������}
        m_even: real; {����� ���������}
        m_username: string; {username}
        m_date_isp1,m_date_isp2: TDateTime;{������ ����������}
        FromFile,ToFile: string;
        m_otchet: string; {�����}
        m_month: integer; {����� ������}
        m_wherefrom: string; {������ ������� �����}
        //AppUserSNP:boolean; // ������������ ���
        //AppUserUNP:boolean; // ������������ ���
        m_unp,m_fool:boolean;
        m_podpis: real=1;
        m_gdprod: integer;
        m_idnpr: string;
        m_modify: integer=0; {������� "��������" ��������}
        m_idbr: real; {ID �������� � �������}
        m_poisk: integer=0; {��������� ������}
        m_poisk2: integer=0;  {��������� ���������� ������}
        m_poisk_good: integer=0; {��������� ������� ������������ ������}
        m_oldiscor: integer=0;
        m_firstime: integer=0;
        m_change_a: integer=0;
        m_change_b: integer=0;
        m_change_br: integer=0; {����� ��������� ������� ������}
        m_focus_a: integer=0;
        m_focus_b: integer=0;
        m_focus_br: integer=0; {����� ��������� ������ ������. ����������}
        m_nomz: string='';

implementation

end.
