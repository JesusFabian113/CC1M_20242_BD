

CREATE TABLE CLIENTES (
    CODIGO INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ VARCHAR(14) NOT NULL,
    RAZAO_SOCIAL VARCHAR(255) NOT NULL,
    RAMO_ATIVIDADE VARCHAR(100),
    DATA_CADASTRAMENTO DATE NOT NULL,
    PESSOA_CONTATO VARCHAR(100)
);

CREATE TABLE TELEFONES_CLIENTES (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CODIGO_CLIENTE INT,
    TELEFONE VARCHAR(15),
    FOREIGN KEY (CODIGO_CLIENTE) REFERENCES CLIENTES(CODIGO)
);

CREATE TABLE ENDERECOS_CLIENTES (
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
    FOREIGN KEY (CODIGO_CLIENTE) REFERENCES CLIENTES(CODIGO),
    FOREIGN KEY (TIPO_ENDERECO) REFERENCES TIPOS_ENDERECO(CODIGO)
);

CREATE TABLE EMPREGADOS (
    MATRICULA INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    CARGO VARCHAR(100),
    SALARIO DECIMAL(10, 2),
    DATA_ADMISSAO DATE NOT NULL,
    QUALIFICACOES TEXT,
    ENDERECO INT,
    FOREIGN KEY (ENDERECO) REFERENCES ENDERECOS_EMPREGADOS(ID)
);

CREATE TABLE TELEFONES_EMPREGADOS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    MATRICULA_EMPREGADO INT,
    TELEFONE VARCHAR(15),
    FOREIGN KEY (MATRICULA_EMPREGADO) REFERENCES EMPREGADOS(MATRICULA)
);

CREATE TABLE ENDERECOS_EMPREGADOS (
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
    FOREIGN KEY (MATRICULA_EMPREGADO) REFERENCES EMPREGADOS(MATRICULA),
    FOREIGN KEY (TIPO_ENDERECO) REFERENCES TIPOS_ENDERECO(CODIGO)
);

CREATE TABLE EMPRESAS (
    CNPJ VARCHAR(14) PRIMARY KEY,
    RAZAO_SOCIAL VARCHAR(255) NOT NULL,
    PESSOA_CONTATO VARCHAR(100),
    ENDERECO INT,
    FOREIGN KEY (ENDERECO) REFERENCES ENDERECOS_EMPRESAS(ID)
);

CREATE TABLE TELEFONES_EMPRESAS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ_EMPRESA VARCHAR(14),
    TELEFONE VARCHAR(15),
    FOREIGN KEY (CNPJ_EMPRESA) REFERENCES EMPRESAS(CNPJ)
);

CREATE TABLE ENDERECOS_EMPRESAS (
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
    FOREIGN KEY (CNPJ_EMPRESA) REFERENCES EMPRESAS(CNPJ),
    FOREIGN KEY (TIPO_ENDERECO) REFERENCES TIPOS_ENDERECO(CODIGO)
);

CREATE TABLE FORNECEDORES (
    CNPJ VARCHAR(14) PRIMARY KEY,
    RAZAO_SOCIAL VARCHAR(255) NOT NULL,
    PESSOA_CONTATO VARCHAR(100),
    ENDERECO INT,
    FOREIGN KEY (ENDERECO) REFERENCES ENDERECOS_FORNECEDORES(ID)
);

CREATE TABLE TELEFONES_FORNECEDORES (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ_FORNECEDOR VARCHAR(14),
    TELEFONE VARCHAR(15),
    FOREIGN KEY (CNPJ_FORNECEDOR) REFERENCES FORNECEDORES(CNPJ)
);

CREATE TABLE ENDERECOS_FORNECEDORES (
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
    FOREIGN KEY (CNPJ_FORNECEDOR) REFERENCES FORNECEDORES(CNPJ),
    FOREIGN KEY (TIPO_ENDERECO) REFERENCES TIPOS_ENDERECO(CODIGO)
);

CREATE TABLE TIPOS_ENDERECO (
    CODIGO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50)
);

CREATE TABLE ENCOMENDAS (
    NUMERO INT AUTO_INCREMENT PRIMARY KEY,
    DATA_INCLUSAO DATE NOT NULL,
    VALOR_TOTAL DECIMAL(10, 2),
    VALOR_DESCONTO DECIMAL(10, 2),
    VALOR_LIQUIDO DECIMAL(10, 2),
    ID_FORMA_PAGAMENTO INT,
    QUANTIDADE_PARCELAS INT
);

CREATE TABLE PRODUTOS (
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

CREATE TABLE TIPOS_COMPONENTE (
    CODIGO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50)
);

CREATE TABLE COMPONENTES (
    CODIGO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    QUANTIDADE_ESTOQUE INT,
    PRECO_UNITARIO DECIMAL(10, 2),
    UNIDADE VARCHAR(10),
    TIPO_COMPONENTE INT,
    FOREIGN KEY (TIPO_COMPONENTE) REFERENCES TIPOS_COMPONENTE(CODIGO)
);

CREATE TABLE MAQUINAS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TEMPO_VIDA INT,
    DATA_COMPRA DATE,
    DATA_FIM_GARANTIA DATE
);

CREATE TABLE RE (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    QUANTIDADE_NECESSARIA INT,
    UNIDADE VARCHAR(10),
    TEMPO_USO INT,
    HORAS_MAO_OBRA INT,
    CODIGO_PRODUTO INT,
    FOREIGN KEY (CODIGO_PRODUTO) REFERENCES PRODUTOS(CODIGO)
);

CREATE TABLE RM (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DATA DATE,
    DESCRICAO TEXT,
    ID_MAQUINA INT,
    FOREIGN KEY (ID_MAQUINA) REFERENCES MAQUINAS(ID)
);

CREATE TABLE RS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    QUANTIDADE INT,
    DATA_NECESSIDADE DATE,
    CODIGO_COMPONENTE INT,
    FOREIGN KEY (CODIGO_COMPONENTE) REFERENCES COMPONENTES(CODIGO)
);
