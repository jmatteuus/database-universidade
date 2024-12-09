CREATE DATABASE universidade;

USE universidade;

CREATE TABLE alunos (
cadastro INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
nascimento DATE NOT NULL,
sexo ENUM ('M','F'),
nacionalidade VARCHAR(20) DEFAULT 'Brasil',
endereco varchar(255) NOT NULL,
matricula BOOLEAN NOT NULL COMMENT '1 = Ativo, 0 = Inativo',
email VARCHAR(50) NOT NULL UNIQUE,
numero VARCHAR(20) NOT NULL,
PRIMARY KEY (cadastro)
);

CREATE TABLE cursos (
idcurso INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
tipo ENUM ('Bacharelado','Tecnólogo','Técnico','Licenciatura') NOT NULL COMMENT 'Tipo do curso',
carga INT NOT NULL CHECK (preco >=0) COMMENT 'Carga horária em horas',
preco DECIMAL (10,2) NOT NULL CHECK (preco >= 0),
PRIMARY KEY(idcurso)
);

CREATE TABLE alunos_cursos(
id INT NOT NULL AUTO_INCREMENT,
data_inicio DATE NOT NULL,
data_fim DATE NOT NULL,
semestre INT NOT NULL,
id_curso INT,
id_aluno INT,
PRIMARY KEY(id),

FOREING KEY (id_aluno) REFERENCES alunos(cadastro),
FOREING KEY (id_curso) REFERENCES cursos(idcurso)
);