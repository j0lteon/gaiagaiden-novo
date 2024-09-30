USE master IF EXISTS(select * from sys.databases where name='bd_gaiagarden') 
DROP DATABASE bd_gaiagarden
GO 

CREATE DATABASE bd_gaiagarden
GO

USE bd_gaiagarden
GO

SELECT DAY(GETDATE ()) AS Dia, MONTH(GETDATE ()) AS Mês, YEAR(GETDATE ()) AS Ano;

CREATE TABLE Usuario
( 
   id            INT			IDENTITY,
   nome          VARCHAR(100)	NOT NULL,
   email         VARCHAR(100)	UNIQUE NOT NULL,
   senha         VARCHAR(100)	NOT NULL,
   telefone	     VARCHAR(20)    NULL,
   nivelAcesso   VARCHAR(10)    NOT NULL, -- ADMIN ou USER_APP
   foto			 VARBINARY(MAX) NULL,
   dataCadastro	 SMALLDATETIME	NOT NULL,
   statusUsuario VARCHAR(7)     NOT NULL, -- ATIVO ou INATIVO

   PRIMARY KEY (id)
)
GO
INSERT Usuario (nome, email, telefone, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Jimim da Silva', 'jimim@email.com.br', '(11) 98765-4123', 'MTIzNDU2Nzg=', 'ADMIN', NULL, GETDATE(), 'ATIVO')
INSERT Usuario (nome, email, telefone, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Beltrana de Sá', 'beltrana@email.com.br', '(11) 94893-8908', 'MTIzNDU2Nzg=', 'USER', NULL, GETDATE(), 'ATIVO')
INSERT Usuario (nome, email, telefone, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Sicrana de Oliveira', 'sicrana@email.com.br', '(11) 93894-8907', 'MTIzNDU2Nzg=', 'USER', NULL, GETDATE(), 'INATIVO')
INSERT Usuario (nome, email, telefone, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Fallen SK', 'cs@cs1tep.com', '(11) 98866-4563', 'MTIzNDU=', 'USER', NULL, GETDATE(), 'ATIVO')
INSERT Usuario (nome, email, telefone, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Ordnael Zurc', 'ordnael@email.com.br', '(11) 98757-4354', 'MTIzNDU2Nzg=', 'USER', NULL, GETDATE(), 'ATIVO')
GO

CREATE TABLE Categoria
(
	id	 INT		  IDENTITY,
	nome VARCHAR(100) NOT NULL,  

	PRIMARY KEY(id)
)
GO
INSERT Categoria (nome) VALUES ('Flores')
INSERT Categoria (nome) VALUES ('Folhagens')
INSERT Categoria (nome) VALUES ('Mudas')
INSERT Categoria (nome) VALUES ('Cactos')
GO

CREATE TABLE Produto
(
	id			 INT		    IDENTITY,
	nome	     VARCHAR(100)	NOT NULL,
	descricao	 VARCHAR(400)	NOT NULL,
	codigoBarras VARCHAR(100)	NULL,
	foto		 VARBINARY(max) NULL,
	preco		 DECIMAL(8,2)	NOT NULL,
	categoria_id INT			NOT NULL,
	statusProd	 VARCHAR(10)	NOT NULL, -- ATIVO ou INATIVO

	PRIMARY KEY (id),
	FOREIGN KEY (categoria_id) REFERENCES Categoria (id)
)
GO
INSERT Produto (nome, descricao, codigoBarras, foto,  preco, categoria_id, statusProd) 
VALUES ('Lírio Azul', 'Planta e tal, descrição, pode ser de flores ou não', '0001', NULL, 29.98, 1, 'ATIVO')
INSERT Produto (nome, descricao, codigoBarras, foto,  preco, categoria_id, statusProd) 
VALUES ('Azaleia', 'Planta e tal, descrição, pode ser de flores ou não', '0002', NULL, 29.98, 1, 'ATIVO')
INSERT Produto (nome, descricao, codigoBarras, foto,  preco, categoria_id, statusProd) 
VALUES ('Cacto Branco', 'Planta e tal, descrição, pode ser de flores ou não', '0003', NULL, 37.98, 4, 'ATIVO')
INSERT Produto (nome, descricao, codigoBarras, foto,  preco, categoria_id, statusProd) 
VALUES ('Espada de Seu Jorge', 'Planta e tal, descrição, pode ser de flores ou não', '0004', NULL, 31.98, 2, 'ATIVO')
INSERT Produto (nome, descricao, codigoBarras, foto,  preco, categoria_id, statusProd) 
VALUES ('Bonsai', 'Imperial force defined, is the last stand of the samurai', '0005', NULL, 35.99, 3, 'ATIVO')
GO

CREATE TABLE Mensagem
(
	id	            INT			  IDENTITY,
	dataMensagem    SMALLDATETIME NOT NULL,
	emissor			VARCHAR(100)  NOT NULL,
	email 	        VARCHAR(100)  NOT NULL,
	telefone	    VARCHAR(20)       NULL,
	texto 	        VARCHAR(400)  NOT NULL,
	statusMensagem  VARCHAR(8)    NOT NULL, -- LIDA ou NÃO LIDA

	PRIMARY KEY (id)
)

GO
INSERT Mensagem (dataMensagem, emissor, email, telefone, texto, statusMensagem) 
VALUES (GETDATE(), 'Ordnael Zurc', 'ordnael@email.com', '(11) 98765-4123', 'Mensagem de teste', 'NÃO LIDA')
INSERT Mensagem (dataMensagem, emissor, email, telefone, texto, statusMensagem) 
VALUES (GETDATE(), 'Isadora Leite', 'elmamaria@email.com', null, 'Segunda mensagem de teste', 'NÃO LIDA')
INSERT Mensagem (dataMensagem, emissor, email, telefone, texto, statusMensagem) 
VALUES (GETDATE(), 'Chatonete', 'porragames@email.com', null, 'Olha, eu sei que ninguém vai ligar pra isso, mas sinceramente, por que as pessoas deixam o volume da TV em números ímpares? Tipo, 27? Qual é o problema em colocar no 26 ou 28? É como se elas quisessem criar uma desordem universal que mexe com toda a harmonia da vida. E nem me façam começar a falar dos que deixam no 29… desnecessário!', 'NÃO LIDA')
INSERT Mensagem (dataMensagem, emissor, email, telefone, texto, statusMensagem) 
VALUES (GETDATE(), 'Cláudio Confuso', 'claudioconfusao@naosei.com', null, 'Sério, entrei nesse app e já fiquei perdido. Onde é que clica pra fazer qualquer coisa? Tem botão demais, menu escondido, e as notificações aparecem do nada sem contexto nenhum! Tentei postar uma foto e, do nada, fui parar numa página de termos de uso. Quem teve a ideia de organizar assim? Nem dá pra saber se tô curtindo ou denunciando algo! Mal uso e já quero desinstalar...', 'NÃO LIDA')
GO

CREATE TABLE Catalogo
(
	id	            INT			  IDENTITY,
	dataCadastro    SMALLDATETIME NOT NULL,
	obs				VARCHAR(100)	  NULL,
	produto_id		INT			  NOT NULL,
	statusProdCat	VARCHAR(10)	  NOT NULL, -- ATIVO ou INATIVO

	PRIMARY KEY (id),
	FOREIGN KEY (produto_id) REFERENCES Produto (id)
)
GO
INSERT Catalogo (dataCadastro, obs, produto_id, statusProdCat) 
VALUES (GETDATE(), 'Assim assim assado não sei o que', 2, 'ATIVO')
INSERT Catalogo (dataCadastro, obs, produto_id, statusProdCat) 
VALUES (GETDATE(), 'Não sei o que é obs', 5, 'ATIVO')
GO

CREATE TABLE Favorito
(
	id	            INT			  IDENTITY,
	dataCadastro    SMALLDATETIME NOT NULL,
	usuario_id		INT			  NOT NULL,
	produto_id		INT			  NOT NULL,
	statusFavorito	VARCHAR(10)	  NOT NULL, -- ATIVO ou INATIVO

	PRIMARY KEY (id),
	FOREIGN KEY (usuario_id) REFERENCES Usuario (id),
	FOREIGN KEY (produto_id) REFERENCES Produto (id)
)
GO
INSERT Favorito(dataCadastro, usuario_id, produto_id, statusFavorito) 
VALUES (GETDATE(), 1, 2, 'ATIVO')
INSERT Favorito(dataCadastro, usuario_id, produto_id, statusFavorito) 
VALUES (GETDATE(), 1, 5, 'ATIVO')
GO

--> Usuario: Pronto!
--> Produto: Pronto! 
--> Categoria: Pronto!
--> Catalogo: Pronto!
--> Mensagem: Pronto!
--> Favorito: Pronto!

SELECT * FROM Usuario
SELECT * FROM Mensagem
SELECT * FROM Categoria
SELECT * FROM Produto
SELECT * FROM Catalogo 
SELECT * FROM Favorito

