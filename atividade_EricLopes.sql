CREATE DATABASE atividade_EricLopes;

USE TABLE atividade_EricLopes;

CREATE TABLE funcionario(				#funcionario
	id_funcionario INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR (45) NOT NULL,
	cart_trabalho INT NOT NULL,
	data_contratacao DATE NOT NULL,
	salario FLOAT NOT NULL,
	PRIMARY KEY (id_funcionario)
)

CREATE TABLE funcao(					#funcao
	id_funcao INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR (45),
	PRIMARY KEY (id_funcao)
)

CREATE TABLE horario(					#horario
	id_horario INT NOT NULL AUTO_INCREMENT,
	horario TIME NOT NULL,
	PRIMARY KEY (id_horario)
)

CREATE TABLE horario_trabalho_funcionario(		#horario-trabalho-funcionario
	horario_idhorario INT NOT NULL,
	funcionario_idfuncionario INT NOT NULL,
	funcao_idfuncao INT NOT NULL,
	CONSTRAINT fk_htf_horario FOREIGN KEY (horario_idhorario) REFERENCES horario(id_horario),
	CONSTRAINT fk_htf_funcionario FOREIGN KEY (funcionario_idfuncionario) REFERENCES funcionario(id_funcionario), 
	CONSTRAINT fk_htf_funcao FOREIGN KEY (funcao_idfuncao) REFERENCES funcao(id_funcao)
)

CREATE TABLE diretor(					#diretor
	id_diretor INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR (45),
	PRIMARY KEY (id_diretor)
)

CREATE TABLE genero(					#genero
	id_genero INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR (45),
	PRIMARY KEY (id_genero)
)

CREATE TABLE sala(					#sala
	id_sala INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR (45),
	capacidade INT NOT NULL,
	PRIMARY KEY (id_sala)
)

CREATE TABLE filme(					#filme
	id_filme INT NOT NULL AUTO_INCREMENT,
	diretor_iddiretor INT NOT NULL,
	genero_idgenero INT NOT NULL,
	nomeBr VARCHAR (45),
	nomeEn VARCHAR (45),
	anoLancamento INT NOT NULL,
	sinopse TEXT NOT NULL,
	CONSTRAINT fk_filme_diretor FOREIGN KEY (diretor_iddiretor) REFERENCES diretor(id_diretor),
	CONSTRAINT fk_filme_genero FOREIGN KEY (genero_idgenero) REFERENCES genero(id_genero),
	PRIMARY KEY (id_filme)
)

CREATE TABLE filme_exibido_sala(			#filme-exibido-sala
	filme_idfilme INT NOT NULL,
	sala_idsala INT NOT NULL,
	horario_idhorario INT NOT NULL,
	CONSTRAINT fk_fes_filme FOREIGN KEY (filme_idfilme) REFERENCES filme(id_filme),
	CONSTRAINT fk_fes_sala FOREIGN KEY (sala_idsala) REFERENCES sala(id_sala),
	CONSTRAINT fk_fes_horario FOREIGN KEY (horario_idhorario) REFERENCES horario(id_horario)
)

CREATE TABLE premiacao(  				#premiacao
	id_premiacao INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR (45),
	ano INT NOT NULL,
	PRIMARY KEY (id_premiacao)
)

CREATE TABLE filme_has_premiacao(			#filme_has_premiacao
	filme_idfilme INT NOT NULL,
	premiacao_idpremiacao INT NOT NULL,
	ganhou BOOL,
	CONSTRAINT fk_fhp_filme FOREIGN KEY (filme_idfilme) REFERENCES filme(id_filme),
	CONSTRAINT fk_fhp_premiacao FOREIGN KEY (premiacao_idpremiacao) REFERENCES premiacao(id_premiacao)
)

CREATE TABLE dependente(				#questao2
	mostarda INT NOT NULL,
	ketchup INT NOT NULL,
	maionese INT NOT NULL
) 

DROP TABLE premiacao					#questao3

ALTER TABLE filme
MODIFY COLUMN nomeBr VARCHAR (100) NOT NULL		#questao4

ALTER TABLE sala 
ADD CHECK (capacidade>20)				#questao5

ALTER TABLE dependente 
ADD PRIMARY KEY (mostarda)				#questao6

ALTER TABLE funcionario
ADD COLUMN data_cadastro INT NOT NULL			#questao7

ALTER TABLE funcionario 
DROP data_cadastro 					#questao8

ALTER TABLE dependente 
RENAME depen						#questao9

ALTER TABLE depen
ADD COLUMN id_funcionario INT NOT NULL			#questao10

ALTER TABLE depen					#questao11
ADD CONSTRAINT fk_depen_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
	