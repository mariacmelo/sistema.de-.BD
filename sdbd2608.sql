CREATE DATABASE db_revenda_mariamelo;

CREATE TABLE Clientesm (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    email VARCHAR(70) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    data_cadastro date
);

CREATE TABLE Produtosm (
    produto_id serial PRIMARY KEY,
    nome_produto varchar(30) NOT NULL,
    descricao text,
    preco numeric(10, 2) NOT NULL,
    estoque int NOT NULL 
);

CREATE TABLE Vendasm (
    venda_id int PRIMARY KEY,
    cliente_id int,
    data_venda date,
    valor_total numeric(10, 2) NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES Clientesm(cliente_id)
);


CREATE TABLE Funcionariosm (
    funcionario_id serial primary KEY,
    nome_funcionario varchar(60) NOT NULL,
    cargo varchar(20),
    salario numeric(10, 2) NOT NULL,
    data_admissao date NOT NULL
);

CREATE TABLE Vendas_Produtosm (
    venda_id int,
    produto_id int,
    quantidade int NOT NULL,
    PRIMARY KEY (venda_id, produto_id),
    CONSTRAINT fk_venda FOREIGN KEY (venda_id) REFERENCES Vendasm(venda_id),
    CONSTRAINT fk_produto FOREIGN KEY (produto_id) REFERENCES Produtosm(produto_id)
);

CREATE TABLE Pagamentosm (
    pagamento_id int PRIMARY KEY,
    venda_id int,
    metodo_pagamento varchar(20) NOT NULL,
    valor_pago numeric(10, 2) NOT NULL,
    data_pagamento date,
    CONSTRAINT fk_venda_pagamento FOREIGN KEY (venda_id) REFERENCES Vendasm(venda_id)
);



INSERT INTO Clientesm (cliente_id,nome, email, telefone) values
('11','Maria Melo', 'mariam@email.com', '123456789'),
('22','José Silva', 'jose@email.com', '987654321'),
('33','Ana Costa', 'ana@email.com', '111223344'),
('44','Carlos Souza', 'carlos@email.com', '556677889'),
('55','Luana Pereira', 'luana@email.com', '123123123'),
('66','Felipe Almeida', 'felipe@email.com', '987987987'),
('77','Patricia Lima', 'patricia@email.com', '456789012'),
('88','Rafael Martins', 'rafael@email.com', '789012345'),
('99','Sofia Oliveira', 'sofia@email.com', '333444555'),
('100','Gustavo Ribeiro', 'gustavo@email.com', '666777888');

INSERT INTO Produtosm (nome_produto, descricao, preco, estoque) values
('Cadeira', 'Cadeira confortável de escritório', 150.00, 50),
('Mesa', 'Mesa de escritório de madeira', 250.00, 30),
('Computador', 'Computador de alto desempenho', 3500.00, 20),
('Teclado', 'Teclado mecânico', 300.00, 100),
('Mouse', 'Mouse ergonômico', 80.00, 150),
('Monitor', 'Monitor 27 polegadas', 1000.00, 40),
('Cafeteira', 'Cafeteira elétrica', 200.00, 60),
('Projetor', 'Projetor para apresentações', 1500.00, 15),
('Luminária', 'Luminária LED', 90.00, 75),
('Estante', 'Estante de livros', 350.00, 25);

INSERT INTO Vendasm (venda_id,data_venda, valor_total) values
('11','16-08-2025', 500.00),
('22','17-08-2025', 700.00),
('33','17-07-2025', 1000.00),
('44','18-08-2025', 400.00),
('55','19-08-2025', 600.00),
('66','20-08-2025', 800.00),
('77','22-08-2025', 250.00),
('88','23-08-2025', 1500.00),
('99','24-08-2025', 300.00),
('100','23-10-2024', 450.00);

INSERT INTO Funcionariosm (nome_funcionario, cargo, salario, data_admissao) VALUES
('Lucas Silva', 'Vendedor', 2500.00, '2021-01-01'),
('Maria Oliveira', 'Atendente', 2000.00, '2020-03-15'),
('Fernanda Costa', 'Gerente', 4500.00, '2019-07-30'),
('Carlos Almeida', 'Vendedor', 3000.00, '2022-05-25'),
('Bruna Santos', 'Atendente', 2100.00, '2020-12-10'),
('Paulo Souza', 'Vendedor', 2700.00, '2021-08-20'),
('Juliana Lima', 'Gerente', 5000.00, '2018-11-12'),
('Rafael Costa', 'Vendedor', 2900.00, '2022-01-05'),
('Patricia Almeida', 'Atendente', 2200.00, '2019-10-15'),
('Carlos Lima', 'Vendedor', 2600.00, '2020-06-30');

INSERT INTO Vendas_Produtosm (venda_id, produto_id, quantidade) values
(11, 1, 2),
(22, 2, 71),
(33, 3, 81),
(44, 4, 200),
(55, 5, 1),
(66,6, 02),
(77, 7, 17),
(88, 8,61),
(99, 9, 52),
(100, 10,53);

INSERT INTO Pagamentosm (pagamento_id,venda_id,metodo_pagamento, valor_pago,data_pagamento) values
('11','1', 'Cartão', 250.00,'12-03-2025'),
('22','2', 'Dinheiro', 500.00,'13-08-2024'),
('33',3, 'Cartão', 1000.00,'20-09-2024'),
('44',4, 'Pix', 200.00,'19-07-2025'),
('55',5, 'Cartão', 600.00,'18-08-2025'),
('66',6, 'Dinheiro', 400.00,'22-08-2025'),
('77',7, 'Pix', 250.00,'21-07-2025'),
('88',8, 'Cartão', 1500.00,'21-08-2025'),
('99',9, 'Dinheiro', 300.00,'20-07-2025'),
('100',10, 'Cartão', 450.00,'25-07-2025');


CREATE VIEW vw_detalhes_venda AS
SELECT 
    v.venda_id,
    v.data_venda,
    c.nome AS nome_cliente,
    p.nome_produto,
    vp.quantidade,
    p.preco,
    (vp.quantidade * p.preco) AS valor_total_item
FROM 
    Vendasm v
JOIN 
    Clientesm c ON v.cliente_id = c.cliente_id
JOIN 
    Vendas_Produtosm vp ON v.venda_id = vp.venda_id
JOIN 
    Produtosm p ON vp.produto_id = p.produto_id;


CREATE VIEW vw_resumo_pagamento as
SELECT 
    v.venda_id,
    v.data_venda,
    p.metodo_pagamento,
    p.valor_pago,
    (SELECT SUM(valor_pago) from Pagamentosm where venda_id = v.venda_id) as total_pago
from 
    Vendasm v
join
    Pagamentosm p ON v.venda_id = p.venda_id;

SELECT * FROM vw_detalhes_venda;

SELECT * FROM vw_resumo_pagamento;



