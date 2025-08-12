create table funcionario(
funcionario_id serial,
nome varchar(30),
data_nascimento date,
cpf char(11),
endereco_id int,
cargo_id int)

create table endereco(
endereco_id serial,
logradouro varchar(50),
localidade varchar(40),
uf varchar (30),
cep char(8),
bairro varchar(40))

create table cargo(
cargo_id serial,
nome varchar (20),
descricao varchar(60))

alter table funcionario add primary key(funcionario_id);
alter table endereco add primary key(endereco_id);
alter table cargo add primary key(cargo_id);

alter table funcionario
add constraint endereco_id
foreign key (endereco_id)
references endereco (endereco_id);

alter table funcionario 
add constraint cargo_id
foreign key (cargo_id)
references cargo (cargo_id);

insert into endereco (endereco_id, logradouro,localidade,uf, cep, bairro)
values 
(1,'Rua Lopes Trovão','Petropólis','Rio de Janeiro',23467802,'Alto da Serra'),
(2,'Rua Tereza','Petropóli','Rio de Janeiro',12345678 ,'Marechal Deodoro'),
(3,'Rua Francisco scali', 'Petropólis','Rio de Janeiro',87654321, 'Quissamã'),
(4,'Nova Cascatinha','Petropólis', 'Rio de Janeiro', 78563412,'Cascatinha'),
(5,'Gregorio Cruzick','Petropólis',' Rio de Janeiro', 09786543,'Bela Vista');

insert into cargo (cargo_id, nome, descricao)
values (1,'Administradora', 'Administra dados, tarefas e deveres da empresa'),
(2, 'CEO', 'Lidera a empresa e toma decisões para seu crescimento.'),
(3,'vendedor','Oferece produtos e fecha vendas para gerar receita.' ),
(4,'fornecedor','Fornece produtos ou serviços para apoiar a empresa'),
(5, 'contador','Organiza finanças e garante conformidade legal na empresa.');

insert into funcionario (funcionario_id, nome, data_nascimento,cpf, endereco_id,cargo_id)
values
(1, 'Marcelo Silva','17-09-2000',0986754214, '1','1' ),
(2, 'Marcia Garcia', '12-03-2001', 67809876543,'2', '2'),
(3, 'Claudia Fernandes', '08-02-1999',32156743209, '4', '3'),
(4, 'Amanda Moraes', '09-12-1986', 12345678912, '3', '4'),
(5, 'Breno Mendes', '29-08-2004', 09876543223,'5','5');




