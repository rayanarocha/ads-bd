create database biblioteca_paginas_vivas;

use biblioteca_paginas_vivas;

-- Criação das tabelas
create table Livros (
    id_livro int primary key,
    titulo varchar(255),
    autor varchar(255),
    ano_publicacao int,
    genero varchar(100)
);

create table Copias (
    id_copia int primary key,
    id_livro int,
    foreign key (id_livro) references Livros(id_livro)
);

create table Associados (
    id_associado int primary key,
    nome varchar(255),
    telefone varchar(20),
    email varchar(255)
);

create table Emprestimos (
    id_emprestimo int primary key,
    id_copia int,
    id_associado int,
    data_emprestimo date,
    data_prevista_devolucao date,
    data_real_devolucao date,
    foreign key (id_copia) references Copias(id_copia),
    foreign key (id_associado) references Associados(id_associado)
);

create table Multas (
    id_multa int primary key,
    id_emprestimo int,
    dias_atraso int,
    valor decimal(10, 2),
    foreign key (id_emprestimo) references Emprestimos(id_emprestimo)
);

-- Inserção de dados
insert into Livros (id_livro, titulo, autor, ano_publicacao, genero) 
values (1, 'Dom Quixote', 'Miguel de Cervantes', 1605, 'Romance'),
       (2, '1984', 'George Orwell', 1949, 'Ficção Científica'),
       (3, 'Orgulho e Preconceito', 'Jane Austen', 1813, 'Romance');

insert into Copias (id_copia, id_livro) 
values (1, 1), (2, 2), (3, 3);

insert into Associados (id_associado, nome, telefone, email) 
values (1, 'Maria Silva', '123456789', 'maria@email.com'),
       (2, 'João Pereira', '987654321', 'joao@email.com'),
       (3, 'Ana Souza', '456789123', 'ana@email.com');

insert into Emprestimos (id_emprestimo, id_copia, id_associado, data_emprestimo, data_prevista_devolucao, data_real_devolucao) 
values (1, 1, 1, '2024-12-01', '2024-12-10', NULL),
       (2, 2, 2, '2024-12-02', '2024-12-12', NULL);

insert into Multas (id_multa, id_emprestimo, dias_atraso, valor) 
values (1, 2, 5, 25.00);
