create database aula;
use aula;

select * from pessoa;
select * from funcionario;
select * from auditoria;

-- INDEX
-- CRIANDO INDEX
CREATE INDEX idxPessoa on pessoa(nome);

-- CONSULTANDO INDEX
SHOW INDEX from pessoa;



-- VIEW
-- CRIANDO VIEW
CREATE VIEW mostraFuncionario
AS
	SELECT nome 'Nome funcionario',
    email as 'email',
    nascimento
    FROM funcionario;

-- CONSULTANDO A VIEW
select * from mostraFuncionario;



-- TRANSAÇÃO
set autocommit = off;

-- ROLLBACK
START TRANSACTION;
INSERT INTO pessoa VALUES ('zanana', 'teste@teste.com');
select * from pessoa;
rollback;


-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- TRIGGER
select * from auditoria;

select salario from funcionario where matricula = 1;

-- CRIANDO TRIGGER
delimiter $$
CREATE TRIGGER alteraFuncionario AFTER UPDATE
ON funcionario
FOR EACH ROW
BEGIN
	INSERT INTO auditoria VALUES
    ('alteracao', NEW.matricula, OLD.salario, NEW.salario, curdate());
END$$
delimiter ;

-- TESTANDO A TRIGGER
UPDATE funcionario
SET salario = 8000
WHERE matricula = 1;

-- CONSULTANDO A TRIGGER
select * from auditoria;

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- STORED PROCEDURE
-- CRIANDO TABELA PARA TESTE PROCEDURE
CREATE TABLE IF NOT EXISTS
cartela(consurso INT, numero INT);

-- CRIANDO PROCEDURE
delimiter $$
CREATE PROCEDURE geraNumeros(nroInicial INT, nroFinal INT, nroConcurso INT)
BEGIN
	DECLARE nroGerado INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    WHILE i < 6 do
		SET nroGerado = 
			(SELECT FLOOR(RAND() * nroFinal) + nroInicial);
        IF NOT EXISTS (SELECT * FROM cartela WHERE numero = nroGerado) THEN
			INSERT INTO cartela VALUES (nroConcurso, nroGerado);
            SET i = i + 1;
            END IF;
	END WHILE;
END$$
delimiter ;

-- CHAMANDO PROCEDURE
CALL geraNumeros(1, 60, 1);
select * from cartela;

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- FUNCTION
delimiter $$
CREATE FUNCTION parImpar(numero INT)
RETURNS CHAR(05) DETERMINISTIC
BEGIN
	DECLARE tipo CHAR(05) DEFAULT NULL;
    SET tipo = 'IMPAR';
    IF numero mod 2 = 0 THEN
		SET tipo = 'PAR';
	END IF;
    RETURN (tipo);
END$$
delimiter ;

-- USANDO FUNCTION
SELECT parImpar(10), parImpar(23);

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- CURSOR
CREATE TABLE simulacao(
	nome VARCHAR(100),
    salario DECIMAL(10, 2),
    novoSalario DECIMAL(10,2)
);


-- DECLARANDO CURSOR 
delimiter $$
CREATE PROCEDURE simulaReajuste()
BEGIN
	DECLARE done BOOLEAN DEFAULT FALSE; -- Variavel para identificar o final do cursor
    DECLARE vnome VARCHAR(100);
    DECLARE vsalario DECIMAL(10, 2);
    DECLARE vnovoSalario DECIMAL(10, 2);
    DECLARE vdepartamento INT;
    
    DECLARE cursorFuncionario CURSOR
    FOR SELECT nome, departamento, salario
		FROM funcionario;
	
    DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET done = TRUE;
	
    -- ABRINDO CURSOR
	open cursorFuncionario;
    
    -- FETCH
    leCursor: loop
		FETCH cursorFuncionario
        INTO vnome, vdepartamento, vsalario;
        IF done THEN -- testa se o cursor chegou ao final.
			leave leCursor; -- sai do loop ao chegar no final
		END IF;
        
        IF vdepartamento = 1 THEN
			SET vnovoSalario = vsalario * 1.10;
		ELSEIF vdepartamento = 2 THEN
			SET vnovoSalario = vsalario * 1.12;
		ELSE
			SET vnovoSalario = vsalario * 1.08;
		END IF;
		
        INSERT INTO simulacao
			VALUES (vnome, vsalario, vnovoSalario);
	END LOOP;
    
-- FECHA CURSOR
close cursorFuncionario;
END$$
delimiter ;

-- CHAMANDO CURSOR
CALL simulaReajuste();

-- CONFERINDO CURSOR
select * from simulacao;







