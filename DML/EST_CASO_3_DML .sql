CREATE DATABASE EXERCICIO3_DML;
USE EXERCICIO3_DML;

CREATE TABLE IF NOT EXISTS CLIENTES (
    CODIGO INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ VARCHAR(14) NOT NULL,
    RAZAO_SOCIAL VARCHAR(255) NOT NULL,
    RAMO_ATIVIDADE VARCHAR(100),
    DATA_CADASTRAMENTO DATE NOT NULL,
    PESSOA_CONTATO VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS TELEFONES_CLIENTES (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CODIGO_CLIENTE INT,
    TELEFONE VARCHAR(15),
    CONSTRAINT FK_TELEFONE FOREIGN KEY (CODIGO_CLIENTE) REFERENCES CLIENTES(CODIGO)
);

CREATE TABLE IF NOT EXISTS ENDERECOS_CLIENTES (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CODIGO_CLIENTE INT,
    TIPO_ENDERECO INT,
    NUMERO VARCHAR(10),
    LOGRADOURO VARCHAR(255),
    COMPLEMENTO VARCHAR(50),
    CEP VARCHAR(10),
    BAIRRO VARCHAR(100),
    CIDADE VARCHAR(100),
    ESTADO VARCHAR(2),
    CONSTRAINT FK_ENDERECO FOREIGN KEY (CODIGO_CLIENTE) REFERENCES CLIENTES(CODIGO),
    CONSTRAINT FK_CLIENTE FOREIGN KEY (TIPO_ENDERECO) REFERENCES TIPOS_ENDERECO(CODIGO)
);

CREATE TABLE IF NOT EXISTS EMPREGADOS (
    MATRICULA INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    CARGO VARCHAR(100),
    SALARIO DECIMAL(10, 2),
    DATA_ADMISSAO DATE NOT NULL,
    QUALIFICACOES TEXT,
    ENDERECO INT,
    CONSTRAINT FK_FOREIGN KEY (ENDERECO) REFERENCES ENDERECOS_EMPREGADOS(ID)
);

CREATE TABLE IF NOT EXISTS TELEFONES_EMPREGADOS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    MATRICULA_EMPREGADO INT,
    TELEFONE VARCHAR(15),
 CONSTRAINT FK_TELEFONE FOREIGN KEY (MATRICULA_EMPREGADO) REFERENCES EMPREGADOS(MATRICULA)
);

CREATE TABLE IF NOT EXISTS ENDERECOS_EMPREGADOS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    MATRICULA_EMPREGADO INT,
    TIPO_ENDERECO INT,
    NUMERO VARCHAR(10),
    LOGRADOURO VARCHAR(255),
    COMPLEMENTO VARCHAR(50),
    CEP VARCHAR(10),
    BAIRRO VARCHAR(100),
    CIDADE VARCHAR(100),
    ESTADO VARCHAR(2),
    CONSTRAINT FK_ENDERECO FOREIGN KEY (MATRICULA_EMPREGADO) REFERENCES EMPREGADOS(MATRICULA),
    CONSTRAINT FK_EMPLEADO FOREIGN KEY (TIPO_ENDERECO) REFERENCES TIPOS_ENDERECO(CODIGO)
);

CREATE TABLE IF NOT EXISTS EMPRESAS (
    CNPJ VARCHAR(14) PRIMARY KEY,
    RAZAO_SOCIAL VARCHAR(255) NOT NULL,
    PESSOA_CONTATO VARCHAR(100),
    ENDERECO INT,
    CONSTRAINT FK_EMPRESA FOREIGN KEY (ENDERECO) REFERENCES ENDERECOS_EMPRESAS(ID)
);

CREATE TABLE TELEFONES_EMPRESAS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ_EMPRESA VARCHAR(14),
    TELEFONE VARCHAR(15),
    CONSTRAINT FK_TELEFONE FOREIGN KEY (CNPJ_EMPRESA) REFERENCES EMPRESAS(CNPJ)
);

CREATE TABLE IF NOT EXISTS ENDERECOS_EMPRESAS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ_EMPRESA VARCHAR(14),
    TIPO_ENDERECO INT,
    NUMERO VARCHAR(10),
    LOGRADOURO VARCHAR(255),
    COMPLEMENTO VARCHAR(50),
    CEP VARCHAR(10),
    BAIRRO VARCHAR(100),
    CIDADE VARCHAR(100),
    ESTADO VARCHAR(2),
    CONSTRAINT FK_ENDERECO FOREIGN KEY (CNPJ_EMPRESA) REFERENCES EMPRESAS(CNPJ),
    CONSTRAINT FK_EMPRESA FOREIGN KEY (TIPO_ENDERECO) REFERENCES TIPOS_ENDERECO(CODIGO)
);

CREATE TABLE IF NOT EXISTS FORNECEDORES (
    CNPJ VARCHAR(14) PRIMARY KEY,
    RAZAO_SOCIAL VARCHAR(255) NOT NULL,
    PESSOA_CONTATO VARCHAR(100),
    ENDERECO INT,
    CONSTRAINT FK_FORNECEDOR FOREIGN KEY (ENDERECO) REFERENCES ENDERECOS_FORNECEDORES(ID)
);

CREATE TABLE IF NOT EXISTS TELEFONES_FORNECEDORES (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ_FORNECEDOR VARCHAR(14),
    TELEFONE VARCHAR(15),
    CONSTRAINT FK_TELEFONE FOREIGN KEY (CNPJ_FORNECEDOR) REFERENCES FORNECEDORES(CNPJ)
);

CREATE TABLE IF NOT EXISTS ENDERECOS_FORNECEDORES (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ_FORNECEDOR VARCHAR(14),
    TIPO_ENDERECO INT,
    NUMERO VARCHAR(10),
    LOGRADOURO VARCHAR(255),
    COMPLEMENTO VARCHAR(50),
    CEP VARCHAR(10),
    BAIRRO VARCHAR(100),
    CIDADE VARCHAR(100),
    ESTADO VARCHAR(2),
    CONSTRAINT FK_ENDERECO FOREIGN KEY (CNPJ_FORNECEDOR) REFERENCES FORNECEDORES(CNPJ),
    CONSTRAINT FK_FORNECEDOR FOREIGN KEY (TIPO_ENDERECO) REFERENCES TIPOS_ENDERECO(CODIGO)
);

CREATE TABLE IF NOT EXISTS TIPOS_ENDERECO (
    CODIGO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS ENCOMENDAS (
    NUMERO INT AUTO_INCREMENT PRIMARY KEY,
    DATA_INCLUSAO DATE NOT NULL,
    VALOR_TOTAL DECIMAL(10, 2),
    VALOR_DESCONTO DECIMAL(10, 2),
    VALOR_LIQUIDO DECIMAL(10, 2),
    ID_FORMA_PAGAMENTO INT,
    QUANTIDADE_PARCELAS INT
);

CREATE TABLE IF NOT EXISTS PRODUTOS (
    CODIGO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    COR VARCHAR(50),
    DIMENSOES VARCHAR(50),
    PESO DECIMAL(10, 2),
    PRECO DECIMAL(10, 2),
    TEMPO_FABRICACAO INT,
    DESENHO_PRODUTO TEXT,
    HORAS_MAO_OBRA INT
);

CREATE TABLE IF NOT EXISTS TIPOS_COMPONENTE (
    CODIGO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS COMPONENTES (
    CODIGO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    QUANTIDADE_ESTOQUE INT,
    PRECO_UNITARIO DECIMAL(10, 2),
    UNIDADE VARCHAR(10),
    TIPO_COMPONENTE INT,
    CONSTRAINT FK_QUANTIDADE FOREIGN KEY (TIPO_COMPONENTE) REFERENCES TIPOS_COMPONENTE(CODIGO)
);

CREATE TABLE IF NOT EXISTS MAQUINAS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TEMPO_VIDA INT,
    DATA_COMPRA DATE,
    DATA_FIM_GARANTIA DATE
);

CREATE TABLE IF NOT EXISTS RE (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    QUANTIDADE_NECESSARIA INT,
    UNIDADE VARCHAR(10),
    TEMPO_USO INT,
    HORAS_MAO_OBRA INT,
    CODIGO_PRODUTO INT,
    CONSTRAINT FK_QUANTIDADE FOREIGN KEY (CODIGO_PRODUTO) REFERENCES PRODUTOS(CODIGO)
);

CREATE TABLE IF NOT EXISTS RM (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DATA DATE,
    DESCRICAO TEXT,
    ID_MAQUINA INT,
    CONSTRAINT FK_DESCRICAO FOREIGN KEY (ID_MAQUINA) REFERENCES MAQUINAS(ID)
);

CREATE TABLE IF NOT EXISTS RS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    QUANTIDADE INT,
    DATA_NECESSIDADE DATE,
    CODIGO_COMPONENTE INT,
    CONSTRAINT FK_DATA FOREIGN KEY (CODIGO_COMPONENTE) REFERENCES COMPONENTES(CODIGO)
);

INSERT INTO CLIENTES (Codigo, CNPJ, Razao_Social, Ramo_Atividade, Data_Cadastramento, Pessoa_Contato)
VALUES
(1, '12.345.678/0001-99', 'Tech Solutions Inc.', 'Desenvolvimento de Software', '2024-01-10', 'João Silva'),
(2, '98.765.432/0001-88', 'SoftWare Tech Ltda.', 'Consultoria em TI', '2024-02-15', 'Maria Souza'),
(3, '23.456.789/0001-11', 'CodeFactory S.A.', 'Desenvolvimento de Software', '2024-03-01', 'Carlos Almeida');

UPDATE CLIENTES
SET Ramo_Atividade = 'Desenvolvimento de Software e Consultoria'
WHERE Codigo = 1;
DELETE FROM CLIENTES
WHERE Codigo = 3;

INSERT INTO EMPREGADOS (Matricula, Nome, Cargo, Salario, Data_Admissao, Qualificacoes, Endereco)
VALUES
(1, 'Ana Costa', 'Desenvolvedora', 8000.00, '2023-04-20', 'Bacharel em Ciências da Computação', 'Rua A, 123, SP'),
(2, 'Lucas Silva', 'Gerente de Projetos', 12000.00, '2022-09-15', 'MBA em Gestão de TI', 'Avenida B, 456, RJ'),
(3, 'Patrícia Lima', 'Analista de Suporte', 5000.00, '2023-06-10', 'Curso Técnico em TI', 'Rua C, 789, MG');

UPDATE EMPREGADOS
SET Salario = 8500.00, Cargo = 'Desenvolvedora Sênior'
WHERE Matricula = 1;
DELETE FROM CLIENTES
WHERE Codigo = 3;

INSERT INTO EMPRESAS (CNPJ, Razao_Social, Pessoa_Contato, Endereco)
VALUES
('34.567.890/0001-22', 'BusinessTech Ltda.', 'Roberta Mendes', 'Rua D, 123, SP'),
('45.678.901/0001-33', 'NetCom Solutions', 'Ricardo Oliveira', 'Avenida E, 456, RJ'),
('56.789.012/0001-44', 'DevSoft Partners', 'Fernanda Castro', 'Rua F, 789, MG');

UPDATE EMPRESAS
SET Endereco = 'Rua G, 1234, SP'
WHERE CNPJ = '34.567.890/0001-22';
DELETE FROM EMPRESAS
WHERE CNPJ = '45.678.901/0001-33';

INSERT INTO FORNECEDORES (CNPJ, Razao_Social, Pessoa_Contato, Endereco)
VALUES
('67.890.123/0001-55', 'Tech Supplies Ltda.', 'Paulo Oliveira', 'Rua G, 1010, SP'),
('78.901.234/0001-66', 'SoftParts Suppliers', 'Claudia Ribeiro', 'Avenida H, 2020, RJ'),
('89.012.345/0001-77', 'CompTech Distribuidora', 'João Pires', 'Rua I, 3030, MG');

UPDATE FORNECEDORES
SET Pessoa_Contato = 'Carlos Martins'
WHERE CNPJ = '67.890.123/0001-55';
DELETE FROM EMPRESAS
WHERE CNPJ = '45.678.901/0001-33';

INSERT INTO TIPO_DE_ENDERECO (Codigo, Nome)
VALUES
(1, 'Comercial'),
(2, 'Residencial'),
(3, 'Industrial');

UPDATE TIPO_DE_ENDERECO
SET Nome = 'Corporativo'
WHERE Codigo = 1;
DELETE FROM TIPO_DE_ENDERECO
WHERE Codigo = 3;

INSERT INTO ENDERECOS (Numero, Logradouro, Complemento, CEP, Bairro, Cidade, Estado, Tipo_Endereco)
VALUES
(123, 'Rua A', 'Apartamento 101', '12345-000', 'Centro', 'São Paulo', 'SP', 1),
(456, 'Avenida B', 'Casa 202', '67890-000', 'Jardins', 'Rio de Janeiro', 'RJ', 2),
(789, 'Rua C', 'Bloco D', '54321-000', 'Centro', 'Belo Horizonte', 'MG', 3);

UPDATE ENDERECOS
SET Cidade = 'São Paulo', Estado = 'SP'
WHERE Numero = 123;
DELETE FROM ENDERECOS
WHERE Numero = 123;

INSERT INTO ENCOMENDAS (Numero, Data_Inclusao, Valor_Total, Valor_Desconto, Valor_Liquido, ID_Forma_Pagamento, Quantidade_Parcelas)
VALUES
(1, '2024-05-10', 10000.00, 500.00, 9500.00, 1, 5),
(2, '2024-06-20', 20000.00, 1000.00, 19000.00, 2, 3),
(3, '2024-07-05', 15000.00, 750.00, 14250.00, 3, 10);

UPDATE ENCOMENDAS
SET Valor_Total = 22000.00, Quantidade_Parcelas = 6
WHERE Numero = 2;
DELETE FROM ENCOMENDAS
WHERE Numero = 1;

INSERT INTO PRODUTOS (Codigo, Nome, Cor, Dimensoes, Peso, Preco, Tempo_Fabricacao, Desenho_Produto, Horas_Mano_Obra)
VALUES
(1, 'Software A', 'Azul', '300x200', 1.5, 5000.00, 100, 'Desenho1.pdf', 20),
(2, 'Software B', 'Vermelho', '400x300', 2.0, 8000.00, 150, 'Desenho2.pdf', 25),
(3, 'Software C', 'Verde', '350x250', 1.8, 6500.00, 120, 'Desenho3.pdf', 22);

UPDATE PRODUTOS
SET Preco = 9000.00, Tempo_Fabricacao = 180
WHERE Codigo = 2;
DELETE FROM PRODUTOS
WHERE Codigo = 3;

INSERT INTO TIPOS_DE_COMPONENTE (Codigo, Nome)
VALUES
(1, 'Processador'),
(2, 'Memória RAM'),
(3, 'Disco Rígido');

UPDATE TIPOS_DE_COMPONENTE
SET Nome = 'Chip de Processador'
WHERE Codigo = 1;
DELETE FROM TIPOS_DE_COMPONENTE
WHERE Codigo = 2;

INSERT INTO COMPONENTES (Codigo, Nome, Quantidade_Estoque, Preco_Unitario, Unidade)
VALUES
(1, 'Intel i7', 50, 1500.00, 'Unidade'),
(2, 'Corsair 16GB', 30, 350.00, 'Unidade'),
(3, 'Seagate 1TB', 20, 500.00, 'Unidade');


UPDATE COMPONENTES
SET Quantidade_Em_Estoque = 100
WHERE Codigo = 1;
DELETE FROM COMPONENTES
WHERE Codigo = 2;

INSERT INTO MAQUINAS (Tempo_Vida, Data_Compra, Data_Fim_Garantia)
VALUES
(5, '2020-01-15', '2025-01-15'),
(7, '2019-03-10', '2024-03-10'),
(6, '2021-07-20', '2026-07-20');

UPDATE MAQUINAS
SET Data_Fim_Garantia = '2026-12-31'
WHERE Tempo_Vida = 5;
DELETE FROM MAQUINAS
WHERE Tempo_Vida = 6;

INSERT INTO RE (Quantidade_Necessaria, Unidade, Tempo_Uso, Horas_Mao_Obra)
VALUES
(10, 'Unidade', 5, 2),
(15, 'Unidade', 6, 3),
(20, 'Unidade', 7, 4);

UPDATE RE
SET Quantidade_Necessaria = 15, Horas_Mao_Obra = 5
WHERE Unidade = 'Unidade' AND Tempo_Uso = 6;
DELETE FROM RE
WHERE Unidade = 'Unidade' AND Tempo_Uso = 7;

INSERT INTO RM (Data, Descricao)
VALUES
('2024-06-01', 'Substituição de peças no processador'),
('2024-07-10', 'Troca de disco rígido'),
('2024-08-15', 'Reparo na placa-mãe');

UPDATE RM
SET Descricao = 'Substituição do motor da máquina'
WHERE Data = '2024-07-10';
DELETE FROM RM
WHERE Data = '2024-06-01';

INSERT INTO RS (Quantidade, Data_Necessidade)
VALUES
(100, '2024-05-01'),
(200, '2024-06-10'),
(150, '2024-07-15');

UPDATE RS
SET Quantidade = 250
WHERE Data_Necessidade = '2024-06-10';
DELETE FROM RS
WHERE Data_Necessidade = '2024-07-15';
