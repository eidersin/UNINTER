-- SUBQUERIES
    -- Subconsulta simples
select * from cliente
where cidadeId = (select id from cidade where nomeCidade = 'Curitiba');

    -- Subconsulta 
select * from cliente
where cidadeId in (select id from cidade where nomeCidade = 'Bagé' or nomeCidade = 'Curitiba');

    -- exists
select nome, salario 
from cliente
where salario < 7000
and exists (select * from cliente where salario > 12000);

    -- not exists
select nome, salario 
from cliente
where salario < 7000
and not exists (select * from cliente where salario > 13000);

    -- any // all
select * from cliente
where id > any (select distinct clienteId from vendas);

select * from cliente
where id > all (select distinct clienteId from vendas);

select cidadeId from cliente 
intersect
select id from cidade;

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////

-- FORMATAÇÃO DE DADOS TEXTUAIS
    -- lenght
select nome, length(nome) as 'Tamanho nome', length(dataNascimento) as 'Tamanho data' from cliente;

    -- upper
select upper(nome) from cliente;

    -- lower
select lower(nome) from cliente;

    -- trim, ltrim, rtrim # Remove espaços
select nome, ltrim(nome), rtrim(nome) from cliente;
select trim(both from nome), nome from cliente;

    -- substring
select substring(nome, 7), nome from cliente;
select substring(nome, 1, 3), nome from cliente;

    -- replace
select email, replace(email, '#', '@') from cliente;

    -- cast
select cast('2029-12-31' as date), cast('1000.99' as float);

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////

-- FORMATAÇÃO DE DADOS NÚMERICOS E TEMPORAIS
-- Númerico
-- round / truncate
select salario, round(salario, 2), truncate(salario, 2) from cliente;

-- mod / div
select mod(10, 2), 10 div 2;


-- Data
select day('2030-12-31');
select month('2030-12-31');
select year('2030-12-31');

select dayname('2030-12-31');
select monthname('2030-12-31');

select curtime();
select hour('15:01:05');
select minute('15:01:05');

-- Adiciona quantidade de dias a data
select adddate('2024-10-10', interval 30 day);
select adddate(curdate(), interval 1 month);

-- Diferença de dias entre datas
select datediff('2026-10-10', '2024-10-10');
select datediff('2025-10-10', curdate());

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////

-- Agregação / Extração de dados
select * from cliente;
select * from funcionario;

-- count
select count(*) from funcionario;
select count(*), count(genero) from funcionario;

-- sum
select sum(salario) from funcionario;

-- min / max
select nome, nascimento
from funcionario
where nascimento = (SELECT MIN(nascimento) FROM funcionario);

select min(salario), max(salario) from funcionario;

select nome, salario
from funcionario
where salario = (SELECT MIN(salario) FROM funcionario);

select nome, salario
from funcionario
where salario = (SELECT MAX(salario) FROM funcionario);

select nome, salario
from funcionario
where salario in (SELECT MAX(salario) FROM funcionario
					UNION ALL
                    SELECT MIN(salario) FROM funcionario);

-- avg
select avg(salario) from funcionario;

-- group by
select departamento, cargo, sum(salario) from funcionario
group by departamento, cargo;

-- having
select departamento, sum(salario)
from funcionario
group by departamento
having sum(salario) > 20000
order by 1;


-- ////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////

-- INTEGRIDADE E SEGURANÇA DE DADOS
create user 'aluno2' identified by '123';

flush privileges;

show grants for 'aluno2';

grant select, insert on aula.* to 'aluno2';