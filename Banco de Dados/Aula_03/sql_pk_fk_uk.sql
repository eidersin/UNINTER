use aula;
create table cidade (
	id int primary key,
    nome varchar(100),
    sigla char(03) unique);
    
insert into cidade (id, nome, sigla) values (3, 'Belem', 'NTA');

create table cliente (
	id int primary key,
    nome varchar(100),
    idcidade int,
    constraint fkclienteCidade foreign key (idcidade) references cidade(id));

insert into cliente values (1, 'Jose', 1);

select * from cliente