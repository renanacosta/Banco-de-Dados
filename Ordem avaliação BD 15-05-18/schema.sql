
CREATE TABLE "Departamento"(
	"codigo" integer,
	"nome" varchar(100) NOT NULL,
	CONSTRAINT "DepartamentoPK" PRIMARY KEY ("codigo"));

CREATE TABLE "Disciplina"(
	"codigo" serial,
	"nome" varchar(100) NOT NULL,
	"cargaHoraria" integer NOT NULL,
	"codDepto" integer,
	CONSTRAINT "DisciplinaPK" PRIMARY KEY ("codigo"),
	CONSTRAINT "DisciplinaDeptoFK" FOREIGN KEY ("codDepto") REFERENCES "Departamento" ("codigo"));

CREATE TABLE "Curso"(
	"codigo" serial,
	"nome" varchar(50) NOT NULL,
	CONSTRAINT "CursoPK" PRIMARY KEY ("codigo"));

CREATE TABLE "CursoDisciplina"(
	"codCurso" integer,
	"codDisciplina"	integer,
	CONSTRAINT "CursoDisciplinaPK" PRIMARY KEY ("codCurso","codDisciplina"),
	CONSTRAINT "CursoDisciplinaCursoFK" FOREIGN KEY ("codCurso")
		REFERENCES "Curso"("codigo"),
	CONSTRAINT "CursoDisciplinaDisciplinaFK" FOREIGN KEY ("codDisciplina")
		REFERENCES "Disciplina"("codigo"));

INSERT INTO "Departamento" ("codigo", "nome") VALUES 
(1,'Matemática'), (2,'Física'), (3,'Gestão'), (4,'Direção');

INSERT INTO "Disciplina" ("nome",  "cargaHoraria", "codDepto") VALUES 
('Matemática Discreta', 60, 1), 
('Fundamentos de Estatística', 60, 1), 
('Programação I', 80, 1), 
('Eletrônica I', 60, 2),

('Teoria Geral da Administração', 80, 3),
('Matemática I', 60, 1),
('Introdução à Economia', 40, 3),

('Cálculo I', 100, 1),
('Física I', 80, 2),
('Introdução a computação', 60, 1);
 
INSERT INTO "Curso" ("nome") VALUES ('Administração'),('Ciência da Computação'),('Engenharia Civil');

INSERT INTO "CursoDisciplina" VALUES (1,5),(1,6),(1,7), (2,1),(2,2),(2,3),(2,4), (3,8),(3,9),(3,10);



