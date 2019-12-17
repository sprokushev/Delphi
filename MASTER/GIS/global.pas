unit global;

interface
uses types;

type ViewMatrix=record
  size:   TSize;  //размер выводимой области
  scale:  double; //масштабирование
  scroll: TSize;  //скроллинг изображения
end;

const minZoom = 0.0006;
const maxZoom = 0.05;

type AlarmEvent = record
//структура, описывающая сигнализацию
  name: string;         //название предупреждения
  description: string;  //описание
  Query:  string;       //имя запроса для проверки
  Enable: boolean;      //работает ли?
  value:  integer;      //число, для дополнения условия
  Mess:  string;        //текст сообщения
  Proc:  Pointer;       //указатель на процедуру
end;
const alarmListLength = 3;

var
glViewMatrix: ViewMatrix;
AlarmArray: array of AlarmEvent;


implementation

end.
