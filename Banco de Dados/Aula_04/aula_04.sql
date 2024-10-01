-- ///////////////////////////////////////////////////////////////////////////////////////////////////
-- AULA 04
-- ///////////////////////////////////////////////////////////////////////////////////////////////////

-- Inclusão de Registros
create table cidade (
	id int,
    nome varchar(100) not null,
    uf char(02),
    constraint pkCidade primary key (id)
);

create table cliente (
	id int auto_increment,
    nome varchar(100),
    cidadeId int not null,
    constraint pkcliente primary key (id),
    constraint fkClienteCidade foreign key (cidadeId) references cidade(id)
);

-- insert sintaxe completa
insert into cidade (id, nome, uf) values (1, 'Bagé', 'RS');

-- insert reduzido
insert into cidade values (2, 'Parnaiba', 'PI');

-- insert de algumas colunas
insert into cidade (id, nome) values (3, 'Imperatriz');

insert into cliente (nome, cidadeid)  values ('Maria', 2);
insert into cliente (nome, cidadeid) values ('Nicolas', 2), ('Helena', 1), ('Beatriz', 3);

create table funcionario (
	id int,
    nome varchar(100),
    cidadeId int not null,
    constraint fkFuncCidade foreign key (cidadeId) references cidade(id)
);

-- Copia os dados da tabela cliente para a tabela funcionario
insert into funcionario (id, nome, cidadeid)
	select id, nome, cidadeid from cliente


-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- Exclusão e modificação de registros
create database aula;
use aula;


create table cidade (
id int,
nome varchar(100) not null,
uf char(02),
constraint pkCidade primary key (id)
);

set SQL_SAFE_UPDATES = 0;

-- Inserir os registros na tabela cidade
insert into cidade values (1, 'Curitiba','PR'), 
(2, 'Bagé', 'RS'), (3, 'Parnaíba', 'PI'),(4, 'Videira', 'SC'),(5, 'Imperatriz', 'MA'),(6, 'Belo Horizonte', 'MG'),(7, 'São Paulo', 'SP');

-- Update (Sempre colocar where)
update cidade set nome = 'Gramado' where id = 2;
update cidade set nome = 'Londrina', uf = 'PR' where id = 5;


-- delete (Sempre colocar where)
delete from cidade where id = 7;

-- select
select * from cidade;

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- Restrição de consultas
CREATE TABLE cliente (
    id INT,
    nome VARCHAR(100) NOT NULL,
    genero CHAR(1),
    nascimento DATE,
    salario DECIMAL(10,2) DEFAULT 0,
    email VARCHAR(120) UNIQUE,
    cidadeId INT,
    CONSTRAINT fkcidadeId FOREIGN KEY (cidadeId) REFERENCES cidade(id)
);

drop table cliente;

insert into cliente values (1, 'Helena Magalhães', 'F', '2000-01-01', 12500.99, 'helena.magalhaes@email.com', 2),
                         (2, 'Nicolas Oliveira', 'M', '2002-12-10', 8500, 'nicolas.oliveira@email.com', 3),
                         (3, 'Ana Rosa Silva', 'F', '1996-12-31', 8500, 'ana.rosa@email.com', 1),
                         (4, 'Tales Heitor Souza', 'M', '2000-10-01', 7689, 'tales.heitor@email.com', 1),
                         (5, 'Bia Meireles', 'F', '2002-03-14', 9450, 'bia.meireles@email.com', 2),
                         (6, 'Pedro Filho', 'M', null, 6800, 'pedro.filho@email.com', 5),
                         (7, 'Helena Soares', 'F', '1994-08-10', 8600, 'helena.soares@email.com', 4),
                         (8, 'Sophia Arcanjo', 'F', '1991-11-20', 6320, 'sophia.arcanjo@email.com', 6);



select * from cliente where cidadeid = 1;
select * from cliente where cidadeid = 1 and salario > 8000;
select * from cliente where cidadeid = 1 or cidadeid = 3 or cidadeid = 5;

-- IN
select nome, salario from cliente where cidadeid = 1 or cidadeid = 3 or cidadeid = 5;
select nome, salario from cliente where cidadeid in (1,3,5);

-- BETWEEN
select nome, salario from cliente where salario >= 5000 and salario <= 10000;
select nome, salario from cliente where salario between 5000 and 10000;

-- ORDER BY
select * from cliente order by nome asc;
select * from cliente order by nome desc;
select nome, salario from cliente where salario between 5000 and 10000;
select nome, salario from cliente where salario between 5000 and 10000 order by salario;
select nome, salario from cliente where salario between 5000 and 10000 order by 2;

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- JUNÇÃO DE TABELAS
select * from estado;
select * from cidade;
select * from pergunta;
select * from funcionario;
select * from cliente;

-- inner join
select nomeCidade, nomeEstado
from cidade
inner join estado
on cidade.estadoId = estado.id;

select nomeCidade, nomeEstado
from cidade, estado
where cidade.estadoId = estado.id

-- left join
select nomeCidade, nomeEstado
from cidade left join estado
on cidade.estadoId = estado.id;

-- right join
select nomeCidade, nomeEstado
from cidade right join estado
on cidade.estadoId = estado.id;

-- cross join
select nomeCidade, nomeEstado
from cidade, estado
order by nomeCidade;

-- self join
select funcionario.nomeFuncionario, gerente.nomeFuncionario
from funcionario
inner join funcionario gerente
on funcionario.gerente = gerente.matricula


-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- Outros comandos e recomendações
-- recomendações
'''
Alias, limit, distinct, case, union e union all
Boas práticas:
	Não use o asterisco (*) no comando select
    Use filtros (where) no delete e no update
    Evite criar um insert com várias linhas
'''

-- Outros comandos
-- alias
select nomeFuncionario as 'Nome Funcionario' from funcionario

-- limit
select nomeFuncionario from funcionario limit 3

-- union
select nomeFuncionario from funcionario
union
select nomeCidade from cidade

-- union all
select nomeFuncionario from funcionario
union all
select nomeCidade from cidade

-- case
select nomeFuncionario 'Nome do Funcionario',
case
	when genero = 'F' then 'Feminino'
	when genero = 'M' then 'Masculino'
end as 'Genero'
from funcionario;

