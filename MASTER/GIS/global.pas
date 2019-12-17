unit global;

interface
uses types;

type ViewMatrix=record
  size:   TSize;  //������ ��������� �������
  scale:  double; //���������������
  scroll: TSize;  //��������� �����������
end;

const minZoom = 0.0006;
const maxZoom = 0.05;

type AlarmEvent = record
//���������, ����������� ������������
  name: string;         //�������� ��������������
  description: string;  //��������
  Query:  string;       //��� ������� ��� ��������
  Enable: boolean;      //�������� ��?
  value:  integer;      //�����, ��� ���������� �������
  Mess:  string;        //����� ���������
  Proc:  Pointer;       //��������� �� ���������
end;
const alarmListLength = 3;

var
glViewMatrix: ViewMatrix;
AlarmArray: array of AlarmEvent;


implementation

end.
