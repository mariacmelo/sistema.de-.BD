create database MariaBolsas;
 create table cadastroc(
 cadastro_id serial primary key,
 nome varchar(30) not null,
 sobrenome varchar(15) not null,
 CPF char(11) not null unique,
 celular char(11) not null,
 email varchar(60) not null,
 endereco_id int not null
 );
 
 create table enderecol(
 endereco_id serial not null,
 cep char(11) not null,
 rua varchar(40) not null,
 ponto_referencia varchar(40) not null,
 numero int not null,
 bairro varchar(50) not null,
 cidade varchar(60) not null,
 uf varchar(40) not null
 );
 
create table login(
login_id serial primary key,
email varchar(60) not null,
senha varchar(15) not null);
 
create table produto(
produto_id serial primary key,
titulo varchar(30) not null,
descricao varchar(80) not null,
estoque int not null,
preco numeric(5,2) not null,
cor varchar(20) not null
);

create table carrinho(
carrinho_id serial primary key,
quantidade int,
produto_id int
);

create table pedido(
pedido_id serial primary key,
produto_id int not null,
endereco_id int not null
);

create table pagamentop(
pagamento_id serial primary key,
forma_pagamento varchar(10) not null,
pedido_id int not null
);

create table conta(
conta_id serial primary key,
endereco_id int,
pedido_id int
);

create table cartao_credito(
cartaocredido_id serial primary key,
cvc char(3) not null unique,
validade date not null,
nomecartao varchar(40) not null,
numerocartao int
);

alter table cadastroc
add constraint






