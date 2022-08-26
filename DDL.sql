/*DDL - Data Definition Language*/ 

/*A Linguagem de Definição de Dados se ocupa de
modificar a estrutura de objetos de uma DB.

Ela é constituída por diferentes sentenças que nos permitem criar, 
modificar, apagar ou definir a estrutura das tabelas que armazenam dados. */

/* Create, Alter, Drop, Truncate */

CREATE DATABASE SEMAC;
CREATE SCHEMA SENAC;

USE SENAC; 

CREATE TABLE pagamentos (
id_pay 			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
valor 			REAL NOT NULL,
moeda 		VARCHAR(20) NOT NULL,
data_pagamento		DATE NOT NULL,
tipo_pagamento 		VARCHAR(50),
id_usuario INT NOT NULL,
id_empresa 		INT NOT NULL); 

SELECT * FROM pagamentos; 

DESCRIBE pagamentos; /*Não é DDL*/ 

SELECT * FROM pagamentos;

ALTER TABLE pagamentos
ADD age INT;

ALTER TABLE pagamentos
MODIFY age VARCHAR(50) NOT NULL;

DESCRIBE pagamentos;

ALTER TABLE pagamentos
CHANGE COLUMN age idade VARCHAR(50) NOT NULL;

SELECT * FROM pagamentos;

ALTER TABLE pagementos
DROP COLUMN idade; 

ALTER TABLE pagamentos
DROP COLUMN idade; 

SELECT * FROM pagamentos; 

ALTER TABLE pagamentos
RENAME TO pagamento_do_mes;

SELECT * FROM pagamentos;

SELECT * FROM pagamento_do_mes;

ALTER TABLE pagamento_do_mes
RENAME TO pagamentos;

SELECT * FROM pagamentos; 

SELECT * FROM pagamento_do_mes; 

CREATE TABLE pay_backup
LIKE pagamentos;

SELECT * FROM pay_backup;

INSERT INTO pagamentos VALUES
(1, 3, 'USD', '01-01-1999', 'PayPal', '2', '3'); /*Não é DDL*/ 

INSERT INTO pagamentos VALUES
(1, 3, 'USD', '1999-01-01', 'PayPal', '2', '3'); /*Não é DDL*/ 

SELECT * FROM pagamentos;

TRUNCATE TABLE pagamentos;

DROP TABLE pagamentos;

SELECT * FROM pay_backup;

DROP TABLE pay_backup;
