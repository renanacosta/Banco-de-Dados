--TADSgram:

SELECT * FROM Perfil
SELECT * FROM Publicacao
SELECT * FROM VisualizacaoHistory
SELECT * FROM CurtidaTimeline
SELECT * FROM Seguida


CREATE table Perfil(
	cod serial,
	login varchar(50) NOT NULL,
	CONSTRAINT perfilPK PRIMARY KEY (cod));
	

CREATE table Publicacao(
	cod serial,
	arquivo varchar(100) NOT NULL,
	tipoPublicacao char(8) NOT NULL,
	codPerfil int NOT NULL,
	CONSTRAINT publicacaoPK PRIMARY KEY (cod),
	CONSTRAINT publicacaoperfilFK FOREIGN KEY (codPerfil) REFERENCES Perfil(cod) 
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT checkTipoPub CHECK (tipoPublicacao = 'history' OR tipoPublicacao = 'timeline'));


CREATE TABLE VisualizacaoHistory(
	codPerfil int,
	codHistory int,
	CONSTRAINT visualizacaohistoryPK PRIMARY KEY (codPerfil,codHistory),
	CONSTRAINT visuHistPerfilFK FOREIGN KEY (codPerfil) REFERENCES Perfil(cod) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT visuHistPublicacaoFK FOREIGN KEY (codHistory) REFERENCES Publicacao(cod) ON DELETE CASCADE ON UPDATE CASCADE);

	
CREATE TABLE CurtidaTimeline(
	codPerfil int,
	codTimeline int,
	CONSTRAINT curtidaTimelinePK PRIMARY KEY (codPerfil,codTimeline),
	CONSTRAINT curtiTimePerfilFK FOREIGN KEY (codPerfil) REFERENCES Perfil(cod) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT curtiTimePublicacaoFK FOREIGN KEY (codTimeline) REFERENCES Publicacao(cod) ON DELETE CASCADE ON UPDATE CASCADE);

	
CREATE TABLE Seguida(
	codPerfilSeguido int,
	codPerfilSeguidor int,
	CONSTRAINT SeguidaPK PRIMARY KEY (codPerfilSeguido, codPerfilSeguidor),
	CONSTRAINT seguidoPerfilFK FOREIGN KEY (codPerfilSeguido) REFERENCES Perfil(cod) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT seguidorPerfilFK FOREIGN KEY (codPerfilSeguidor) REFERENCES Perfil(cod) ON DELETE CASCADE ON UPDATE CASCADE);

	
INSERT INTO Perfil (login) VALUES ('mariah'), ('juliocm'), ('rick12'), ('carlitos');

INSERT INTO Seguida VALUES (1,2),(1,3),(2,1),(4,1),(4,2);

INSERT INTO Publicacao (arquivo, tipoPublicacao, codPerfil) VALUES
	('1pub01.jpg','history',1),	--1
	('2pub01.jpg','history',2),	--2
	('1pub02.jpg','timeline',1),	--3
	('3pub01.jpg','timeline',3),	--4
	('4pub01.jpg','timeline',4),	--5
	('4pub02.jpg','timeline',4);	--6

INSERT INTO CurtidaTimeline VALUES (1,3),(2,3),(4,3),(3,5);
INSERT INTO VisualizacaoHistory VALUES (3,1),(2,1),(4,1),(3,2);



-- RESPOSTAS


-- QUESTÃO 1)

CREATE INDEX consultaPerfil ON Perfil(login);

-- QUESTÃO 2)

CREATE VIEW ViewSeguidor AS
(SELECT cod, login FROM Perfil);
SELECT * FROM View_empregado;




-- QUESTÃO 3)

CREATE OR REPLACE FUNCTION geraTimeline() RETURNS integer AS
$$
DECLARE
x int;
begin
x:= Perfil;
EXCEPTION
WHEN Perfil then
RAISE NOTICE 'Perfil inválido';

end
$$LANGUAGE 'plpgsql';


-- QUESTÃO 4)

CREATE TRIGGER verifica
$$
AFTER INSERT | UPDATE | DELETE ON Publicacao
begin

FOR EACH ROW EXECUTE PROCEDURE CHECK (tipoPublicacao = 'history')
RETURN TRIGGER
OR
(TipoPublicacao = 'Timeline')
EXCEPTION
RAISE NOTICE 'Não é uma publicação do history';


end
$$LANGUAGE 'plpgsql';



