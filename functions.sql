/*Triggers, funções, procedures e operações.*/ 

USE agroadvance; /*GO*/ 

CREATE TABLE produtos (
		product_id INT,
        product_name VARCHAR(50),
        product_value FLOAT,
        PRIMARY KEY (product_id) 
        );
        
/*Inserir Dados*/
INSERT INTO produtos (product_id, product_name, product_value) VALUES
		(1, 'feno', '4.5'), /*Notem nas aspas*/
        (2, 'fertilizante', '2'),
        (3, 'diesel', '15'),
        (4, 'sela', '5'),
        (5, 'ferradura', '9');

CREATE TABLE clientes(
		client_id INT,
        client_name VARCHAR(50),
        product_id INT,
        PRIMARY KEY (client_id),
        FOREIGN KEY (product_id) REFERENCES produtos (product_id) 
        );

INSERT INTO clientes (client_id, client_name, product_id) VALUES
		(476, 'Frederico', 3),
        (477, 'Estevao', 4), 
        (478, 'Viviane', 5), 
        (479, 'Hedwig', 2),
        (480, 'Yaso', 4);

INSERT INTO clientes (client_id, client_name, product_id) VALUES
		(481, 'José', 1),
        (482, 'Maria', 5), 
        (483, 'Klaus', 4), 
        (484, 'Ludwig', 1),
        (485, 'Guilherme', 4);
        
DELETE FROM agroadvance.produtos WHERE product_id = 3;
SELECT * FROM clientes;
SELECT * FROM produtos;
DELETE FROM agroadvance.clientes WHERE product_id = 3; 
DELETE FROM agroadvance.produtos WHERE product_id = 3; 

DELETE FROM agroadvance.produtos WHERE product_id = 2;
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM agroadvance.produtos WHERE product_id = 2;

SELECT * FROM produtos;
SELECT * FROM clientes;

SET FOREIGN_KEY_CHECKS = 1;

CREATE VIEW clientes2 AS 
	SELECT * FROM clientes 
    WHERE client_id LIKE '478'; 

SELECT * FROM clientes2;

CREATE VIEW clientes3 AS
	SELECT client_name, product_id FROM clientes; 

SELECT * FROM clientes;

SELECT * FROM clientes3;

SELECT * FROM produtos;

CREATE FUNCTION count_produtos (contagem INT)
RETURNS INT 
DETERMINISTIC 
RETURN (SELECT COUNT(*) FROM clientes WHERE contagem = product_id);  

SELECT count_produtos(5);

SELECT * FROM clientes;

SELECT calcular_litros_de_fertilizante(22, 37, 4) AS total;

DELIMITER $$ 
CREATE TRIGGER tr_clientes1
BEFORE INSERT
ON clientes FOR EACH ROW
	BEGIN 
		IF NEW.client_name IS NULL THEN 
			SET NEW.client_name = 'Nome Vazio';
		END IF;
END$$
DELIMITER ; 

SELECT * FROM clientes; 

DELIMITER $$ 
CREATE TRIGGER tr_clientes2
BEFORE INSERT
ON clientes FOR EACH ROW
	BEGIN 
		IF NEW.client_name = 'old' THEN
			SET NEW.client_name = 'Novo Nome';
		END IF;
END$$
DELIMITER ; 

INSERT INTO clientes (client_id, client_name, product_id) VALUES (501, 'old', 4);

SELECT * FROM clientes; 

 DELIMITER $$ 
 CREATE PROCEDURE clientesmensais (d VARCHAR(45))
 BEGIN 
	SELECT * 
    FROM clientes 
    WHERE product_id = d;
END $$ 
DELIMITER ;

CALL clientesmensais(5);

CREATE PROCEDURE `sp_agro`(IN field CHAR(20))
BEGIN
IF field <> '' THEN
	SET @cliente_order = concat('ORDER BY' , ' ', field);
ELSE
SET @cliente_order = '';
END IF;
SET @clausula = concat('SELECT * FROM clientes', ' ',  @cliente_order);
PREPARE runSQL FROM @clausula;
EXECUTE runSQL;
DEALLOCATE PREPARE runSQL;
END

CALL sp_agro('client_name'); 