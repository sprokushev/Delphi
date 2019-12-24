--
-- FOR_REPL  (Package) 
--
CREATE OR REPLACE PACKAGE SNP_REPL.For_Repl AS


gREPL_NAME CONSTANT VARCHAR2(20):='SNP_REPL'; -- Хранилище данных репликации; пользователь для настройки
gREPL_MAIN CONSTANT VARCHAR2(20):='SNP_REPL_1'; -- Основной пользователь - репликатор


gRepl_init REPL_INIT%ROWTYPE; -- Настройки репликации текущего узла
gErrApplCode NUMBER;
gErrApplMsg VARCHAR2(500);
gErrOraCode NUMBER;
gErrOraMsg VARCHAR2(500);

gIsTestMode NUMBER; -- Режим тестирования

/* События со статусом >-100 - не критические */

fr_REPL_OK CONSTANT NUMBER:=1; -- Ошибок нет
fr_REPL_INFO CONSTANT NUMBER:=2; -- Ошибок нет, но нужно записать в лог
fr_REPL_ERROR CONSTANT NUMBER:=-100; -- Критическая ошибка
fr_REPL_ERROR_NON_CRITICAL CONSTANT NUMBER:=-2; -- Не критическая ошибка
fr_REPL_ACTIVE CONSTANT NUMBER:=-101; -- Ошибка при логине пользователем SNP_REPL - такой пользователь уже прилогинился
fr_REPL_INIT CONSTANT NUMBER:=-102;		 -- Ошибка при чтении настроек репликации
fr_REPL_ROW_NOTFOUND CONSTANT NUMBER:=-3; -- Ошибка при построении оператора: в таблице репликации есть строка, для которой нет записи в реплицируемой таблице
fr_REPL_DBLINK_NOTSEND CONSTANT NUMBER:=-104; -- Ошибка передачи операторов через DBLINK
fr_REPL_SQL_EMPTY CONSTANT NUMBER:=-105; -- Сформированный оператор - пустой
fr_REPL_NO_REPL CONSTANT NUMBER:=-106; -- Попытка запуска процедуры репликации не от имени репликатора
fr_REPL_VIEW CONSTANT NUMBER:=-99; -- Логин в режиме просмотра

fr_CALL_ERR CONSTANT NUMBER:=-110; -- Статус исполнения оператора: ошибка
fr_CALL_NOTSEND CONSTANT NUMBER:=0; -- Статус оператора: подготовлен
fr_CALL_RESEND CONSTANT NUMBER:=1; -- Статус оператора: повтор
fr_CALL_SEND CONSTANT NUMBER:=2; -- Статус оператора: отослан
fr_CALL_WAIT CONSTANT NUMBER:=3; -- Статус оператора: ждет результата предыдущего оператора
fr_CALL_SKIP CONSTANT NUMBER:=100; -- Статус оператора: пропущен на этапе анализа (дублирование)
fr_CALL_OK CONSTANT NUMBER:=101; -- Статус оператора: успешно выполнен
fr_CALL_SKIP_MODE_NODELETE CONSTANT NUMBER:=102; -- Статус оператора: пропущен - режим без удалений (REPL_MODE=0)
fr_CALL_SKIP_MODE_CHECKDATE CONSTANT NUMBER:=103; -- Статус оператора: пропущен - устарел (REPL_MODE=2)
fr_CALL_NO_DATA_FOUND CONSTANT NUMBER:=104; -- При выполнении оператора UPDATE или DELETE - запись не найдена
fr_CALL_USER_DELETED CONSTANT NUMBER:=-111; -- Оператор удален пользователем на текущем узле
fr_CALL_DEST_USER_DELETED CONSTANT NUMBER:=-112; -- Оператор удален пользователем на узле-назначении
fr_CALL_USER_RESTORED CONSTANT NUMBER:=-11; -- Оператор восстановлен пользователем на текущем узле
fr_CALL_DEST_USER_RESTORED CONSTANT NUMBER:=-113; -- Оператор восстановлен пользователем на узле-назначении

fr_REPL_MODE_NODELETE CONSTANT NUMBER:=0; -- Режим репликации - без удалений
fr_REPL_MODE_FULL CONSTANT NUMBER:=1; -- Режим репликации - полный
fr_REPL_MODE_CHECKDATE CONSTANT NUMBER:=2; -- Режим репликации - проверка даты модификации

/* Проверить наличие другой сессии SNP_REPL */
FUNCTION Check_Login(pSessionID NUMBER, pPROC_NAME VARCHAR2) RETURN NUMBER ;

/* Удаление записи из REPL_CALL_OUT */
PROCEDURE DeleteCallOut(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER, pSTATUS NUMBER, pDATE_EXEC DATE DEFAULT NULL);

/* Восстановление из архива записи в REPL_CALL_OUT */
PROCEDURE RestoreCallOut(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER);

/* Добавление записи в REPL_ANSW */
FUNCTION AddAnswOut(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER ,
					pSTATUS NUMBER, pNOTE VARCHAR2) RETURN NUMBER;

/* Удаление записи из REPL_CALL */
PROCEDURE DeleteCall(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER, pStatus NUMBER, pDATE_EXEC DATE DEFAULT NULL);

/* Восстановление записи в REPL_CALL */
PROCEDURE RestoreCall(pSessionID NUMBER,pCallOutRN NUMBER,
                    pSITE_SOURCE_RN NUMBER ,pSITE_DEST_RN NUMBER);

/* Обработка входящих ответов поступивших от узла pSITE_DEST_RN на узел pSITE_SOURCE_RN */
FUNCTION Answ_In(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* Исполнение входящих запросов поступивших от узла pSITE_SOURCE_RN на узел pSITE_DEST_RN */
FUNCTION Call_In(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER,pSCHEMA_RN NUMBER) RETURN NUMBER;

/* Формирование исходящих запросов с узла pSITE_SOURCE_RN на узел pSITE_DEST_RN по схеме pSCHEMA_RN */
FUNCTION Call_Out(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER,pSCHEMA_RN NUMBER) RETURN NUMBER;

/* Анализ исходящих запросов с узла pSITE_SOURCE_RN на узел pSITE_DEST_RN на предмет дублирования
   (с последующим переносом из REPL_CALL_OUT в REPL_CALL) */
FUNCTION Analyze_Call_Out(pSessionID NUMBER,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* Передача через DBLink с узла pSITE_SOURCE_RN на узел pSITE_DEST_RN исходящих ответов и запросов */
FUNCTION SendDBLink(pSessionID NUMBER,pTYPE VARCHAR2,pSITE_SOURCE_RN NUMBER,pSITE_DEST_RN NUMBER,pREPL_SCHEMANAME VARCHAR2,pDBLINK VARCHAR2) RETURN NUMBER;

/* Процесс репликации: Обработка входящих ответов */
FUNCTION ExecAnswIn(pSessionID NUMBER) RETURN NUMBER;

/* Процесс репликации: Обработка входящих запросов */
FUNCTION ExecCallIn(pSessionID NUMBER) RETURN NUMBER;

/* Процесс репликации: Формирование исходящих запросов */
FUNCTION ExecCallOut(pSessionID NUMBER)  RETURN NUMBER;

/* Процесс репликации: Повторная отправка сформированных запросов */
FUNCTION ExecReSendCallOut(pSessionID NUMBER)  RETURN NUMBER;

/* Процесс репликации: Повторное формирование запросов с COUNTER>=3 */
FUNCTION ExecReFormBad(pSessionID NUMBER)  RETURN NUMBER;

/* Процесс передачи через DBLink */
FUNCTION ExecDBLINK(pSessionID NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* Уникальный ID */
FUNCTION GetFileSeq RETURN NUMBER;

/* Начало загрузки настроек репликации */
FUNCTION START_IMPORT_META(pSessionID NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* Завершение загрузки настроек репликации */
FUNCTION FINISH_IMPORT_META(pSessionID NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* Начало выгрузки настроек репликации */
FUNCTION START_EXPORT_META(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER;

/* Завершение выгрузки настроек репликации */
FUNCTION FINISH_EXPORT_META(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER;

/* Начало выгрузки данных репликации */
FUNCTION START_EXPORT_ANSW(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER;

/* Начало выгрузки данных репликации */
FUNCTION START_EXPORT_CALL(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER;

/* Завершение выгрузки данных репликации */
FUNCTION FINISH_EXPORT_ANSW(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER;

/* Завершение выгрузки данных репликации */
FUNCTION FINISH_EXPORT_CALL(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER, pRN NUMBER DEFAULT 0, pFILENAME VARCHAR2 DEFAULT NULL) RETURN NUMBER;

/* Наличие данных для выгрузки */
FUNCTION EXPORT_READY_ANSW(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* Наличие данных для выгрузки */
FUNCTION EXPORT_READY_CALL(pSessionID NUMBER, pSITE_SOURCE_RN NUMBER, pSITE_DEST_RN NUMBER) RETURN NUMBER;

/* Наличие данных для исполнения */
FUNCTION EXECUTE_READY_CALL(pSessionID NUMBER) RETURN NUMBER;

/* Схема-хранилище */
FUNCTION GetUserInit RETURN VARCHAR2;

END;
/


