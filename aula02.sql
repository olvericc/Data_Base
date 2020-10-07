CREATE DATABASE aula02;

USE aula02;

CREATE TABLE usuario(
	id_usuario INT NOT NULL AUTO_INCREMENT,
	senha VARCHAR (30) NOT NULL,
	nivel_acesso VARCHAR (50) NOT NULL,
	PRIMARY KEY (id_usuario)
)

CREATE TABLE pessoa(
	id_pessoa INT NOT NULL AUTO_INCREMENT,
	id_usuario INT NOT NULL,
	nome VARCHAR (100) NOT NULL,
	rg VARCHAR (30) NOT NULL,
	cpf VARCHAR (30) NOT NULL,
	telefone VARCHAR (15) NOT NULL,
	email TEXT NOT NULL,
	PRIMARY KEY (id_pessoa),
	CONSTRAINT fk_pessoa_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
)

CREATE TABLE curso(
	id_curso INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR (100) NOT NULL,
	duracao TIME NULL,
	PRIMARY KEY (id_curso)
)

CREATE TABLE professor(
	id_professor INT NOT NULL AUTO_INCREMENT,
	formacao TEXT NOT NULL,
	contato VARCHAR (30) NOT NULL,
	PRIMARY KEY (id_professor) 
)

CREATE TABLE aluno(
	id_aluno INT NOT NULL AUTO_INCREMENT,
	ra VARCHAR (50) NOT NULL,
	data_nascimento DATE NULL,
	PRIMARY KEY (id_aluno)
)

CREATE TABLE turma(
	id_turma INT NOT NULL AUTO_INCREMENT,
	id_curso INT NOT NULL,
	capacidade INT NOT NULL,
	horario TIME NOT NULL,
	PRIMARY KEY (id_turma),
	CONSTRAINT fk_turma_curso FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
)


CREATE TABLE turma_prof(
	id_turma_prof INT NOT NULL AUTO_INCREMENT,
	id_turma INT NOT NULL,
	id_prof INT NOT NULL,
	PRIMARY KEY (id_turma_prof),
	CONSTRAINT fk_turma_prof_turma FOREIGN KEY (id_turma) REFERENCES turma(id_turma),
	CONSTRAINT fk_turma_prof_prof FOREIGN KEY (id_prof) REFERENCES professor(id_professor) 
)

CREATE TABLE matricula(
	id_matricula INT NOT NULL AUTO_INCREMENT,
	id_turma INT NOT NULL,
	id_aluno INT NOT NULL,
	data_matricula DATE NOT NULL,
	estado VARCHAR (100) NOT NULL,
	PRIMARY KEY (id_matricula),
	CONSTRAINT fk_matricula_turma FOREIGN KEY (id_turma) REFERENCES turma(id_turma),
	CONSTRAINT fk_matricula_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
)