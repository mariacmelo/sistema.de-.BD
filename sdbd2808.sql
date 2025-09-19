SELECT * FROM Clientesm
WHERE nome LIKE '%Maria%';

EXPLAIN SELECT * FROM Clientesm
WHERE nome LIKE '%Maria%';

CREATE INDEX idx_clientesm_nome
ON clientesm(nome);

EXPLAIN SELECT * FROM Clientesm
WHERE nome LIKE '%Maria%';

ALTER TABLE Clientesm
ALTER COLUMN telefone TYPE int;

ALTER TABLE Clientesm
ALTER COLUMN cliente_id TYPE varchar;

CREATE USER maria  WITH PASSWORD 'maria123';

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO maria;
 
CREATE USER ana  WITH PASSWORD 'ana456';

GRANT SELECT ON Clientesm TO ana;


SELECT * FROM Clientesm
WHERE nome LIKE '%Maria%';

EXPLAIN SELECT * FROM Clientesm
WHERE nome LIKE '%Maria%';

CREATE INDEX idx_clientesm_nome
ON clientesm(nome);

EXPLAIN SELECT * FROM Clientesm
WHERE nome LIKE '%Maria%';


ALTER TABLE Clientesm
ALTER COLUMN telefone TYPE int;

SELECT c.nome, v.valor_total
FROM Clientesm c
INNER JOIN Vendasm v ON c.cliente_id = v.cliente_id;


SELECT c.nome, v.valor_total
FROM Clientesm c
LEFT JOIN Vendasm v ON c.cliente_id = v.cliente_id;

SELECT c.nome, v.valor_total
FROM Clientesm c
RIGHT JOIN Vendasm v ON c.cliente_id = v.cliente_id;


SELECT v.venda_id, p.nome_produto
FROM Vendasm v
INNER JOIN Vendas_Produtosm vp ON v.venda_id = vp.venda_id
INNER JOIN Produtosm p ON vp.produto_id = p.produto_id;

UPDATE Produtosm
SET descricao = NULL
WHERE preco > 500.00;

SELECT v.venda_id, vp.produto_id, vp.quantidade
FROM Vendasm v
INNER JOIN Vendas_Produtosm vp ON v.venda_id = vp.venda_id;

SELECT v.venda_id, vp.produto_id, vp.quantidade
FROM Vendasm v
LEFT JOIN Vendas_Produtosm vp ON v.venda_id = vp.venda_id;

SELECT v.venda_id, vp.produto_id, vp.quantidade
FROM Vendasm v
RIGHT JOIN Vendas_Produtosm vp ON v.venda_id = vp.venda_id;
SELECT vp.venda_id, p.nome_produto, p.preco, vp.quantidade
FROM Vendas_Produtosm vp
INNER JOIN Produtosm p ON vp.produto_id = p.produto_id;

SELECT vp.venda_id, p.nome_produto, p.preco, vp.quantidade
FROM Vendas_Produtosm vp
LEFT JOIN Produtosm p ON vp.produto_id = p.produto_id;

SELECT vp.venda_id, p.nome_produto, p.preco, vp.quantidade
FROM Vendas_Produtosm vp
RIGHT JOIN Produtosm p ON vp.produto_id = p.produto_id;

SELECT f.nome_funcionario, v.venda_id, v.data_venda
FROM Funcionariosm f
INNER JOIN Vendasm v ON f.data_admissao <= v.data_venda;

SELECT f.nome_funcionario, v.venda_id, v.data_venda
FROM Funcionariosm f
LEFT JOIN Vendasm v ON f.data_admissao <= v.data_venda;

SELECT f.nome_funcionario, v.venda_id, v.data_venda
FROM Funcionariosm f
RIGHT JOIN Vendasm v ON f.data_admissao <= v.data_venda;
























