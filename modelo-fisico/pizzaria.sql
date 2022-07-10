create database pizzaria;
use pizzaria;

CREATE TABLE CLIENTE (
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(40) NOT NULL,
    telefone_cliente VARCHAR(11) NOT NULL,
    FK_endereco_cliente_endereco_cliente_PK INT
);

CREATE TABLE FISICO (
    cpf_cliente VARCHAR(11),
    rg_cliente VARCHAR(9),
    FK_CLIENTE_id_cliente INT PRIMARY KEY
);

CREATE TABLE JURIDICO (
    cnpj_cliente VARCHAR(14),
    ie_cliente VARCHAR(9),
    FK_CLIENTE_id_cliente INT PRIMARY KEY
);

CREATE TABLE PEDIDO (
    id_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricao_pedido VARCHAR(50) NOT NULL,
    valor_pedido FLOAT NOT NULL,
    data_pedido DATE NOT NULL,
    horario_pedido TIME NOT NULL,
    itens_pedido VARCHAR(50) NOT NULL,
    id_pagamento INT
);

CREATE TABLE FUNCIONARIO (
    id_funcionario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(40) NOT NULL,
    cargo_funcionario VARCHAR(20) NOT NULL,
    rg_funcionario VARCHAR(9) NOT NULL,
    cpf_funcionario VARCHAR(11) NOT NULL,
    telefone_funcionario VARCHAR(11) NOT NULL,
    email_funcionario VARCHAR(40) NOT NULL,
    FK_endereco_funcionario_endereco_funcionario_PK INT
);

CREATE TABLE CARDAPIO (
    id_cardapio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    item_cardapio VARCHAR(20) NOT NULL,
    descricao_item VARCHAR(50) NOT NULL,
    preco_item FLOAT NOT NULL,
    id_estoque INT,
    FK_PEDIDO_id_pedido INT,
    FK_ESTOQUE_id_estoque INT
);

CREATE TABLE PAGAMENTO (
    id_pagamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    valor_pagamento FLOAT NOT NULL,
    descricao_pagamento VARCHAR(20) NOT NULL,
    forma_pagamento VARCHAR(15) NOT NULL,
    id_cliente INT,
    id_pedido INT,
    FK_PEDIDO_id_pedido INT
);

CREATE TABLE CLIENTE_PEDIDO_FAZER (
    id_itens_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FK_CLIENTE_id_cliente INT,
    FK_PEDIDO_id_pedido INT
);

CREATE TABLE PEDIDO_FUNCIONARIO_ATENDER (
    id_atendimento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo_atendimento VARCHAR(15) NOT NULL,
    id_cliente INT,
    FK_PEDIDO_id_pedido INT,
    FK_FUNCIONARIO_id_funcionario INT
);

CREATE TABLE ESTOQUE (
    id_estoque INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    igrediente_estoque VARCHAR(20) NOT NULL,
    categoria_estoque VARCHAR(20) NOT NULL,
    quantidade_estoque VARCHAR(5) NOT NULL,
    fornecedor_estoque VARCHAR(30) NOT NULL
);

CREATE TABLE FORNECEDOR (
    id_fornecedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_fornecedor VARCHAR(30) NOT NULL,
    cnpj_fornecedor VARCHAR(14) NOT NULL,
    email_fornecedor VARCHAR(40) NOT NULL,
    FK_telefone_fornecedor_telefone_fornecedor_PK INT,
    FK_endereco_fornecedor_endereco_fornecedor_PK INT
);

CREATE TABLE ESTOQUE_FORNECEDOR_FORNECER (
    id_fornecimento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FK_ESTOQUE_id_estoque INT,
    FK_FORNECEDOR_id_fornecedor INT
);

CREATE TABLE endereco_cliente (
    endereco_cliente_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(30) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    complemento VARCHAR(15) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

CREATE TABLE endereco_funcionario (
    endereco_funcionario_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(30) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    complemento VARCHAR(15) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

CREATE TABLE telefone_fornecedor (
    telefone_fornecedor_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    telefone_fornecedor VARCHAR(11)
);

CREATE TABLE endereco_fornecedor (
    endereco_fornecedor_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(30) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    complemento VARCHAR(15) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL
);
 
ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_2
    FOREIGN KEY (FK_endereco_cliente_endereco_cliente_PK)
    REFERENCES endereco_cliente (endereco_cliente_PK)
    ON DELETE SET NULL;
 
ALTER TABLE FISICO ADD CONSTRAINT FK_FISICO_2
    FOREIGN KEY (FK_CLIENTE_id_cliente)
    REFERENCES CLIENTE (id_cliente)
    ON DELETE CASCADE;
 
ALTER TABLE JURIDICO ADD CONSTRAINT FK_JURIDICO_2
    FOREIGN KEY (FK_CLIENTE_id_cliente)
    REFERENCES CLIENTE (id_cliente)
    ON DELETE CASCADE;
 
ALTER TABLE FUNCIONARIO ADD CONSTRAINT FK_FUNCIONARIO_2
    FOREIGN KEY (FK_endereco_funcionario_endereco_funcionario_PK)
    REFERENCES endereco_funcionario (endereco_funcionario_PK)
    ON DELETE SET NULL;
 
ALTER TABLE CARDAPIO ADD CONSTRAINT FK_CARDAPIO_2
    FOREIGN KEY (FK_PEDIDO_id_pedido)
    REFERENCES PEDIDO (id_pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE CARDAPIO ADD CONSTRAINT FK_CARDAPIO_3
    FOREIGN KEY (FK_ESTOQUE_id_estoque)
    REFERENCES ESTOQUE (id_estoque)
    ON DELETE RESTRICT;
 
ALTER TABLE PAGAMENTO ADD CONSTRAINT FK_PAGAMENTO_2
    FOREIGN KEY (FK_PEDIDO_id_pedido)
    REFERENCES PEDIDO (id_pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE CLIENTE_PEDIDO_FAZER ADD CONSTRAINT FK_CLIENTE_PEDIDO_FAZER_2
    FOREIGN KEY (FK_CLIENTE_id_cliente)
    REFERENCES CLIENTE (id_cliente);
 
ALTER TABLE CLIENTE_PEDIDO_FAZER ADD CONSTRAINT FK_CLIENTE_PEDIDO_FAZER_3
    FOREIGN KEY (FK_PEDIDO_id_pedido)
    REFERENCES PEDIDO (id_pedido);
 
ALTER TABLE PEDIDO_FUNCIONARIO_ATENDER ADD CONSTRAINT FK_PEDIDO_FUNCIONARIO_ATENDER_2
    FOREIGN KEY (FK_PEDIDO_id_pedido)
    REFERENCES PEDIDO (id_pedido);
 
ALTER TABLE PEDIDO_FUNCIONARIO_ATENDER ADD CONSTRAINT FK_PEDIDO_FUNCIONARIO_ATENDER_3
    FOREIGN KEY (FK_FUNCIONARIO_id_funcionario)
    REFERENCES FUNCIONARIO (id_funcionario);
 
ALTER TABLE FORNECEDOR ADD CONSTRAINT FK_FORNECEDOR_2
    FOREIGN KEY (FK_telefone_fornecedor_telefone_fornecedor_PK)
    REFERENCES telefone_fornecedor (telefone_fornecedor_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE FORNECEDOR ADD CONSTRAINT FK_FORNECEDOR_3
    FOREIGN KEY (FK_endereco_fornecedor_endereco_fornecedor_PK)
    REFERENCES endereco_fornecedor (endereco_fornecedor_PK)
    ON DELETE SET NULL;
 
ALTER TABLE ESTOQUE_FORNECEDOR_FORNECER ADD CONSTRAINT FK_ESTOQUE_FORNECEDOR_FORNECER_2
    FOREIGN KEY (FK_ESTOQUE_id_estoque)
    REFERENCES ESTOQUE (id_estoque);
 
ALTER TABLE ESTOQUE_FORNECEDOR_FORNECER ADD CONSTRAINT FK_ESTOQUE_FORNECEDOR_FORNECER_3
    FOREIGN KEY (FK_FORNECEDOR_id_fornecedor)
    REFERENCES FORNECEDOR (id_fornecedor);