create database biblioteca_paginas_vivas;

use biblioteca_paginas_vivas;

-- Criação das tabelas
CREATE TABLE Livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    ano_publicacao INT,
    genero VARCHAR(100)
);

CREATE TABLE Copias (
    id_copia INT PRIMARY KEY,
    id_livro INT,
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro)
);

CREATE TABLE Associados (
    id_associado INT PRIMARY KEY,
    nome VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(255)
);

CREATE TABLE Emprestimos (
    id_emprestimo INT PRIMARY KEY,
    id_copia INT,
    id_associado INT,
    data_emprestimo DATE,
    data_prevista_devolucao DATE,
    data_real_devolucao DATE,
    FOREIGN KEY (id_copia) REFERENCES Copias(id_copia),
    FOREIGN KEY (id_associado) REFERENCES Associados(id_associado)
);

CREATE TABLE Multas (
    id_multa INT PRIMARY KEY,
    id_emprestimo INT,
    dias_atraso INT,
    valor DECIMAL(10, 2),
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimos(id_emprestimo)
);

-- Inserção de dados
INSERT INTO Livros (id_livro, titulo, autor, ano_publicacao, genero) 
VALUES (1, 'Dom Quixote', 'Miguel de Cervantes', 1605, 'Romance'),
       (2, '1984', 'George Orwell', 1949, 'Ficção Científica'),
       (3, 'Orgulho e Preconceito', 'Jane Austen', 1813, 'Romance');

INSERT INTO Copias (id_copia, id_livro) 
VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO Associados (id_associado, nome, telefone, email) 
VALUES (1, 'Maria Silva', '123456789', 'maria@email.com'),
       (2, 'João Pereira', '987654321', 'joao@email.com'),
       (3, 'Ana Souza', '456789123', 'ana@email.com');

INSERT INTO Emprestimos (id_emprestimo, id_copia, id_associado, data_emprestimo, data_prevista_devolucao, data_real_devolucao) 
VALUES (1, 1, 1, '2024-12-01', '2024-12-10', NULL),
       (2, 2, 2, '2024-12-02', '2024-12-12', NULL);

INSERT INTO Multas (id_multa, id_emprestimo, dias_atraso, valor) 
VALUES (1, 2, 5, 25.00);
