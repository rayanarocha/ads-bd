create database empresa;

use empresa;

CREATE TABLE PRODUTO (
  ID           BIGINT        NOT NULL AUTO_INCREMENT,
  NOME         VARCHAR(100)  NOT NULL,
  DESCRICAO    VARCHAR(1000) NULL,
  PRECO_COMPRA DECIMAL(9,2)  NOT NULL,
  PRECO_VENDA  DECIMAL(9,2)  NOT NULL,
  QUANTIDADE   INT           NOT NULL DEFAULT 0,
  DISPONIVEL   BOOL          NOT NULL DEFAULT TRUE,       
  DT_CADASTRO  TIMESTAMP     NOT NULL,
  CONSTRAINT PK_PRODUTO PRIMARY KEY (ID)
);

CREATE TABLE CATEGORIA (
  ID   INT          NOT NULL AUTO_INCREMENT,
  NOME VARCHAR(100) NOT NULL,
  CONSTRAINT PK_CATEGORIA PRIMARY KEY (ID),
  CONSTRAINT UC_NOME UNIQUE (NOME)
);

CREATE TABLE PRODUTO_CATEGORIA (
    ID_PRODUTO   BIGINT NOT NULL,
    ID_CATEGORIA INT    NOT NULL,
    CONSTRAINT FK_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO(ID),
    CONSTRAINT FK_CATEGORIA FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA(ID)
);

INSERT INTO PRODUTO(NOME, DESCRICAO, PRECO_COMPRA, PRECO_VENDA, QUANTIDADE, DISPONIVEL, DT_CADASTRO)
VALUES ("Iphone 20", "último lançamento", 11000.99, 20000.99, 30, true, '2014-10-01 10:00:01');

INSERT INTO PRODUTO(NOME, DESCRICAO, PRECO_COMPRA, PRECO_VENDA, QUANTIDADE, DISPONIVEL, DT_CADASTRO)
VALUES ("Iphone 30", null, 11000.99, 20000.99, 30, true, '2014-10-01 10:00:01');

INSERT INTO PRODUTO(NOME, PRECO_COMPRA, PRECO_VENDA, QUANTIDADE, DISPONIVEL, DT_CADASTRO)
VALUES ("Iphone 31", 11000.99, 20000.99, 30, true, '2014-10-01 10:00:01');

INSERT INTO CATEGORIA(NOME) VALUES ("Categoria 1");

select * from produto;

drop database empresa;
