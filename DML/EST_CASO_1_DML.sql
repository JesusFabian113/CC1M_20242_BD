CREATE DATABASE EXERCICIO1_DML;
USE EXERCICIO1_DML;

CREATE TABLE IF NOT EXISTS FORNECEDORES(
FORNECEDOR_ID INT,
CPF VARCHAR(14),
PRIMARY KEY(FORNECEDOR_ID),
NOME VARCHAR(100) NOT NULL,
DATA_NASC DATE NOT NULL,
PESSOA_CONTATO VARCHAR(100),
TELEFONE VARCHAR(20));

 FORNECEDOR_ID INT AUTO_INCREMENT PRIMARY KEY,
    NOME_EMPRESA VARCHAR(100) NOT NULL,
    ENDERECO VARCHAR(255) NOT NULL,
    PAIS_ORIGEM VARCHAR(50) NOT NULL,
    PESSOA_CONTATO VARCHAR(100),
    TELEFONE VARCHAR(20),
    HISTORICO_FORNECIMENTO TEXT
    );
