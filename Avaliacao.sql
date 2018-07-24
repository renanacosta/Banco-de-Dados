--  AVALIAÇÃO DE BANCO DE DADOS

--1. Crie a tabela professor com os campos nome, CPF, dataNascimento, dataAtualizacao e
--codDepto que referencia Departamento. Considere que caso um departamento seja excluído, os
--professores alocados naquele departamento ficarão sem estar alocados em nenhum
--departamento e em caso de alteração da PK de departamento os professores continuarão a atuar
--nesse departamento.


CREATE TABLE "Professor" (
	"CPF" varchar(11), 
	"Nome" varchar(100) NOT NULL,
	"DataNasc" date NOT NULL,
	"DataAtualizacao" date NOT NULL,
	"CodDepto" int NOT NULL,
	CONSTRAINT "ProfessorPK" PRIMARY KEY ("CPF"),
	CONSTRAINT "ProfessorDeptoFK" FOREIGN KEY ("CodDepto")
		REFERENCES "Departamento" ("codigo")
			ON DELETE NO ACTION ON UPDATE CASCADE);

-- Inseri uns dados a essa tabela

INSERT INTO "Professor" ("CPF", "Nome", "DataNasc", "DataAtualizacao", "CodDepto")
VALUES ('19933225566', 'Márcio Torres', '1970-02-10', '2018-05-15', '1');




--2. Altere a tabela Departamento para que a coluna código seja auto incrementada pelo SGBD.

ALTER TABLE "Departamento"
    ALTER COLUMN "codigo" TYPE serial; 


--3. Faça uma consulta que retorne o nome de cada departamento, a quantidade de disciplinas
--alocadas neste departamento e o somatório de horas (de disciplinas) vinculado a cada
--departamento.




--4. Liste o nome dos professores, idade (quantidade de anos já vividos) e nome do departamento
--que trabalha.




--5. Liste os cursos e a sua carga horária total.
