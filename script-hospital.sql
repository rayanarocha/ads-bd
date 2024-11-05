-- Criação do banco de dados
create database hospital;
use hospital;

-- Criação da tabela de Pacientes
create table pacientes (
    id_pacientes int auto_increment primary key,
    nome varchar(100) not null,
    data_nascimento date not null,
    genero enum('M', 'F') not null,
    telefone varchar(15)
);

-- Criação da tabela de Medicos
create table medicos (
    id_medicos int auto_increment primary key,
    nome varchar(100) not null,
    especialidade varchar(50) not null,
    telefone varchar(15)
);

-- Criação da tabela de Consultas
create table consultas (
    id_consultas int auto_increment primary key,
    paciente_id int not null,
    medico_id int not null,
    data_consulta datetime not null,
    foreign key (paciente_id) references pacientes(id_pacientes),
    foreign key (medico_id) references medicos(id_medicos)
);

-- Criação da tabela de Exames
create table exames (
    id_exames int auto_increment primary key,
    consulta_id int not null,
    tipo_exame varchar(50) not null,
    resultado text,
    foreign key (consulta_id) references consultas(id_consultas)
);

-- Inserindo dados na tabela de Pacientes
insert into pacientes (nome, data_nascimento, genero, telefone) values
('João Silva', '1980-01-15', 'M', '11987654321'),
('Maria Oliveira', '1992-05-30', 'F', '11987654322'),
('Carlos Souza', '1975-10-12', 'M', '11987654323');

-- Inserindo dados na tabela de Medicos
insert medicos (nome, especialidade, telefone) values
('Dr. Ana Costa', 'Cardiologia', '11876543210'),
('Dr. Paulo Mendes', 'Pediatria', '11876543211');

-- Inserindo dados na tabela de Consultas
insert into consultas (paciente_id, medico_id, data_consulta) values
(1, 1, '2023-10-01 10:00:00'),
(2, 2, '2023-10-02 11:00:00');

-- Inserindo dados na tabela de Exames
insert into exames (consulta_id, tipo_exame, resultado) values
(1, 'Hemograma', 'Normal'),
(2, 'Ultrassom', 'Sem anormalidades');

-- Exemplos de consultas SELECT

-- Selecionar todos os pacientes
select * from pacientes;

-- Selecionar todos os médicos
select * from medicos;

-- Selecionar todas as consultas
select c.id_consultas, p.nome as paciente, m.nome as medico, c.data_consulta
from consultas c
join pacientes p on c.paciente_id = p.id_pacientes
join medicos m on c.medico_id = m.id_medicos;

-- Selecionar exames relacionados a uma consulta específica
select e.tipo_exame, e.resultado
from exames e
join consultas c on e.consulta_id = c.id_consultas
where c.id_consultas = 1;

-- Selecionar consultas de um paciente específico
select c.id_consultas, m.nome as medico, c.data_consulta
from consultas c
join medicos m on c.medico_id = m.id_medicos
where c.paciente_id = 1;

