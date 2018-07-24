--DROPS
DROP TABLE Funcionario;
DROP TABLE Departamento;

CREATE TABLE  Departamento 
(	CODDEPARTAMENTO serial, 
	NOME VARCHAR(100), 
	 CONSTRAINT "DepartamentoPK" PRIMARY KEY (CODDEPARTAMENTO)
) ;
CREATE TABLE Funcionario
(
	codFuncionario serial,
	codDepartamento integer,
	CPF varchar(15) UNIQUE, 
	Nome varchar(50) NOT NULL,
	Salario numeric(7,2) NOT NULL ,
	DataNascimento date,
	Sexo varchar(1),
	CONSTRAINT "FuncionarioPK" PRIMARY KEY (codFuncionario),
	CONSTRAINT "CheckSexo" CHECK (Sexo = 'M' or Sexo = 'F'),
	CONSTRAINT "FuncionarioFKDepartamento" FOREIGN KEY (codDepartamento)
		REFERENCES Departamento (codDepartamento)
		on delete set null
		on update cascade
);

insert into departamento (nome) values ('TI');
insert into departamento (nome) values ('Marketing');
insert into departamento (nome) values ('Vendas');
insert into departamento (nome) values ('Gestão');
insert into departamento (nome) values ('Produção');


insert into funcionario (codDepartamento,CPF,nome,salario,datanascimento,sexo)
values (1,'8736201', 'Maria Julia', 3765, to_date('02/04/1985','DD/MM/YYYY'), 'F');

insert into funcionario (codDepartamento,CPF,nome,salario,datanascimento,sexo)
values (4,'092887221', 'Jose Geraldo', 8765, to_date('02/03/1980','DD/MM/YYYY'), 'M');

insert into funcionario (codDepartamento,CPF,nome,salario,datanascimento,sexo)
values (2,'765527221', 'Jean Valjean', 4560.7, to_date('10/11/1950','DD/MM/YYYY'), 'M');

insert into funcionario (codDepartamento,CPF,nome,salario,datanascimento,sexo)
values (5,'12998762', 'Ricardo Uno Dos', 1770, to_date('20/09/1977','DD/MM/YYYY'), 'M');

insert into funcionario (codDepartamento,CPF,nome,salario,datanascimento,sexo)
values (4,'828722121', 'Geraldo Julio Sperafico', 18765, to_date('28/02/1945','DD/MM/YYYY'), 'M');

insert into funcionario (codDepartamento,CPF,nome,salario,datanascimento,sexo)
values (3,'121232521', 'Paulo Lopes', 5600, to_date('15/08/1999','DD/MM/YYYY'), 'M');

insert into funcionario (codDepartamento,CPF,nome,salario,datanascimento,sexo)
values (5,'0344617221', 'Carla Montenegro', 7000.23, to_date('02/03/1995','DD/MM/YYYY'), 'F');

insert into funcionario (codDepartamento,CPF,nome,salario,datanascimento,sexo)
values (3,'09232287221', 'Josefa Fátima', 4666, to_date('12/07/1970','DD/MM/YYYY'), 'F');
