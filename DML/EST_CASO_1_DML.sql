CREATE DATABASE EXERCICIO1_DML;
USE EXERCICIO1_DML;

CREATE TABLE IF NOT EXISTS FORNECEDORES(
FORNECEDOR_ID INT,
NOME_EMPRESA VARCHAR(100),
PRIMARY KEY(FORNECEDOR_ID),
ENDERECO VARCHAR(255) NOT NULL,
PAIS_ORIGEM VARCHAR(50) NOT NULL,
PESSOA_CONTATO VARCHAR(100),
TELEFONE VARCHAR(20));

CREATE TABLE IF NOT EXISTS LOCAIS(
ID_LOCAL INT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
LOG_LOCAL VARCHAR(100) NOT NULL,
NUMLOG_LOCAL INT,
BAIRRO_LOCAL VARCHAR(100) NOT NULL,
CIDADE VARCHAR(100) NOT NULL,
CEP VARCHAR(100) NOT NULL,
CAPACIDADE INT NOT NULL);

CREATE TABLE IF NOT EXISTS EVENTOS(
ID_EVENTO INT PRIMARY KEY,
NOME_EVENTO VARCHAR(100) NOT NULL,
DATA_EVENTO DATE NOT NULL,
ENTIDADE_EVENTO VARCHAR(100) NOT NULL,
LOCAL_EVENTO INT,
CONSTRAINT FK_LOCAL FOREIGN KEY(LOCAL_EVENTO) REFERENCES LOCAIS(ID_LOCAL));

CREATE TABLE IF NOT EXISTS ATIVIDADES(
ID_ATIVIDADE INT PRIMARY KEY,
NOME_ATV VARCHAR(100) NOT NULL,
DATA_ATV DATE NOT NULL,
HORA_ATV TIME NOT NULL,
EVENTO_ATV INT NOT NULL,
CONSTRAINT FK_EVENTO FOREIGN KEY(EVENTO_ATV) REFERENCES EVENTOS(ID_EVENTO));



FORNECEDORES
INSERT INTO Fornecedores (nome_empresa, endereco, pais_origem, pessoa_contato, telefone, historico_fornecimento)
VALUES ('Fornecedor A', 'Rua A, 123', 'Brasil', 'João Silva', '(11) 1234-5678', '2023-10-01, 500');

-- Inserir fornecedor 2
INSERT INTO Fornecedores (nome_empresa, endereco, pais_origem, pessoa_contato, telefone, historico_fornecimento)
VALUES ('Fornecedor B', 'Avenida B, 456', 'China', 'Li Wei', '(21) 2345-6789', '2023-09-15, 200');

-- Inserir fornecedor 3
INSERT INTO Fornecedores (nome_empresa, endereco, pais_origem, pessoa_contato, telefone, historico_fornecimento)
VALUES ('Fornecedor C', 'Rua C, 789', 'EUA', 'John Doe', '(41) 3456-7890', '2023-08-01, 300');

-- Inserir fornecedor 4
INSERT INTO Fornecedores (nome_empresa, endereco, pais_origem, pessoa_contato, telefone, historico_fornecimento)
VALUES ('Fornecedor D', 'Estrada D, 101', 'Alemanha', 'Klaus Schmidt', '(51) 4567-8901', '2023-10-10, 100');

-- Inserir fornecedor 5
INSERT INTO Fornecedores (nome_empresa, endereco, pais_origem, pessoa_contato, telefone, historico_fornecimento)
VALUES ('Fornecedor E', 'Avenida E, 202', 'Japão', 'Yuki Tanaka', '(61) 5678-9012', '2023-07-20, 400');

COMANDOS: UPDTA: Fornecedores
SET telefone = '(11) 9876-5432'
WHERE id_fornecedor = 1;
UPDATE Fornecedores
SET historico_fornecimento = '2023-09-15, 300'
WHERE id_fornecedor = 2;

COMANDO DE DET: DELETE FROM Produtos
WHERE id_produto = 3;

TABELA PERIODOS DE COMPRA:

INSERT INTO Pedidos_de_Compra (id_fornecedor, data_pedido, data_esperada_entrega, status_pedido)
VALUES (1, '2024-10-01', '2024-10-10', 'em processamento');

-- Inserir pedido de compra 2
INSERT INTO Pedidos_de_Compra (id_fornecedor, data_pedido, data_esperada_entrega, status_pedido)
VALUES (2, '2024-09-15', '2024-09-25', 'enviado');

-- Inserir pedido de compra 3
INSERT INTO Pedidos_de_Compra (id_fornecedor, data_pedido, data_esperada_entrega, status_pedido)
VALUES (3, '2024-08-01', '2024-08-15', 'recebido');

-- Inserir pedido de compra 4
INSERT INTO Pedidos_de_Compra (id_fornecedor, data_pedido, data_esperada_entrega, status_pedido)
VALUES (4, '2024-10-10', '2024-10-20', 'em processamento');

-- Inserir pedido de compra 5
INSERT INTO Pedidos_de_Compra (id_fornecedor, data_pedido, data_esperada_entrega, status_pedido)
VALUES (5, '2024-07-20', '2024-07-30', 'cancelado');

COMANDOS UPDTA: UPDATE Pedidos_de_Compra
SET status_pedido = 'enviado'
WHERE id_pedido = 1;

-- Atualizar data esperada de entrega do Pedido de Compra 2
UPDATE Pedidos_de_Compra
SET data_esperada_entrega = '2024-09-30'
WHERE id_pedido = 2;

COMANDOS DET: DELETE FROM Pedidos_de_Compra
WHERE id_pedido = 3;

TABELA RECEBIMENTO MATERIAIS

INSERT INTO Recebimento_de_Materiais (id_pedido, data_recebimento, quantidade_recebida, condicao_material)
VALUES (1, '2024-10-05', 100, 'aceito');
