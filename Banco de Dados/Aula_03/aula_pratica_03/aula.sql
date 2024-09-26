
-- Mostra os Bancos de Dados do servidor
show databases;

-- Cria um Banco de Dados 
create database aulapratica;

-- Conecta um Banco de Dados
use aulapratica;

-- Mostra qual Banco de Dados está conectado
select database();

-- Mostra as tabelas do Banco de Dados
show tables;

-- Cria uma tabela simples, sem nenhuma restrição 
create table produto (
	id int not null,
    descricao varchar(100),
    preco decimal(8,2)
);

-- Mostra a estrutura da tabela
describe aluno;

-- Insere dados na tabela
insert into produto (id, descricao, preco) values (1, 'Smartphone XPTO G5', 1500.99);

-- Insert SIMPLIFICADO
insert into produto values (2, 'Notebook I7 4GB ram', 2500);

-- Consulta dados na tabela
select * from aluno;
select * from aluno order by salario;
select * from aluno order by salario desc;

-- Exclui uma tabela
drop table produto;

-- Exclui um Banco de Dados
drop database aula; -- nome do banco de dados

-- Verifica se o Banco de Dados existe antes de criá-lo
create database if not exists aula;

-- Criando uma tabela para usar de exemplo
create table aluno (
    id int,
    nome varchar(100) not null,
    genero char(01),
    nascimento date,
    estadoCivil char(01) check (estadoCivil in ('C', 'S', 'V', 'O')),
    salario decimal(10,2) unsigned default 0,
    email varchar(120) unique
);

insert into aluno values (1, 'Helena Magalhães', 'F', '2000-01-01', 'C', 12500.99, 'helena.magalhaes@email.com'),
                         (2, 'Nicolas Oliveira', 'M', '2002-12-10', 'S', 8500, 'nicolas.oliveira@email.com'),
                         (3, 'Ana Rosa Silva', 'F', '1996-12-31', 'S', 8500, 'ana.rosa@email.com'),
                         (4, 'Tales Heitor Souza', 'M', '2000-10-01', 'O', 7689, 'tales.heitor@email.com'),
                         (5, 'Bia Meireles', 'F', '2002-03-14', 'O', 9450, 'bia.meireles@email.com'),
                         (6, 'Pedro Filho', 'M', null, 'V', 6800, 'pedro.filho@email.com'),
                         (7, 'Helena Soares', 'F', '1994-08-10', 'S', 8600, 'helena.soares@email.com');




create table estado(
	id int not null primary key auto_increment,
    nome varchar(100) not null);
    
insert into estado (nome) values ('Bahia');

create table cidade(
	id int not null primary key auto_increment,
    nome varchar(100) not null,
    idEstado int, 
    constraint fkCidadeEstado foreign key (idEstado) references estado (id)
);

insert into cidade (nome, idEstado) values ('Cuiaba', 1);
-- ///////////////////////////////////////////////////////////////////////////////////

alter table aluno
add ddd int zerofill after email;

alter table aluno
change celular telefone varchar(12);

alter table aluno
modify ddd char(03);

alter table aluno
rename to alunos;

alter table alunos
add constraint pkAluno primary key(id);

select * from alunos;
describe alunos;
