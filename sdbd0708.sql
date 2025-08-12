create database CentralTec;

create table produto(
produo_id serial primary key,
descricao varchar(100) not null,
cliente_id int not null,
foreign key(cliente_id) references cliente(cliente_id),
valor_produto 
);

create table funcionario(
funcionario_id serial primary key,
nome_funcionario varchar(30) not null,
cpf char(11) not null unique,
telefone char(11) not null unique,
cargo_id int not null,
foreign key (cargo_id) references cargo(cargo_id),
data_nasciento date not null,
endereco_id int not null,
foreign key (endereco_id) references endereco(endereco_id)
);

create table endereco(
endereco_id serial primary key unique,
logradouro varchar(30) not null,
localidade varchar(40) not null,
uf varchar(30) not null,
cep char(8) not null,
bairro varchar(50) not null
);

create table dados_empresa(
dados_empresa_id serial primary key,
endereco_id int not null,
foreign key (endereco_id) references endereco(endereco_id),
razao_social varchar(30) not null unique,
CNPJ char(18) not null unique
);

create table cliente(
cliente_id serial primary key,
nome_cliente varchar(30) not null,
CNPJ char(18) not null unique,
endereco_id int not null,
foreign key (endereco_id) references endereco(endereco_id)
);

create table cargo(
cargo_id serial primary key,
nome_cargo varchar(30) not null
);

create table projeto(
projeto_id serial primary key,
produto_id int not null,
foreign key(prduto_id) references produto(produto_id),
agenda_id int not null,
foreign key(agenda_id) references agenda(agenda_id)
);

create table tarefa(
tarefa_id serial primary key,
projeto_id int not null,
foreign key(projeto_id) references projeto(projeto_id),
agenda_id int not null,
foreign key(agenda_id) references agenda(agenda_id),
descricao varchar(100)
);

create table agenda(
agenda_id serial primary key,
prazo date not null,
data_inicial date not null

);

create table pagamento(
pagamento_id serial primary key,
salario numeric(6,2),
funcionario_id int not null,
foreign key(funcionario_id) references funcionario(funciomario_id)
pagamento_servico numeric(6,2)
);

create table servico(
servico_id serial primary key,
descricao varchar(50) not,
pagamento_id int not null,
foreign key(funcionario_id) references funcionario(funcionario_id),
produto_id int not null,
foreign key(produto_id) references produto(produto_id)
);

create table departamento(
departamento_id serial primary ey,
nome_departamento varchar(20) not null
);

create table linguagem_prog(
linguagem_prog_id serial primary key,
tipo varchar(15)
)

create table compra(
compra_id serial primary key,
material varchar(50) not null
);

create table faturamento(
faturamento_id serial primary key,
valor_produto numeric(6.2),
manutencao_id int not null,
foreign key(manutencao_id) references manutencao(manutencao_id)
);

create table manutencao(
manutencao_id serial primary key,
produto_id int not null,
foreign key(produto_id) references produto(produto_id),
valor_manutencao numeric(6,2)
);









