CREATE SCHEMA EXERCICIO2;
USE EXERCICIO2;

CREATE TABLE PASSEJEIROS (
    PASSEJEIRO_ID INT AUTO_INCREMENT PRIMARY KEY,
    NOME_CLIENTE VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL,
    TELEFONE VARCHAR(15) NOT NULL,
    ENDERECO VARCHAR(255),
    HISTORICO_PASSEJEIROS TEXT
    );

CREATE TABLE VOOS (
    VOO_ID INT AUTO_INCREMENT PRIMARY KEY,
    ORIGEM_VOO VARCHAR(100) NOT NULL,
    DESTINO TEXT,
    ESPECIFICACOES_DESTINO TEXT,
    HORARIO_PARTIDA VARCHAR(20),
    HORARIO_CHEGADA DECIMAL(10, 2) NOT NULL
    );
