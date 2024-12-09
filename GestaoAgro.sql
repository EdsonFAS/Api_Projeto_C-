-- DROP DATABASE GestaoAgro;
CREATE DATABASE GestaoAgro;
USE GestaoAgro;

-- Tabela Usuario
CREATE TABLE Usuario (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    NomeCompleto VARCHAR(255) NOT NULL,
    NomeUsuario VARCHAR(100) NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    CPF VARCHAR(14) NOT NULL,
    DataNascimento DATE,
    Endereco VARCHAR(255)
);

-- Tabela Animal
CREATE TABLE Animal (
	CodigoBrinco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Raca VARCHAR(100) NOT NULL,
    Peso DOUBLE NOT NULL,
    Sexo VARCHAR(10) NOT NULL,
    Idade INT NOT NULL
);

-- Tabela Rebanho
CREATE TABLE Rebanho (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    fk_Animal_CodigoBrinco INT NOT NULL,
    Tipo VARCHAR(100),
    Destino VARCHAR(255),
    FOREIGN KEY (fk_Animal_CodigoBrinco) REFERENCES Animal(CodigoBrinco)
);

-- Tabela Pastagem
CREATE TABLE Pastagem (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    AreaPastagem DOUBLE NOT NULL,
    LocalizacaoPastagem VARCHAR(255),
    Periodo INT,
    fk_Animal_CodigoBrinco INT NOT NULL,
    FOREIGN KEY (fk_Animal_CodigoBrinco) REFERENCES Animal(CodigoBrinco)
);

-- Tabela Alimentacao
CREATE TABLE Alimentacao (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Fornecedor VARCHAR(255),
    Nome VARCHAR(100) NOT NULL,
    QuantidadeEstoque DOUBLE NOT NULL,
    DataValidade DATE,
    DataEntrega DATE
);

-- Tabela RebanhoAlimentacao
CREATE TABLE RebanhoAlimentacao (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    fk_rebanho_id INT NOT NULL,
    fk_alimentacao_id INT NOT NULL,
    FOREIGN KEY (fk_rebanho_id) REFERENCES Rebanho(id),
    FOREIGN KEY (fk_alimentacao_id) REFERENCES Alimentacao(id)
);

-- Tabela Saude
CREATE TABLE Saude (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Veterinario VARCHAR(255),
    Status VARCHAR(100),
    Apetite VARCHAR(100),
    Temperatura DOUBLE,
    fk_Animal_CodigoBrinco INT NOT NULL,
    DataVerificacao DATE,
    FOREIGN KEY (fk_Animal_CodigoBrinco) REFERENCES Animal(CodigoBrinco)
);

-- Tabela Producao
CREATE TABLE Producao (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    TipoProducao VARCHAR(100) NOT NULL,
    Data DATE NOT NULL,
    QuantidadeProduzida VARCHAR(100) NOT NULL,
    fk_Animal_CodigoBrinco INT NOT NULL,
    FOREIGN KEY (fk_Animal_CodigoBrinco) REFERENCES Animal(CodigoBrinco)
);

-- Dados Tabela Usuario
INSERT INTO Usuario (NomeCompleto, NomeUsuario, Senha, Email, CPF, DataNascimento, Endereco)
VALUES
('João Silva', 'joaosilva', 'senha123', 'joao.silva@gmail.com', '123.456.789-00', '1990-01-15', 'Rua A, 123'),
('Maria Oliveira', 'mariaoliveira', 'senha456', 'maria.oliveira@gmail.com', '987.654.321-00', '1985-05-20', 'Avenida B, 456');

-- Dados Tabela Animal
INSERT INTO Animal (Raca, Peso, Sexo, Idade)
VALUES 
('Angus', 520.0, 'F', 4),
('Brahman', 480.7, 'M', 2),
('Guzerá', 490.3, 'F', 5),
('Nelore', 530.5, 'M', 3);

-- Dados Tabela Rebanho
INSERT INTO Rebanho (fk_Animal_CodigoBrinco, Tipo, Destino)
VALUES
(1, 'Produção de Leite', 'Fazenda A'),
(2, 'Engorda', 'Fazenda B'),
(3, 'Reprodução', 'Fazenda C');

-- Dados Tabela Pastagem
INSERT INTO Pastagem (AreaPastagem, LocalizacaoPastagem, Periodo, fk_Animal_CodigoBrinco) VALUES
(15.5, 'Fazenda Boa Vista', 120, 1),
(20.0, 'Sítio São José', 150, 2),
(12.3, 'Fazenda Nova Vida', 90, 3);

-- Dados Tabela Alimentacao
INSERT INTO Alimentacao (Fornecedor, Nome, QuantidadeEstoque, DataValidade, DataEntrega)
VALUES
('Fornecedor A', 'Ração A', 100.0, '2025-06-01', '2024-12-01'),
('Fornecedor B', 'Ração B', 200.0, '2025-07-01', '2024-12-02'),
('Fornecedor C', 'Ração C', 150.0, '2025-08-01', '2024-12-03');

-- Dados Tabela RebanhoAlimentacao
INSERT INTO RebanhoAlimentacao (fk_rebanho_id, fk_alimentacao_id)
VALUES
(1, 1),
(2, 2),
(3, 3);

-- Dados Tabela Saude
INSERT INTO Saude (Veterinario, Status, Apetite, Temperatura, fk_Animal_CodigoBrinco, DataVerificacao) VALUES
('Dr. Carlos Mendes', 'Saudável', 'Normal', 38.5, 1, '2024-12-05'),
('Dra. Ana Paula', 'Febre', 'Reduzido', 40.2, 2, '2024-12-06'),
('Dr. Roberto Lima', 'Saudável', 'Normal', 38.7, 3, '2024-12-07');

-- Dados Tabela Producao
INSERT INTO Producao (TipoProducao, Data, QuantidadeProduzida, fk_Animal_CodigoBrinco) VALUES
('Leite', '2024-12-08', '20 litros', 1),
('Carne', '2024-11-30', '300 kg', 2),
('Leite', '2024-12-08', '18 litros', 3);

-- Consultar dados inseridos
SELECT * FROM Usuario;
SELECT * FROM Animal;
SELECT * FROM Rebanho;
SELECT * FROM Pastagem;
SELECT * FROM Alimentacao;
SELECT * FROM RebanhoAlimentacao;
SELECT * FROM Saude;
SELECT * FROM Producao;