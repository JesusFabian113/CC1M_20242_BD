CREATE DATABASE EXERCICIO2_DML;
USE EXERCICIO2_DML;

CREATE TABLE IF NOT EXISTS PASSAGEIROS (
    ID_PASSAGEIRO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL,
    TELEFONE VARCHAR(15),
    ENDERECO VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS AEROPORTOS (
    ID_AEROPORTO INT AUTO_INCREMENT PRIMARY KEY,
    CODIGO_AEROPORTO VARCHAR(10) NOT NULL,
    NOME_AEROPORTO VARCHAR(100) NOT NULL,
    LOCALIZACAO VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS AERONAVES (
    ID_AERONAVE INT AUTO_INCREMENT PRIMARY KEY,
    MODELO VARCHAR(50) NOT NULL,
    IDENTIFICADOR VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS VOOS (
    ID_VOO INT AUTO_INCREMENT PRIMARY KEY,
    CODIGO_VOO VARCHAR(10) NOT NULL UNIQUE,
    ORIGEM INT,
    DESTINO INT,
    HORARIO_PARTIDA DATETIME NOT NULL,
    HORARIO_CHEGADA DATETIME NOT NULL,
    CONSTRAINT FK_ORIGEM FOREIGN KEY (ORIGEM) REFERENCES AEROPORTOS(ID_AEROPORTO),
    CONSTRAINT FK_DESTINO FOREIGN KEY (DESTINO) REFERENCES AEROPORTOS(ID_AEROPORTO)
);

CREATE TABLE IF NOT EXISTS FUNCIONARIOS (
    ID_FUNCIONARIO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    CARGO ENUM('PILOTO', 'COMISSARIO', 'EQUIPE_DE_SOLO') NOT NULL
);

CREATE TABLE IF NOT EXISTS RESERVAS (
    ID_RESERVA INT AUTO_INCREMENT PRIMARY KEY,
    ID_PASSAGEIRO INT,
    ID_VOO INT,
    DATA_RESERVA DATETIME NOT NULL,
    CONSTRAINT FK_RESERVA FOREIGN KEY (ID_PASSAGEIRO) REFERENCES PASSAGEIROS(ID_PASSAGEIRO),
    CONSTRAINT FK_VOO FOREIGN KEY (ID_VOO) REFERENCES VOOS(ID_VOO)
);

CREATE TABLE IF NOT EXISTS OPERACOES_VOO (
    ID_OPERACAO INT AUTO_INCREMENT PRIMARY KEY,
    ID_VOO INT,
    ID_FUNCIONARIO INT,
    DATA_OPERACAO DATETIME NOT NULL,
    CONSTRAINT FK_VOO FOREIGN KEY (ID_VOO) REFERENCES VOOS(ID_VOO),
    CONSTRAINT FK_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO) REFERENCES FUNCIONARIOS(ID_FUNCIONARIO)
);

INSERT INTO Passageiros (id_passageiro, nome, cpf, telefone, endereco) 
VALUES (1, 'João Silva', '123.456.789-00', '(11) 98765-4321', 'Rua A, 123, São Paulo, SP');

INSERT INTO Passageiros (id_passageiro, nome, cpf, telefone, endereco) 
VALUES (2, 'Maria Oliveira', '234.567.890-11', '(21) 91234-5678', 'Avenida B, 456, Rio de Janeiro, RJ');

INSERT INTO Passageiros (id_passageiro, nome, cpf, telefone, endereco) 
VALUES (3, 'Carlos Souza', '345.678.901-22', '(31) 92345-6789', 'Praça C, 789, Belo Horizonte, MG');

UPDATE Passageiros 
SET endereco = 'Rua D, 101, São Paulo, SP' 
WHERE id_passageiro = 1;
DELETE FROM Passageiros 
WHERE id_passageiro = 3;

INSERT INTO Voos (id_voo, origem, destino, hora_partida, hora_chegada) 
VALUES (101, 'São Paulo', 'Rio de Janeiro', '2024-11-10 08:00:00', '2024-11-10 09:30:00');

INSERT INTO Voos (id_voo, origem, destino, hora_partida, hora_chegada) 
VALUES (102, 'Rio de Janeiro', 'Belo Horizonte', '2024-11-10 10:00:00', '2024-11-10 11:30:00');

INSERT INTO Voos (id_voo, origem, destino, hora_partida, hora_chegada) 
VALUES (103, 'Belo Horizonte', 'São Paulo', '2024-11-10 12:00:00', '2024-11-10 13:30:00');

UPDATE Voos 
SET hora_chegada = '2024-11-10 10:00:00' 
WHERE id_voo = 101;
DELETE FROM Voos 
WHERE id_voo = 103;

INSERT INTO Aeroportos (id_aeroporto, codigo_aeroporto, nome_aeroporto, localizacao) 
VALUES (1, 'GRU', 'Aeroporto Internacional de São Paulo', 'São Paulo, SP');

INSERT INTO Aeroportos (id_aeroporto, codigo_aeroporto, nome_aeroporto, localizacao) 
VALUES (2, 'GIG', 'Aeroporto Internacional do Rio de Janeiro', 'Rio de Janeiro, RJ');

INSERT INTO Aeroportos (id_aeroporto, codigo_aeroporto, nome_aeroporto, localizacao) 
VALUES (3, 'CNF', 'Aeroporto Internacional de Confins', 'Belo Horizonte, MG');

UPDATE Aeroportos 
SET localizacao = 'São Paulo, SP, Terminal 2' 
WHERE codigo_aeroporto = 'GRU';
DELETE FROM Aeroportos 
WHERE id_aeroporto = 3;

INSERT INTO Aeronaves (id_aeronave, modelo, ano_fabricacao) 
VALUES (1, 'Boeing 737', 2015);

INSERT INTO Aeronaves (id_aeronave, modelo, ano_fabricacao) 
VALUES (2, 'Airbus A320', 2018);

INSERT INTO Aeronaves (id_aeronave, modelo, ano_fabricacao) 
VALUES (3, 'Embraer 195', 2020);

UPDATE Aeronaves 
SET modelo = 'Airbus A350' 
WHERE id_aeronave = 2;
DELETE FROM Aeronaves 
WHERE id_aeronave = 1;

INSERT INTO Funcionarios (id_funcionario, nome, cargo, data_admissao) 
VALUES (1, 'Ana Lima', 'Piloto', '2022-01-10');

INSERT INTO Funcionarios (id_funcionario, nome, cargo, data_admissao) 
VALUES (2, 'Pedro Costa', 'Comissário de Bordo', '2021-03-15');

INSERT INTO Funcionarios (id_funcionario, nome, cargo, data_admissao) 
VALUES (3, 'Lucas Almeida', 'Equipe de Solo', '2020-05-20');

UPDATE Funcionarios 
SET cargo = 'Co-piloto' 
WHERE id_funcionario = 1;
DELETE FROM Funcionarios 
WHERE id_funcionario = 3;

INSERT INTO Reservas (id_reserva, id_passageiro, id_voo, data_reserva) 
VALUES (1, 1, 101, '2024-11-01');

INSERT INTO Reservas (id_reserva, id_passageiro, id_voo, data_reserva) 
VALUES (2, 2, 102, '2024-11-02');

INSERT INTO Reservas (id_reserva, id_passageiro, id_voo, data_reserva) 
VALUES (3, 1, 103, '2024-11-03');

UPDATE Reservas 
SET data_reserva = '2024-11-05' 
WHERE id_reserva = 1;
DELETE FROM Reservas 
WHERE id_reserva = 2;

INSERT INTO Operacoes_voo (id_operacao, id_voo, id_funcionario, data_operacao) 
VALUES (1, 101, 1, '2024-11-10');

INSERT INTO Operacoes_voo (id_operacao, id_voo, id_funcionario, data_operacao) 
VALUES (2, 102, 2, '2024-11-10');

INSERT INTO Operacoes_voo (id_operacao, id_voo, id_funcionario, data_operacao) 
VALUES (3, 103, 3, '2024-11-10');

UPDATE Operacoes_voo 
SET data_operacao = '2024-11-11' 
WHERE id_operacao = 1;
DELETE FROM Operacoes_voo 
WHERE id_operacao = 3;
