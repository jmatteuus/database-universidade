CREATE DATABASE IF NOT EXISTS universidade;

USE universidade;

CREATE TABLE IF NOT EXISTS alunos (
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

CREATE TABLE IF NOT EXISTS cursos (
idcurso INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
tipo ENUM ('Bacharelado','Tecnólogo','Técnico','Licenciatura') NOT NULL COMMENT 'Tipo do curso',
carga INT NOT NULL CHECK (preco >=0) COMMENT 'Carga horária em horas',
preco DECIMAL (10,2) NOT NULL CHECK (preco >= 0),
PRIMARY KEY(idcurso)
);



CREATE TABLE IF NOT EXISTS alunos_cursos(
id INT NOT NULL AUTO_INCREMENT,
data_inicio DATE NOT NULL,
data_fim DATE NOT NULL,
semestre INT NOT NULL,
id_aluno INT,
id_curso INT,
PRIMARY KEY(id),

FOREING KEY (id_aluno) REFERENCES alunos(cadastro),
FOREING KEY (id_curso) REFERENCES cursos(idcurso)
);


INSERT INTO alunos (nome, nascimento, sexo, endereco, matricula, email, numero) VALUES
('João da Silva', '2000-05-15', 'M', 'Rua ABC, 123', true, 'joao.silva@example.com', '123456789');

INSERT INTO cursos (nome, tipo, carga, preco) VALUES
('Engenharia de Software', 'Bacharelado', 3800, 12000.00),