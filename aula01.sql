CREATE DATABASE aula01;

USE aula01;

CREATE TABLE cliente(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR (100) NOT NULL,
	idade INT NOT NULL,
	sexo CHAR (1) NOT NULL,
	PRIMARY KEY (id)
)

CREATE TABLE funcionario(
	id INT NOT NULL AUTO_INCREMENT,
	nome TEXT NOT NULL,
	cpf BIGINT NOT NULL,
	PRIMARY KEY (id)
)

CREATE TABLE produto(
	id INT NOT NULL AUTO_INCREMENT,
	nome TEXT NOT NULL,
	valor NUMERIC (9,2),
	quantidade INT NOT NULL DEFAULT 10,
	PRIMARY KEY (id)
)

CREATE TABLE venda(
	id INT NOT NULL AUTO_INCREMENT,
	id_cliente INT NOT NULL,
	id_funcionario INT NOT NULL,
	id_produto INT NOT NULL,
	descricao TEXT NOT NULL,
	data_saida DATE NOT NULL,
	quantidade INT NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT fk_venda_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(id),
	CONSTRAINT fk_venda_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id),
	CONSTRAINT fk_venda_produto FOREIGN KEY (id_produto) REFERENCES produto (id)
		
)