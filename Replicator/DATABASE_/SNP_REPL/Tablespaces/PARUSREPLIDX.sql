--
-- PARUSREPLIDX  (Tablespace) 
--
CREATE TABLESPACE PARUSREPLIDX DATAFILE 
  'D:\DB_ORCL\PARUSREPLIDX_1.ORA' SIZE 600M AUTOEXTEND ON NEXT 100M MAXSIZE 15974M,
  'D:\DB_ORCL\PARUSREPLIDX_2.ORA' SIZE 700M AUTOEXTEND ON NEXT 100M MAXSIZE 15974M,
  'D:\DB_ORCL\PARUSREPLIDX_3.ORA' SIZE 600M AUTOEXTEND ON NEXT 100M MAXSIZE 15974M,
  'D:\DB_ORCL\PARUSREPLIDX_4.ORA' SIZE 500M AUTOEXTEND ON NEXT 100M MAXSIZE 500M
LOGGING
ONLINE
PERMANENT
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT MANUAL;


