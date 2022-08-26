CREATE TABLE EmailTable (
    Email NVARCHAR (50),
    AccountID SMALLINT NOT NULL,
    `Name` NVARCHAR (50) NOT NULL, 
	Subscription VARCHAR (50) NOT NULL,
    `Active` VARCHAR (50) NOT NULL
    ); 
       
INSERT INTO EmailTable (Email, AccountID, `Name`, Subscription, Active)
VALUES ('cs@austin.com','123','Carlos da Silva','SLG','Y'),
('cs@austin.com','123','Carlos da Silva','PUB','N'),
('roberta@austin.com','234','Roberta Souza','PUB','Y'),
('danielrosa@austin.com','345','Daniel Rosa','LE','Y'),
('vitor@gmail.com','345','Vitor Albuquerque','PUB','N'),
('roberta@austin.com','345','Roberta Souza','LE','N'),
('francisco@email.com','456','Francisco Evangelista','LE','Y'), 
(NULL, '345','Juliano Maranhão','LE','N'); 

CREATE TABLE Accounts (
    AccountID SMALLINT PRIMARY KEY,
    HorseName NVARCHAR (50),
    `Active` VARCHAR (50) NOT NULL,
    `Activation Date` DATE NOT NULL
); 


INSERT INTO Accounts (AccountID, HorseName, `Active`, `Activation Date`)
VALUES ('123','Elba','y','2021-11-01'),
('234','Turbo','y','2021-12-01'),
('345','Pacato','n','2021-10-01'), 
('321',NULL,'Y','2022-01-01');

INSERT INTO Accounts (AccountID, HorseName, `Active`, `Activation Date`)
VALUES ('678','Faísca','y','2021-11-01');

SELECT * FROM Accounts; 
SELECT * FROM EmailTable; 


SELECT AccountID, Email FROM EmailTable
WHERE `Active`= 'Y'
AND `AccountID` IN (
  SELECT `AccountID` FROM `Accounts` WHERE `Active` = 'Y'
);  

SELECT * FROM EmailTable WHERE 	`ACTIVE` = 'Y'; /*123, 234, 345, 456*/ 
SELECT * FROM Accounts;

/*LEFT JOIN permite obter não apenas os dados relacionados 
de duas tabelas, mas também os dados não relacionados encontrados na tabela à esquerda 
da cláusula JOIN. Caso não existam dados relacionados entre as tabelas à esquerda
 e a direita do JOIN, os valores resultantes de todas as colunas da lista de seleção 
 da tabela à direita serão nulos.*/
 
/*Escreva uma consulta que retornará uma lista de endereços de e-mail ativos e
datas de ativação, mesmo que o endereço de e-mail não esteja vinculado a uma conta.*/

SELECT Email, `Activation Date`
FROM EmailTable 
LEFT OUTER JOIN `Accounts` ON EmailTable.AccountID = Accounts.AccountID
WHERE EmailTable.`Active` = 'Y' ; 

SELECT * FROM EmailTable; 
SELECT * FROM Accounts; 

SELECT Email, `Activation Date`
FROM EmailTable 
RIGHT OUTER JOIN `Accounts` ON EmailTable.AccountID = Accounts.AccountID
WHERE EmailTable.`Active` = 'Y' ; 

SELECT Email, `Activation Date`
FROM Accounts
RIGHT OUTER JOIN EmailTable ON  Accounts.AccountID = EmailTable.AccountID
WHERE EmailTable.`Active` = 'Y' ; 

SELECT Email, `Activation Date`
FROM EmailTable 
INNER JOIN `Accounts` ON EmailTable.AccountID = Accounts.AccountID
WHERE EmailTable.`Active` = 'Y' ; 

SELECT Email, `Activation Date`
FROM EmailTable 
FULL JOIN `Accounts` ON EmailTable.AccountID = Accounts.AccountID
WHERE EmailTable.`Active` = 'Y' ;

SELECT Email, `Activation Date`
FROM EmailTable 
LEFT OUTER JOIN `Accounts` ON EmailTable.AccountID = Accounts.AccountID
WHERE EmailTable.`Active` = 'Y' 
UNION ALL
SELECT Email, `Activation Date`
FROM EmailTable 
RIGHT OUTER JOIN `Accounts` ON EmailTable.AccountID = Accounts.AccountID
WHERE EmailTable.`Active` = 'Y' ; 

SELECT Email, `Activation Date`
FROM EmailTable 
CROSS JOIN `Accounts` ON EmailTable.AccountID = Accounts.AccountID
WHERE EmailTable.`Active` = 'Y' ;

SELECT Email, `Activation Date`
FROM EmailTable 
CROSS JOIN `Accounts` ON EmailTable.AccountID = Accounts.AccountID
WHERE EmailTable.`Active` = 'Y' ;

SELECT email FROM EmailTable;
SELECT DISTINCT email FROM EmailTable;

SELECT HorseName, 
COUNT(DISTINCT (Email)) AS Proprietarios
FROM Accounts
	LEFT OUTER JOIN EmailTable ON EmailTable.AccountID = Accounts.AccountID
GROUP BY HorseName
ORDER BY Proprietarios DESC; 

SELECT 
    SUM(CASE WHEN `Activation Date` LIKE '2021-%' THEN 1 ELSE 0 END) AS `Number of Accounts With Activation Date in 2021`,
    SUM(CASE WHEN `Active` = 'N' THEN 1 ELSE 0 END) AS `Currently Inactive Accounts`
FROM Accounts; 

SELECT * FROM Accounts;


SELECT * FROM EmailTable
WHERE EMAIL LIKE 'francisco%'; 

DELETE FROM EmailTable
WHERE EMAIL LIKE 'francisco%'; 

SELECT * FROM EmailTable;

DELETE FROM EmailTable; 

SET SQL_SAFE_UPDATES = 1; 