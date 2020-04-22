/* ユーザ作成。スキーマ名sql_testパスワードsql_test*/
CREATE USER sql_test IDENTIFIED BY sql_test;

/* ユーザのデフォルト表領域を設定 */
alter  user sql_test default tablespace USERS;
/* ユーザの一時表領域を設定 */
alter  user sql_test temporary tablespace TEMP;
/* ユーザのデフォルト表領域の利用制限を無制限に設定 */
alter user sql_test quota UNLIMITED on USERS;
/* ユーザにシステム権限を設定 */
grant ALTER SYSTEM to sql_test;
grant ALTER SESSION to sql_test;
grant CREATE MATERIALIZED VIEW to sql_test;
grant CREATE PROCEDURE to sql_test;
grant CREATE SEQUENCE to sql_test;
grant CREATE SESSION to sql_test;
grant CREATE SYNONYM to sql_test;
grant CREATE TABLE to sql_test;
grant CREATE TRIGGER to sql_test;
grant CREATE VIEW to sql_test;
grant EXECUTE ANY PROCEDURE to sql_test;
grant SELECT ANY DICTIONARY to sql_test;
grant SELECT ANY TABLE to sql_test;
grant create database link to sql_test;
grant create any type to sql_test;

