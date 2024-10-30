CREATE SCHEMA EXERCICIO1;
USE EXERCICIO1;

CREATE TABLE Fornecedores (
    fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    pais_origem VARCHAR(50) NOT NULL,
    pessoa_contato VARCHAR(100),
    telefone VARCHAR(20),
    historico_fornecimento TEXT
);

CREATE TABLE Produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    especificacoes_tecnicas TEXT,
    unidade_medida VARCHAR(20),
    preco_unitario DECIMAL(10, 2) NOT NULL
);
