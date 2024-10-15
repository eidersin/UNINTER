use aula;
select * from cliente;
-- mod e div
select mod(4, 2) as 'resto divisão',
mod(5, 2) as 'resto divisão',
4 div 2 as 'quociente',
5 div 2 as 'quociente';

-- round e truncate
select salario, round(salario), round(salario, 2), round(salario, 1),
truncate(salario, 1), truncate(salario, 2)
from funcionario;

-- Formatação de texto
select nome, upper(nome), lower(nome), length(nome), ltrim(nome), rtrim(nome), substring(nome, 5), substring(nome, 1, 3),
dataNascimento, length(dataNascimento),
email, replace(email, '#', '@')
from cliente;

-- Funções de agregação
-- count * e count null
select count(*), count(genero) from funcionario;

-- conversão de valores
select cast('2000-01-01' as date),
cast('1000.00' as decimal),
cast('20:15' as time);

-- DATA/HORA
select curdate() as 'DATA ATUAL',
curtime() as 'HORA ATUAL',
now() as 'DATA/HORA ATUAL';

select date(curdate()) as 'FORMATO DATA',
time(curtime()) as 'FORMATO HORA',
date(now()) as 'NOW - FORMATO DATA';

-- funções referentes ao dia
select curdate() as 'DATA ATUAL',
day(curdate()) as 'DIA DO MÊS',
dayname(curdate()) as 'NOME DIA DA SEMANA',
dayofweek(curdate()) as 'DIA DA SEMANA',
dayofyear(curdate()) as 'DIA DO ANO' ,
last_day(curdate()) as 'ULTIMO DIA DO MÊS';

select month(curdate()) as 'NÚMERO DO MÊS DO ANO',
monthname(curdate()) as 'MÊS DO ANO',
year(curdate()) as 'ANO';

select curdate() as 'DATA ATUAL',
now() as 'DATA/HORA ATUAL',
week(curdate()) as 'SEMANA DO ANO',
weekday(now()) as 'DIA DA SEMANA', 
weekday(curdate()) as 'DIA DA SEMANA';

select curdate() as 'DATA ATUAL',
adddate(curdate(), interval 31 day) as 'DATA ATUAL + 31 DIAS',
adddate(curdate(), interval 1 month) as 'DATA ATUAL + 1 MÊS';

select curdate() as 'DATA ATUAL',
datediff('2022-01-01', curdate()) as 'DIF. DE DIAS 2022-01-01 E HOJE',
datediff(curdate(), '2022-01-01') as 'DIF. DE DIAS HOJE E 2022-01-01';

select curdate() as 'DATA ATUAL',
date_format(curdate(), '%w %m %y') as 'DATA FORMATADA',
date_format('2022-01-01 20:15:00', '%d/%m/%y - ' ' %h:%i:%s') as 'DATA/HORA FORMATADA';

-- Funções de hora
select curtime(), time(curtime()), hour(curtime()), minute(curtime()), second(curtime()), microsecond(curtime());
select addtime('01:00:00.999999', '02:00:00.999998');
select timestamp('2003-12-31'), timestamp('2003-12-31 12:00:00', '12:00:00');
select curdate(), curtime(), timestampadd(minute, 30, curdate());
select timediff('2021-12-31 23:59:59.000001', '2021-12-31 01:01:01.000002');
select time_format('20:30:00', '%h %m');

-- Contando com filtro
select count(*) from funcionario
    where genero = 'M';

-- sum
select sum(salario) from funcionario;

-- min / max / media
select min(salario), max(salario), avg(salario) from funcionario;

-- group by / order by
select departamento, count(*) as 'funcionarios' from funcionario
group by departamento
order by departamento;

select genero, avg(salario) from funcionario
group by genero;

select departamento, genero, count(*) from funcionario
group by departamento, genero;

-- having
select departamento, count(*) from funcionario
group by departamento
having count(departamento) > 2;


-- Subconsultas
select nome, salario from funcionario
    where salario = (select max(salario) from funcionario);

select nome, cidadeId from cliente 
    where cidadeId = (select id from cidade where nomeCidade = 'Bagé');

-- Usando o in
select nome, cidadeId  from cliente 
    where cidadeId in (select id from cidade where nomeCidade = 'Curitiba' or nomeCidade = 'Imperatriz');

-- Não Curitiba e não Imperatriz
select nome, cidadeId  from cliente 
    where cidadeId not in (select id from cidade where nomeCidade = 'Curitiba' or nomeCidade = 'Imperatriz');

-- Exists
-- < 7000 > 11000
select nome, genero, salario from cliente 
    where salario < 7000
    and exists (select * from cliente where salario > 11000);

-- Any
-- id cliente > id cliente venda
select id, nome, genero from cliente 
    where id > any (select distinct clienteId from vendas);

-- All
select id, nome, genero from cliente
    where id > all (select distinct clienteId from vendas);

-- Subconsulta correlacionada
-- salario > any salario do mesmo gênero
select id, nome, genero, salario from cliente c
    where salario > any (select salario from cliente where genero = c.genero);
