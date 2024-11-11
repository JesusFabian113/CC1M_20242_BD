CREATE TABLE ALUNOS (
    ID_ALUNO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    DATA_NASCIMENTO DATE NOT NULL,
    ENDERECO VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS INSTRUTORES (
    ID_INSTRUTOR INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS MODALIDADES (
    ID_MODALIDADE INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    DESCRICAO TEXT
);

CREATE TABLE IF NOT EXISTS PLANOS_TREINO (
    ID_PLANO INT AUTO_INCREMENT PRIMARY KEY,
    ID_ALUNO INT NOT NULL,
    ID_INSTRUTOR INT NOT NULL,
    DESCRICAO TEXT,
    DATA_ULTIMA_ATUALIZACAO DATE,
    FOREIGN KEY (ID_ALUNO) REFERENCES ALUNOS(ID_ALUNO),
    FOREIGN KEY (ID_INSTRUTOR) REFERENCES INSTRUTORES(ID_INSTRUTOR)
);

CREATE TABLE IF NOT EXISTS AULAS (
    ID_AULA INT AUTO_INCREMENT PRIMARY KEY,
    ID_MODALIDADE INT NOT NULL,
    ID_INSTRUTOR INT NOT NULL,
    DATA_HORA DATETIME NOT NULL,
    CAPACIDADE INT NOT NULL,
    FOREIGN KEY (ID_MODALIDADE) REFERENCES MODALIDADES(ID_MODALIDADE),
    FOREIGN KEY (ID_INSTRUTOR) REFERENCES INSTRUTORES(ID_INSTRUTOR)
);

CREATE TABLE IF NOT EXISTS MATRICULAS (
    ID_MATRICULA INT AUTO_INCREMENT PRIMARY KEY,
    ID_ALUNO INT NOT NULL,
    ID_MODALIDADE INT NOT NULL,
    DATA_MATRICULA DATE NOT NULL,
    FOREIGN KEY (ID_ALUNO) REFERENCES ALUNOS(ID_ALUNO),
    FOREIGN KEY (ID_MODALIDADE) REFERENCES MODALIDADES(ID_MODALIDADE)
);

CREATE TABLE IF NOT EXISTS PAGAMENTOS (
    ID_PAGAMENTO INT AUTO_INCREMENT PRIMARY KEY,
    ID_MATRICULA INT NOT NULL,
    DATA_PAGAMENTO DATE NOT NULL,
    VALOR DECIMAL(10, 2) NOT NULL,
    STATUS ENUM('PAGO', 'PENDENTE') NOT NULL,
    FOREIGN KEY (ID_MATRICULA) REFERENCES MATRICULAS(ID_MATRICULA)
);




INSERT INTO ALUNOS (CPF, Nome, Data_Nascimento, Endereco) 
VALUES 
  ('123.456.789-01', 'João Silva', '1990-03-15', 'Rua das Flores, 123'),
  ('987.654.321-00', 'Maria Oliveira', '1985-07-22', 'Avenida Central, 456'),
  ('555.666.777-88', 'Pedro Costa', '1992-11-10', 'Rua do Sol, 789');
UPDATE ALUNOS
SET Endereco = 'Rua das Palmeiras, 1000'
WHERE CPF = '123.456.789-01';
DELETE FROM ALUNOS
WHERE CPF = '555.666.777-88';

INSERT INTO INSTRUTORES (Nome, Modalidade, CPF, Data_Nascimento)
VALUES 
  ('Carlos Almeida', 'Musculação', '123.456.789-02', '1980-05-10'),
  ('Ana Pereira', 'Natação', '987.654.321-11', '1983-12-05'),
  ('Juliana Santos', 'Pilates', '111.222.333-44', '1987-02-20');
UPDATE INSTRUTORES
SET Modalidade = 'CrossFit'
WHERE CPF = '123.456.789-02';
DELETE FROM INSTRUTORES
WHERE CPF = '111.222.333-44';

INSERT INTO MODALIDADES (Nome, Capacidade_Maxima)
VALUES 
  ('Musculação', 20),
  ('Natação', 15),
  ('Pilates', 12);
UPDATE MODALIDADES
SET Capacidade_Maxima = 25
WHERE Nome = 'Musculação';
DELETE FROM MODALIDADES
WHERE Nome = 'Pilates';

INSERT INTO PLANOS_DE_TREINAMENTO (Aluno_CPF, Instrutor_CPF, Descricao, Data_Inicio, Data_Fim)
VALUES 
  ('123.456.789-01', '123.456.789-02', 'Plano de Musculação: Aumento de força', '2024-01-10', '2024-04-10'),
  ('987.654.321-00', '987.654.321-11', 'Plano de Natação: Aumento de resistência', '2024-02-01', '2024-05-01'),
  ('555.666.777-88', '111.222.333-44', 'Plano de Pilates: Flexibilidade e equilíbrio', '2024-03-15', '2024-06-15');
UPDATE PLANOS_DE_TREINAMENTO
SET Descricao = 'Plano de Musculação: Força e hipertrofia'
WHERE Aluno_CPF = '123.456.789-01';
DELETE FROM PLANOS_DE_TREINAMENTO
WHERE Aluno_CPF = '123.456.789-01';

INSERT INTO AULAS (Modalidade, Instrutor_CPF, Horario, Capacidade)
VALUES 
  ('Musculação', '123.456.789-02', '2024-03-10 08:00:00', 15),
  ('Natação', '987.654.321-11', '2024-03-12 10:00:00', 10),
  ('Pilates', '111.222.333-44', '2024-03-15 07:00:00', 8);
UPDATE AULAS
SET Horario = '2024-03-10 09:00:00'
WHERE Modalidade = 'Musculação';
DELETE FROM AULAS
WHERE Modalidade = 'Natação';

INSERT INTO PAGAMENTOS (Aluno_CPF, Valor, Data_Pagamento, Status)
VALUES 
  ('123.456.789-01', 200.00, '2024-01-15', 'Pago'),
  ('987.654.321-00', 180.00, '2024-02-01', 'Pendente'),
  ('555.666.777-88', 150.00, '2024-03-01', 'Pago');
UPDATE PAGAMENTOS
SET Status = 'Pago'
WHERE Aluno_CPF = '987.654.321-00';
DELETE FROM PAGAMENTOS
WHERE Aluno_CPF = '987.654.321-00' AND Status = 'Pendente';
