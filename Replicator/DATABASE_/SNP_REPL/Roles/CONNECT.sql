--
-- CONNECT  (Role) 
--
CREATE ROLE CONNECT NOT IDENTIFIED;

GRANT CREATE VIEW TO CONNECT;
GRANT CREATE TABLE TO CONNECT;
GRANT ALTER SESSION TO CONNECT;
GRANT CREATE CLUSTER TO CONNECT;
GRANT CREATE SESSION TO CONNECT;
GRANT CREATE SYNONYM TO CONNECT;
GRANT CREATE SEQUENCE TO CONNECT;
GRANT CREATE DATABASE LINK TO CONNECT;

