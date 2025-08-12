--segunda atividade05/08
SELECT * FROM vaga;

SELECT * FROM carro;

SELECT * FROM tempo;


UPDATE carro SET marca = 'Honda' WHERE id = 1;

UPDATE carro SET modelo = 'Civic' WHERE id = 2;

UPDATE vaga SET número = 'A102' WHERE id = 3;

UPDATE tempo SET data_hora_saida = '2025-08-05 18:00.000' WHERE id = 4;

UPDATE carro SET vaga_id = 5 WHERE id = 5;


DELETE FROM carro WHERE chassi = '1';

DELETE FROM vaga WHERE número = '1';

DELETE FROM tempo WHERE data_hora_chegada = '2025-08-04 07:45:33.000';

DELETE FROM carro WHERE id = 3;

DELETE FROM tempo WHERE carro_id = 2;


INSERT INTO vaga (número) VALUES 
('6'),
('7'),
('8'), 
('9'), 
('10'),
('11'),
('12'),
('13'),
('16'),
('18');

INSERT INTO carro (marca, modelo, chassi, vaga_id) VALUES
('Toyota', 'Corolla', '7', '6'),
('Honda', 'Civic', '9', '7'),
('Ford', 'Focus', '5', '8'),
('Chevrolet', 'Onix', 'D',' 9'),
('Volkswagen', 'Golf', 'E', '10'),
('Fiat', 'Argo', 'F', '11'),
('Hyundai', 'HB20', 'G', '12'),
('Nissan', 'Kicks', 'H',' 13'),
('Renault', 'Kwids', 'I', '3'),
('Peugeot', '208', 'J', '18');

INSERT INTO tempo (data_hora_chegada, data_hora_saida, carro_id, vaga_id) VALUES
('2025-08-05 08:00.000', '2025-08-05 12:00.000', 1, 1),
('2025-08-05 09:00.000', '2025-08-05 13:00.000', 2, 2),
('2025-08-05 10:00.000', '2025-08-05 14:00.000', 3, 3),
('2025-08-05 11:00.000', '2025-08-05 15:00.000', 4, 4),
('2025-08-05 12:00.000', '2025-08-05 16:00.000', 5, 5),
('2025-08-05 13:00.000', '2025-08-05 17:00.000', 6, 6),
('2025-08-05 14:00.000', '2025-08-05 18:00.000', 7, 7),
('2025-08-05 15:00.000', '2025-08-05 19:00.000', 8, 8),
('2025-08-05 16:00.000', '2025-08-05 20:00.000', 9, 9),
('2025-08-05 17:00.000', '2025-08-05 21:00.000', 10, 10);

SELECT modelo FROM carro c
 INNER JOIN vaga v ON v.id = c.vaga_id
 WHERE v.numero = 44;

SELECT marca FROM carro c
 INNER JOIN vaga v ON v.id = c.vaga_id
 WHERE v.numero = 10;
 
 SELECT data_hora_chegada FROM tempo t 
 INNER JOIN carro c ON c.id = t.carro_id
 WHERE t.carro_id = 4;

select * from tempo;








