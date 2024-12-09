CREATE DATABASE IF NOT EXISTS universidade;

USE universidade;

CREATE TABLE IF NOT EXISTS alunos (
    cadastro INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    nascimento DATE NOT NULL,
    sexo ENUM ('M','F','OUTRO') DEFAULT 'OUTRO',
    nacionalidade VARCHAR(20) DEFAULT 'Brasil',
    endereco varchar(255) NOT NULL,
    matricula BOOLEAN NOT NULL COMMENT '1 = Ativo, 0 = Inativo',
    email VARCHAR(50) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    PRIMARY KEY (cadastro)
);

CREATE TABLE IF NOT EXISTS cursos (
    idcurso INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    tipo ENUM ('Bacharelado','Tecnólogo','Técnico','Licenciatura') NOT NULL COMMENT 'Tipo do curso',
    carga INT NOT NULL COMMENT 'Carga horária em horas',
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
    FOREIGN KEY (id_aluno) REFERENCES alunos(cadastro) ON DELETE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES cursos(idcurso) ON DELETE CASCADE
);
