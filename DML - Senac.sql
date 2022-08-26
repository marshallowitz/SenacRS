/*SENAC 12.08.2022 - AULA 4*/ 
/*DML - Data Modeling Language*/ 

USE SENAC; 

CREATE TABLE compras (
id_pay 			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
amount 			REAL NOT NULL,
currency 		VARCHAR(20) NOT NULL,
usuario		VARCHAR(50)); /*Pode ser nulo*/ 

INSERT INTO compras VALUES 
('1', '300', 'BRL', 'Thomas'), 
('2', '140', 'USD', 'Nicholas'), 
('3', '129', 'EUR', 'Frederico'), 
('4', '404', 'BRL', 'Louis'), 
('5', '179', 'BRL', 'Franz'), 
('6', '480', 'USD', ''), /*Parâmetro vazio*/
('7', '581', 'EUR', 'Ludwig'); 

SELECT * FROM compras;

INSERT INTO compras (amount, currency, usuario) VALUES
('932', 'USD', 'Sebastian'); /*Parâmetro ID inexistente*/ 

SELECT * FROM compras; 

INSERT INTO compras (id_pay, amount, currency) VALUES
('9', '873', 'USD'); /*Parâmetro Usuário Nulo*/

SELECT * FROM compras; 

INSERT INTO compras (id_pay, currency, usuario) VALUES
('10', 'EUR', 'Carlos'); /*Parâmetro Amount Nulo*/

ALTER TABLE compras
MODIFY COLUMN amount REAL
DEFAULT '50';

INSERT INTO compras (id_pay, currency, usuario) VALUES
('10', 'EUR', 'Carlos');

SELECT * FROM compras;

INSERT INTO compras VALUES 
('11', '0', 'BRL', 'Jonas');

SELECT * FROM compras;

SELECT amount FROM compras;

SELECT amount, currency FROM compras; 

SELECT currency, amount FROM compras;

SELECT * FROM compras
WHERE amount = 581; 

SELECT * FROM compras
WHERE amount LIKE '5%'; 

SELECT * FROM compras
WHERE usuario LIKE '%s';

SELECT * FROM compras
WHERE usuario LIKE 'l%';

SELECT * FROM compras
WHERE usuario LIKE '%a%';

SELECT * FROM compras
WHERE usuario NOT LIKE '%s';

SELECT * FROM compras
WHERE amount > 140; /*Maior que*/

SELECT * FROM compras
WHERE amount < 140; /*Menor que*/

SELECT * FROM compras
WHERE amount >= 140; /*Maior ou igual que*/

SELECT * FROM compras
WHERE amount <= 140; /*Menor que*/

SELECT * FROM compras
WHERE usuario IS NOT NULL;

SELECT * FROM compras
WHERE usuario IS NULL;

SELECT * from compras
WHERE amount BETWEEN 140 AND 200;

SELECT * from compras
WHERE amount NOT BETWEEN 140 AND 200;

SELECT * FROM compras
WHERE usuario LIKE 'L%' AND
usuario LIKE '%S'; 

SELECT * FROM compras
WHERE usuario LIKE 'L%' OR
usuario LIKE '%S'; 

SELECT * FROM compras
WHERE usuario LIKE 'L%' AND
amount > 400; 

SELECT * FROM compras
WHERE usuario LIKE 'L%' OR
amount > 400; 

SELECT * FROM compras 
ORDER BY usuario;

SELECT * FROM compras 
ORDER BY usuario DESC;

SELECT usuario, currency FROM compras
ORDER BY usuario; /*Implícito ASC*/ 

SELECT currency FROM compras
ORDER BY usuario;

SELECT * FROM compras
LIMIT 5;

SELECT * FROM compras
LIMIT 3, 5;

SELECT COUNT(usuario) AS contagem 
FROM compras;

SELECT COUNT (usuario) AS contagem 
FROM compras; /*Espaço!*/ 

SELECT SUM(amount) AS soma 
FROM compras;

SELECT MIN(amount) AS soma 
FROM compras;

SELECT MAX(amount) AS soma 
FROM compras;