--
-- MASTER  (User) 
--
CREATE USER MASTER
  IDENTIFIED BY VALUES '76626E2F3790C349'
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 2 Roles for MASTER 
  GRANT CONNECT TO MASTER;
  GRANT RESOURCE TO MASTER;
  ALTER USER MASTER DEFAULT ROLE ALL;
  -- 19 System Privileges for MASTER 
  GRANT BECOME USER TO MASTER WITH ADMIN OPTION;
  GRANT CREATE ANY TABLE TO MASTER WITH ADMIN OPTION;
  GRANT CREATE DATABASE LINK TO MASTER WITH ADMIN OPTION;
  GRANT CREATE MATERIALIZED VIEW TO MASTER WITH ADMIN OPTION;
  GRANT CREATE PUBLIC DATABASE LINK TO MASTER WITH ADMIN OPTION;
  GRANT CREATE PUBLIC SYNONYM TO MASTER WITH ADMIN OPTION;
  GRANT CREATE VIEW TO MASTER WITH ADMIN OPTION;
  GRANT DEBUG ANY PROCEDURE TO MASTER WITH ADMIN OPTION;
  GRANT DEBUG CONNECT SESSION TO MASTER WITH ADMIN OPTION;
  GRANT DELETE ANY TABLE TO MASTER WITH ADMIN OPTION;
  GRANT DROP ANY TABLE TO MASTER WITH ADMIN OPTION;
  GRANT EXECUTE ANY PROCEDURE TO MASTER;
  GRANT INSERT ANY TABLE TO MASTER;
  GRANT RESTRICTED SESSION TO MASTER WITH ADMIN OPTION;
  GRANT SELECT ANY DICTIONARY TO MASTER WITH ADMIN OPTION;
  GRANT SELECT ANY SEQUENCE TO MASTER WITH ADMIN OPTION;
  GRANT SELECT ANY TABLE TO MASTER;
  GRANT UNLIMITED TABLESPACE TO MASTER;
  GRANT UPDATE ANY TABLE TO MASTER;


