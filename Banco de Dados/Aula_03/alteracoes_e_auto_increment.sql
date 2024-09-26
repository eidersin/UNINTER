create table cidade (
	id int primary key auto_increment,
    nome varchar(120) not null,
    cepgeral int unsigned zerofill);
    
alter table cidade
add cepgeral char(05); -- Adiciona coluna na tabela

alter table cidade
change dddd ddd char(05); -- Altera o nome da coluna

alter table cidade
modify ddd char(03); -- Modifica a estrutura da coluna

alter table cidade
drop cepgeral; -- Deleta coluna da tabela

insert into cidade (nome, cepgeral, ddd)
values ('Rio de Janeiro', 985754, 999);


select * from cidade;
describe cidade