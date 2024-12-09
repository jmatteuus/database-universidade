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
)