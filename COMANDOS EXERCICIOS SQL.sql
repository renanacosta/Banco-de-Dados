CREATE TABLE "Cliente"(
"cpf" char(14),
"nome" varchar (100),
"telefone" char(10),
CONSTRAINT "ClientePK" PRIMARY kEY ("cpf")
);

CREATE TABLE "Empregado"(
"cpf" char(14),
"nome" varchar (100),
"cargo" varchar,
CONSTRAINT "EmpregadoPK" PRIMARY kEY ("cpf")
);

CREATE TABLE "Projeto"(
"codProjeto" int,
"nome" varchar (100),
"descricao" varchar (100),
"preco" money,
"dtFim" date,
"dtEstimada" date,
"dtSolicitada" date,
"cpfGerente" char (14),
"cpfCliente" char (14),
CONSTRAINT "ProjetoPK" PRIMARY kEY ("codProjeto"),

);