create database senai_tech;

use senai_tech;

create table departamentos (
id int,
nome varchar(60),
primary key (id)
);

create table funcionarios (
id int,
nome varchar (60),
sobrenome varchar(60),
salario decimal(10,2),
id_departamento int,
FOREIGN KEY (id_departamento) REFERENCES
departamentos (id)
); 

drop table funcionarios;
drop table departamentos;

-- Liste nome, sobrenome e nome do departamento dos funcionários.
select f.nome,f.sobrenome,d.nome as nome_departamento 
from funcionarios as f 
inner join departamentos  as d on f.id_departamento = d.id;

-- Liste nome, sobrenome e nome do departamento dos funcionários do
-- departamentos de TI

-- Liste nome, sobrenome e nome do departamento dos funcionários do
-- departamentos de TI
SELECT f.nome, f.sobrenome, d.nome AS nome_departamento
FROM funcionarios f
INNER JOIN departamentos d ON f.id_departamento = d.id
WHERE d.nome = 'TI';

-- Liste nome, sobrenome e nome do departamento dos funcionários do
-- departamentos de TI ordenado pelo nome
SELECT f.nome, f.sobrenome, d.nome AS nome_departamento
FROM funcionarios f
INNER JOIN departamentos d ON f.id_departamento = d.id
WHERE d.nome = 'TI'
order by f.nome;

-- Liste nome, sobrenome, salario e nome do departamento dos
-- funcionários do departamentos de TI que recebem acima de 5000
-- ordenado pelo nome 
SELECT f.nome, f.sobrenome,f.salario, d.nome AS nome_departamento
FROM funcionarios f
INNER JOIN departamentos d ON f.id_departamento = d.id
WHERE d.nome = 'TI' and f.salario > 5000 
order by f.nome;

-- Calcular a média salarial dos funcionários em cada departamento
SELECT d.nome AS nome_departamento, AVG(f.salario) AS media_salarial
FROM funcionarios f
INNER JOIN departamentos d ON f.id_departamento = d.id
GROUP BY d.id, d.nome;

-- Mostrar o nome completo (concatenando nome e sobrenome) dos
-- funcionários que pertencem ao departamento "TI"
select concat(f.nome,' ',f.sobrenome) as nome_completo 
from funcionarios f 
inner join departamentos d on f.id_departamento = d.id 
where d.nome = 'ti' ;

--  • Calcular a soma total dos salários de todos os funcionários no departamento de "Recursos
-- Humanos“
SELECT SUM(salario) AS soma_total_salarios
FROM funcionarios
WHERE id_departamento = (SELECT id FROM departamentos WHERE nome = 'Recursos Humanos');

-- Contar quantos funcionários cada departamento possui
SELECT d.nome,COUNT(*) AS numero_funcionarios
FROM funcionarios f
inner JOIN departamentos d ON f.id_departamento
GROUP BY d.id;

-- Listar os funcionários que ganham mais de 7000 em ordem alfabética
SELECT f.nome, f.sobrenome,f.salario, d.nome AS nome_departamento
FROM funcionarios f
INNER JOIN departamentos d ON f.id_departamento = d.id
WHERE  f.salario > 7000 
order by f.nome;

-- Mostrar o nome do departamento e a média de salário dos funcionários de cada departamento
select d.nome, avg(f.salario) as media_salarial 
from funcionarios f inner join departamentos d
on f.id_departamento = d.id 
group by d.id;

-- Mostrar os funcionários que têm sobrenome “Matisse" e seus respectivos departamentos
select  concat(f.nome,' ',f.sobrenome) as nome_completo,d.nome
from funcionarios f inner join departamentos d 
on f.id_departamento = d.id where f.sobrenome = 'matisse'
group by d.id; 






