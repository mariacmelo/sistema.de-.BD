CREATE TABLE funcionario (
	id serial,
	nome varchar(20),
	cpf char(11),
	cargo_id int
);

CREATE TABLE cargo (
	id serial,
	nome varchar(20)
);

CREATE TABLE hospede (
	id serial, 
	nome varchar(20),
	cpf char(11),
	endereco_id int
);

CREATE TABLE endereco (
	id serial,
	logradouro varchar(50),
	localidade varchar(20),
	cep char(8),
	numero varchar (5),
	bairro varchar(20),
	uf char(2)
);

CREATE TABLE agenda (
	id serial, 
	data_checkin date,
	data_checkout date,
	hospede_id int,
	funcionario_id int
);

ALTER TABLE funcionario ADD PRIMARY KEY (id);
ALTER TABLE cargo ADD PRIMARY KEY (id);
ALTER TABLE hospede ADD PRIMARY KEY (id);
ALTER TABLE endereco ADD PRIMARY KEY (id);
ALTER TABLE agenda ADD PRIMARY KEY (id);

ALTER TABLE funcionario 
ADD CONSTRAINT fk_cargo
FOREIGN KEY (cargo_id)
REFERENCES cargo (cargo_id);

ALTER TABLE funcionario 
ADD CONSTRAINT fk_cargo
FOREIGN KEY (cargo_id)
REFERENCES cargo (cargo_id);

ALTER TABLE hospede 
ADD CONSTRAINT fk_endereco
FOREIGN KEY (endereco_id)
REFERENCES endereco (endereco_id);

ALTER TABLE agenda 
ADD CONSTRAINT fk_hospede
FOREIGN KEY (hospede_id)
REFERENCES hospede (hospede_id);

ALTER TABLE agenda 
ADD CONSTRAINT fk_funcionario
FOREIGN KEY (funcionario_id)
REFERENCES funcionario (funcionario_id);






INSERT INTO cargo (nome)
VALUES ('Gerente geral'),
('Recepcionista'),
('Governanta'),
('Camareiro'),
('Concierge');

INSERT INTO funcionario (nome, cpf, cargo_id)
VALUES ('Julia Pinheiro', '16989352779', 1),
('Fabrício', '17167339792', 2),
('Giovana', '20041933796', 3),
('Guilherme', '16669608705', 4),
('Giovana B.', '16334547821', 5);

INSERT INTO endereco (logradouro, localidade, cep, numero, bairro, uf)
VALUES ('Rua Mathias Hillen', 'Petrópolis', '25670050', '276', 'Mosela', 'RJ'),
('Rua Doutor Paulo Rumide', 'Petrópolis', '25088224', '158', 'Quitandinha', 'RJ'),
('Rua Avenida Presidente Castelo Branco', 'Petrópolis', '25032010', '401', 'Retiro', 'RJ'),
('Rua Quissamã', 'Petrópolis', '25615411', '1235', 'Quissamã', 'RJ'),
('Rua Pedro Vogel Sobrinho', 'Petrópolis', '25720045', '191', 'Castrioto', 'RJ');

INSERT INTO hospede (nome, cpf, endereco_id,)
VALUES ('Maria', '16889362789', 1),
('Gabriela', '12167334392', 2),
('Letícia', '20641910796', 3),
('Luiza', '16029608805', 4),
('Thiago', '16093454723', 5);


INSERT INTO agenda (data_checkin, data_checkout, hospede_id, funcionario_id)
VALUES ('2025-07-29', '2025-08-27', 1, 2),
('2025-09-24', '2025-10-26', 2, 2),
('2025-06-15', '2025-07-30', 3, 2),
('2026-01-01', '2026-02-01', 4, 2),
('2023-02-28', '2023-04-30', 5, 2);







SELECT nome FROM funcionario f 
WHERE f.cargo_id = 2;


SELECT endereco FROM endereco e; 


SELECT count(*) FROM hospede h;


SELECT nome FROM cargo;


SELECT data_checkin FROM agenda a;
















