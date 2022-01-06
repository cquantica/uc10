--DDL
CREATE DATABASE Rpg

 USE Rpg

 CREATE TABLE Usuarios(
    UsuarioId INT PRIMARY KEY IDENTITY
	,Email VARCHAR(100) UNIQUE NOT NULL
	,Senha VARCHAR(255) NOT NULL
 )

 CREATE TABLE Classes(
    ClasseId INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(50)UNIQUE NOT NULL
	,Descricao VARCHAR(255)
)

 CREATE TABLE Personagens(
    PersonagemId INT PRIMARY KEY IDENTITY
	,NomePersonagem VARCHAR(15) UNIQUE NOT NULL
	,UsuarioId INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId)
	,ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId)
 )


 CREATE TABLE Habilidades(
     HabilidadeId INT PRIMARY KEY IDENTITY
	 ,Nome VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE ClasseHabilidade(
    ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId)
	,HabilidadeId INT FOREIGN KEY REFERENCES Habilidades(HabilidadeId)
)

--DML - Manipulação dos Dados

INSERT INTO Usuarios VALUES ('email1@email.com','123456')
INSERT INTO Classes VALUES ('Bárbaro','Descrição do Bárbaro')
INSERT INTO Habilidades VALUES ('Lança Mortal'),('Escudo Supremo')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('DeuBug', 1, 1)
INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES (1, 1), (1, 2)

INSERT INTO Usuarios VALUES ('email2@email.com','123456')
INSERT INTO Classes VALUES ('Monge','Descrição do Monge')
INSERT INTO Habilidades VALUES ('Recuperar Vida')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('BitBug', 2, 2)
INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES (2, 2), (2, 3)

UPDATE Usuarios
SET Senha = 654321
WHERE UsuarioId = 1

--DQL

SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade


-- Retornar valores Join

SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.ClasseId = Classes.ClasseId

-- Simplifica o nome usando AS

SELECT P.NomePersonagem,C.Nome AS 'Nome da Classe',C.Descricao FROM Personagens AS P
JOIN Classes AS C 
ON P.ClasseId = C.ClasseId



--DML A03 UC10
INSERT INTO Usuarios VALUES ('email3@email.com','123456')
INSERT INTO Classes VALUES ('Viking','Descrição do Viking')
INSERT INTO Habilidades VALUES ('Martelo de Thor')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('NextBug', 3, 3)
INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES (3, 3), (3, 4)


-- Mudando senha de Usuario Especifico AO3 UC10
UPDATE Usuarios
SET Senha = 67890
WHERE UsuarioId = 3

--DLQ A03

SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade



INSERT INTO Classes VALUES ('Golem','Descrição do Golem')

-- Deletando Usuario Especifico AO3 UC10
DELETE FROM Classes 
WHERE ClasseId = 4


-- Criando login AO4 UC10
CREATE Login Jogador
WITH PASSWORD = '123456'

CREATE USER Jogador FOR LOGIN Jogador
GRANT SELECT TO Jogador

-- Opção permitida para Login "JOGADOR" AO4 UC10
GRANT SELECT FROM Jogador