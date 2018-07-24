--DROPS
DROP TABLE IF EXISTS ItemVenda;
DROP TABLE IF EXISTS NotaFiscal;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Departamento;



CREATE TABLE  Cliente 
(	CODCLIENTE serial, 
	NOME VARCHAR(100) NOT NULL, 
	CPF VARCHAR(15) UNIQUE, 
	EMAIL VARCHAR(50), 
	 CONSTRAINT "ClientePK" PRIMARY KEY (CODCLIENTE) 
) ;
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
	Login varchar(50) UNIQUE,
	Senha varchar(50),
	codChefe int,
	CONSTRAINT "FuncionarioPK" PRIMARY KEY (codFuncionario),
	CONSTRAINT "CheckSexo" CHECK (Sexo = 'M' or Sexo = 'F'),
	CONSTRAINT "FuncionarioFKDepartamento" FOREIGN KEY (codDepartamento)
		REFERENCES Departamento (codDepartamento)
		on delete set null
		on update cascade,
	CONSTRAINT "FuncionarioFKChefe" FOREIGN KEY (codChefe)
		REFERENCES Funcionario (codFuncionario)
		on delete set null
		on update cascade
);

CREATE TABLE NotaFiscal
(
  codNotaFiscal serial,
  dataVenda date,
  codCliente integer,
  codFuncionario integer,
  CONSTRAINT "NotaFiscalPK" PRIMARY KEY (codNotaFiscal),
  CONSTRAINT "NotaFiscalFKCliente" FOREIGN KEY (codCliente)
      REFERENCES cliente (codcliente) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT "NotaFiscalFKFuncionario" FOREIGN KEY (codFuncionario)
      REFERENCES funcionario (codFuncionario) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Produto
(
	codProduto serial,
	descricao varchar(100) NOT NULL,
	precoUnit numeric(9,2) NOT NULL,
	qtdeEstoque integer NOT NULL,
	CONSTRAINT "ProdutoPK" PRIMARY KEY (codProduto)
);
CREATE TABLE ItemVenda
(
	codProduto integer,
	codNotaFiscal integer,
	quantidade numeric(6,3) NOT NULL,
	precoUnitVenda numeric(9,2) NOT NULL,

	CONSTRAINT "ItemVendaPK" PRIMARY KEY (codProduto, codNotaFiscal),
	CONSTRAINT "ItemVendaFKProduto" FOREIGN KEY (codProduto) 
		REFERENCES Produto (codProduto) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT "ItemVendaFKNotaFiscal" FOREIGN KEY (codNotaFiscal) 
		REFERENCES NotaFiscal (codNotaFiscal) 
);


--inserts	
insert into cliente (nome,cpf,email)
values ( 'Maria Julia', '8736201', 'mariah1234@gmail.com');

insert into cliente (nome,cpf,email)
values ( 'Carlos André Dutra', '8723436201', 'cadutra12@yahoo.com.br');

insert into cliente (nome,cpf,email)
values ( 'Jose Geraldo', '092887221', 'zegege3@hotmail.com');

insert into cliente (nome,cpf,email)
values ( 'Rita Maria Julia Toschini', '01225687321', 'ritinhatoschini@hotmail.com');

insert into cliente (nome,cpf,email)
values ( 'Adriano Carlos Fonseca', '98222187321', 'fonsecao88@gmail.com');

insert into cliente (nome,cpf,email)
values ( 'Paulo Lopes', '121232521', 'fonsecao88@gmail.com');

insert into departamento (nome) values ('TI');
insert into departamento (nome) values ('Marketing');
insert into departamento (nome) values ('Vendas');
insert into departamento (nome) values ('Gestão');
insert into departamento (nome) values ('Produção');


insert into funcionario (codDepartamento,codChefe,CPF,nome,salario,datanascimento,sexo,login,senha)
values (4,null,'092887221', 'Jose Geraldo', 8765, to_date('02/03/1980','DD/MM/YYYY'), 'M', 'zeh', 'zehS2');

insert into funcionario (codDepartamento,codChefe,CPF,nome,salario,datanascimento,sexo,login,senha)
values (1,1,'8736201', 'Maria Julia', 3765, to_date('02/04/1985','DD/MM/YYYY'), 'F', 'mariah', 'mariasinha');

insert into funcionario (codDepartamento,codChefe,CPF,nome,salario,datanascimento,sexo,login,senha)
values (2,1,'765527221', 'Jean valjean', 4560.7, to_date('10/11/1950','DD/MM/YYYY'), 'M', 'jan', 'tupeton');

insert into funcionario (codDepartamento,codChefe,CPF,nome,salario,datanascimento,sexo,login,senha)
values (5,1,'12998762', 'Ricardo Tote', 1770, to_date('20/09/1977','DD/MM/YYYY'), 'M', 'Cadu', 'ricardim');

insert into funcionario (codDepartamento,codChefe,CPF,nome,salario,datanascimento,sexo,login,senha)
values (4,1,'828722121', 'Geraldo Julio Sperafico', 18765, to_date('28/02/1945','DD/MM/YYYY'), 'M', 'gjs', 'chefe');

insert into funcionario (codDepartamento,codChefe,CPF,nome,salario,datanascimento,sexo,login,senha)
values (3,1,'121232521', 'Paulo Lopes', 5600, to_date('15/08/1999','DD/MM/YYYY'), 'M', 'lopes', 'lopesfamilypower');

insert into funcionario (codDepartamento,codChefe,CPF,nome,salario,datanascimento,sexo,login,senha)
values (5,4,'0344617221', 'Carla Montenegro', 7000.23, to_date('02/03/1995','DD/MM/YYYY'), 'F', 'carla', 'gatinha95');

insert into funcionario (codDepartamento,codChefe,CPF,nome,salario,datanascimento,sexo,login,senha)
values (3,6,'09232287221', 'Josefa Fátima', 4666, to_date('12/07/1970','DD/MM/YYYY'), 'F', 'josefa', 'zehfinha');


insert into produto (descricao, precounit, qtdeEstoque) values ('achocolatado nescau', 6.7, 100);			--1
insert into produto (descricao, precounit, qtdeEstoque) values ('leite integral Damby', 3.2, 300);			--2
insert into produto (descricao, precounit, qtdeEstoque) values ('banana prata kg', 4.74, 50);				--3
insert into produto (descricao, precounit, qtdeEstoque) values ('tomate gaucho kg', 8.21, 40);				--4
insert into produto (descricao, precounit, qtdeEstoque) values ('maça argentina kg', 10.15, 60);			--5

insert into produto (descricao, precounit, qtdeEstoque) values ('refrigerante coca-cola lata', 2.85, 500);		--6
insert into produto (descricao, precounit, qtdeEstoque) values ('refrigerante coca-cola 2l', 5.15, 400);		--7
insert into produto (descricao, precounit, qtdeEstoque) values ('refrigerante guaraná antartica lata', 2.75, 600);	--8
insert into produto (descricao, precounit, qtdeEstoque) values ('refrigerante sukita 2l', 5, 450);			--9
insert into produto (descricao, precounit, qtdeEstoque) values ('água mineral água da pedra 500ml', 2.15, 1000);	--10

insert into produto (descricao, precounit, qtdeEstoque) values ('pão francês "little cacete" kg', 5.85, 200);		--11
insert into produto (descricao, precounit, qtdeEstoque) values ('detergente líquido limpol', 3.15, 240);		--12
insert into produto (descricao, precounit, qtdeEstoque) values ('shampo  Clear Men do CR7', 10.75, 30);			--13
insert into produto (descricao, precounit, qtdeEstoque) values ('creme dental sorriso 4d', 4.99, 25);			--14
insert into produto (descricao, precounit, qtdeEstoque) values ('biscoito nesfit sabor chocolate', 2.85, 70);		--15

insert into produto (descricao, precounit, qtdeEstoque) values ('Smart TV LED 32" HD Samsung 32J4300 ', 1599.90, 8);	--16 
insert into produto (descricao, precounit, qtdeEstoque) values ('papel higiênico neve 40m c/4', 6.15, 48);		--17
insert into produto (descricao, precounit, qtdeEstoque) values ('pen drive kingston 4GB', 40.99, 10);			--18 
insert into produto (descricao, precounit, qtdeEstoque) values ('cerveja coruja viva weiss', 15.99, 15);		--19
insert into produto (descricao, precounit, qtdeEstoque) values ('refrigerante guaraná biri 2l', 1.99, 55);		--20

insert into produto (descricao, precounit, qtdeEstoque) values ('erva mate tacapi sabor canela 500g', 7.99, 45); 	--21


--insert de 8 vendas

insert into notafiscal (datavenda, codfuncionario, codcliente) values 
(to_date('10/05/2016','dd/mm/yyyy'), 6,1);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (1,1,1,  6.5);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (1,2,2,  3.0);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (1,4,1.23, 10.5 );

insert into notafiscal (datavenda, codfuncionario, codcliente) values 
(to_date('11/05/2016','dd/mm/yyyy'), 6,2);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (2,3,1.54,	4.22);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (2,6,4, 2.39);


insert into notafiscal (datavenda, codfuncionario, codcliente) values 
(to_date('12/05/2016','dd/mm/yyyy'), 5,3);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (3,7,3, 4.99);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (3,10,6, 1.99);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (3,11,0.54, 5.85);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (3,2,3, 2.65);


insert into notafiscal (datavenda, codfuncionario, codcliente) values 
(to_date('12/05/2016','dd/mm/yyyy'), 8,4);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (4,12,1, 2.95);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (4,14,3, 3.99);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (4,13,2, 9.75);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (4,21,1, 6.99);


insert into notafiscal (datavenda, codfuncionario, codcliente) values 
(to_date('13/05/2016','dd/mm/yyyy'), 6,5);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (5,20,10, 0.99);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (5,15,3,  2.85);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (5,19,2,  15.99);


insert into notafiscal (datavenda, codfuncionario, codcliente) values 
(to_date('15/05/2016','dd/mm/yyyy'), 5,6);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (6,16,1, 1699.90);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (6,18,2, 45.99);


insert into notafiscal (datavenda, codfuncionario, codcliente) values 
(to_date('15/05/2016','dd/mm/yyyy'), 8,4);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (7,20,12, 1.99);


insert into notafiscal (datavenda, codfuncionario, codcliente) values 
(to_date('15/01/2017','dd/mm/yyyy'), 6,1);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (8,2,12, 3.2);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (8,11,0.3, 5.85);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (8,21,1, 7.99);

insert into notafiscal (datavenda, codfuncionario, codcliente) values 
(to_date('15/05/2016','dd/mm/yyyy'), 6,4);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (9,6,2, 2.80);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (9,7,3, 4.75);
insert into itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) values (9,9,1, 4.5);

