#3ano_biblioteca

CREATE DATABASE 2ano_biblioteca;
USE 2ano_biblioteca;

#modelo só FK
CREATE TABLE aluno (
	id_aluno int AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	turma varchar(20) not null,
	telefone varchar(20) not null,
	email varchar (100) not null
);

CREATE TABLE professor (
	id_professor int AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	telefone varchar(20) not null,
	email varchar (100) not null
);

CREATE TABLE bibliotecario (
	id_bibliotecario int AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	telefone varchar(20) not null,
	email varchar (100) not null
);

CREATE TABLE usuario (
	id_usuario int AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email varchar (100) not null,
    senha_hash varchar(255) not null,
    ativo bool,
    data_cadastro timestamp,
    id_aluno int,
    id_bibliotecario int,
    id_professor int,
    
    foreign key (id_aluno) references aluno(id_aluno),
    foreign key (id_bibliotecario) references bibliotecario(id_bibliotecario),
    foreign key (id_professor) references professor(id_professor)
);

SELECT * FROM usuario;
select * from aluno;
select * from professor;
select * from bibliotecario;

INSERT INTO usuario 
(nome, email, senha_hash, ativo, data_cadastro, id_aluno, id_bibliotecario, 
id_professor) VALUES 
('roberto','roberto@email.com','1321321231',true,'2026-06-26',1,null, null),
('claudia','claudia@email.com','123132',true,'2026-06-26', null, null,1),
('jessica', 'jessica@email.com','12313212323', true,'2026-06-26',null, 1, null);

INSERT INTO usuario 
(nome, email, senha_hash, ativo, data_cadastro, id_aluno, id_bibliotecario, 
id_professor) VALUES ('claudia','claudia@email.com','123132',true,'2026-06-26', null, null,1);

delete from usuario where id_usuario = 2;




SELECT 
	usuario.id_usuario,
    usuario.nome as login,
    usuario.email,
    aluno.nome as nome_aluno,
    aluno.telefone

FROM usuario
INNER JOIN aluno ON aluno.id_aluno = usuario.id_usuario; 
