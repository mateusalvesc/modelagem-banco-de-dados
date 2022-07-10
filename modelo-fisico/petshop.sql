create database petshop;
use petshop;

CREATE TABLE CLIENTE (
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(40) NOT NULL,
    nome_social VARCHAR(40),
    cpf_cliente VARCHAR(11) NOT NULL,
    rg_cliente VARCHAR(9) NOT NULL,
    sexo_cliente VARCHAR(15) NOT NULL,
    data_nascimento_cliente DATE NOT NULL,
    FK_endereco_cliente_endereco_cliente_PK INT,
    FK_contato_cliente_contato_cliente_PK INT
);

ALTER TABLE CLIENTE
MODIFY COLUMN sexo_cliente VARCHAR(15);
DESCRIBE CLIENTE;

CREATE TABLE ANIMAL (
    id_animal INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_animal VARCHAR(30) NOT NULL,
    especie_animal VARCHAR(20) NOT NULL,
    raca_animal VARCHAR(20) NOT NULL,
    pelagem_animal VARCHAR(20) NOT NULL,
    porte_animal VARCHAR(15) NOT NULL,
    peso_animal FLOAT NOT NULL,
    sexo_animal VARCHAR(5) NOT NULL,
    data_nascimento_animal DATE NOT NULL,
    id_cliente INT,
    id_funcionario INT
);

CREATE TABLE FUNCIONARIO (
    id_funcionario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(40) NOT NULL,
    telefone_funcionario VARCHAR(11) NOT NULL,
    cargo_funcionario VARCHAR(20) NOT NULL,
    rg_funcionario VARCHAR(9) NOT NULL,
    cpf_funcionario VARCHAR(11) NOT NULL,
    sala_funcionario VARCHAR(2) NOT NULL,
    sexo_funcionario VARCHAR(15),
    data_nascimento_funcionario DATE NOT NULL,
    email_funcionario VARCHAR(40) NOT NULL,
    id_animal INT,
    id_cliente INT,
    FK_endereco_funcionario_endereco_funcionario_PK INT
);

CREATE TABLE SERVICO (
    id_servico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_servico VARCHAR(30) NOT NULL,
    descricao_servico VARCHAR(50) NOT NULL,
    valor_servico FLOAT NOT NULL,
    sala_servico VARCHAR(2) NOT NULL,
    data_servico DATE NOT NULL,
    horario_servico TIME NOT NULL,
    id_animal INT,
    id_funcionario INT
);

CREATE TABLE HIGIENE (
    id_higiene INT NOT NULL AUTO_INCREMENT,
    tipo_higiene VARCHAR(20) NOT NULL,
    FK_SERVICO_id_servico INT,
    PRIMARY KEY (id_higiene, FK_SERVICO_id_servico)
);

CREATE TABLE TRIAGEM (
    id_triagem INT NOT NULL AUTO_INCREMENT,
    situacao_triagem VARCHAR(50) NOT NULL,
    FK_SERVICO_id_servico INT,
    PRIMARY KEY (id_triagem, FK_SERVICO_id_servico)
);

CREATE TABLE CONSULTA (
    id_consulta INT NOT NULL AUTO_INCREMENT,
    especialidade_consulta VARCHAR(20) NOT NULL,
    FK_SERVICO_id_servico INT,
    PRIMARY KEY (id_consulta, FK_SERVICO_id_servico)
);

CREATE TABLE EXAME (
    id_exame INT NOT NULL AUTO_INCREMENT,
    resultado_exame TEXT NOT NULL,
    FK_SERVICO_id_servico INT,
    PRIMARY KEY (id_exame, FK_SERVICO_id_servico)
);

CREATE TABLE MEDICAMENTO (
    id_medicamento INT NOT NULL AUTO_INCREMENT,
    tipo_medicamento VARCHAR(20) NOT NULL,
    estoque_medicamento VARCHAR(5) NOT NULL,
    quantidade_medicamento VARCHAR(5) NOT NULL,
    id_fornecedor INT,
    id_estoque INT,
    FK_SERVICO_id_servico INT,
    PRIMARY KEY (id_medicamento, FK_SERVICO_id_servico)
);

CREATE TABLE PRODUTO (
	id_produto INT NOT NULL AUTO_INCREMENT,
    tipo_produto VARCHAR(20) NOT NULL,
    quantidade_produto VARCHAR(5) NOT NULL,
    estoque_produto VARCHAR(10) NOT NULL,
    valor_produto FLOAT NOT NULL,
    id_fornecedor INT,
    id_estoque INT,
    FK_SERVICO_id_servico INT,
    PRIMARY KEY (id_produto, FK_SERVICO_id_servico)
);

CREATE TABLE PAGAMENTO (
    id_pagamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    valor_pagamento FLOAT NOT NULL,
    data_pagamento DATE NOT NULL,
    descricao_pagamento VARCHAR(30) NOT NULL,
    forma_pagamento VARCHAR(15) NOT NULL,
    id_cliente INT,
    id_servico INT,
    FK_SERVICO_id_servico INT
);

CREATE TABLE ESTOQUE (
    id_estoque INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    quantidade_estoque VARCHAR(5) NOT NULL,
    FK_MEDICAMENTO_id_medicamento INT,
    FK_MEDICAMENTO_FK_SERVICO_id_servico INT,
    FK_PRODUTO_id_produto INT,
    FK_PRODUTO_FK_SERVICO_id_servico INT,
    FK_FORNECEDOR_id_fornecedor INT
);

CREATE TABLE FORNECEDOR (
    id_fornecedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cnpj_fornecedor VARCHAR(14) NOT NULL,
    nome_fornecedor VARCHAR(50) NOT NULL,
    email_fornecedor VARCHAR(50) NOT NULL,
    FK_telefone_fornecedor_telefone_fornecedor_PK INT,
    FK_endereco_fornecedor_endereco_fornecedor_PK INT
);

CREATE TABLE endereco_cliente (
    endereco_cliente_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(40) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    complemento VARCHAR(15) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL
);

CREATE TABLE contato_cliente (
    contato_cliente_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    telefone VARCHAR(11) NOT NULL,
    whatsapp VARCHAR(11),
    email VARCHAR(40)
);

CREATE TABLE endereco_funcionario (
    endereco_funcionario_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(40) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    complemento VARCHAR(15) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL
);

CREATE TABLE telefone_fornecedor (
    telefone_fornecedor_PK INT NOT NULL PRIMARY KEY,
    telefone_fornecedor VARCHAR(11) NOT NULL
);

CREATE TABLE endereco_fornecedor (
    endereco_fornecedor_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(40) NOT NULL,
    complemento VARCHAR(15) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL
);

CREATE TABLE LEVAR (
    FK_ANIMAL_id_animal INT,
    FK_CLIENTE_id_cliente INT
);

CREATE TABLE DIRECIONAR (
    FK_SERVICO_id_servico INT,
    FK_ANIMAL_id_animal INT
);

CREATE TABLE REALIZAR (
    FK_FUNCIONARIO_id_funcionario INT,
    FK_SERVICO_id_servico INT
);

CREATE TABLE TRATAR (
    FK_ANIMAL_id_animal INT,
    FK_FUNCIONARIO_id_funcionario INT
);

CREATE TABLE ATENDER (
    FK_CLIENTE_id_cliente INT,
    FK_FUNCIONARIO_id_funcionario INT
);
 
ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_2
    FOREIGN KEY (FK_endereco_cliente_endereco_cliente_PK)
    REFERENCES endereco_cliente (endereco_cliente_PK)
    ON DELETE SET NULL;
 
ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_3
    FOREIGN KEY (FK_contato_cliente_contato_cliente_PK)
    REFERENCES contato_cliente (contato_cliente_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE FUNCIONARIO ADD CONSTRAINT FK_FUNCIONARIO_2
    FOREIGN KEY (FK_endereco_funcionario_endereco_funcionario_PK)
    REFERENCES endereco_funcionario (endereco_funcionario_PK)
    ON DELETE SET NULL;
 
ALTER TABLE HIGIENE ADD CONSTRAINT FK_HIGIENE_2
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico)
    ON DELETE CASCADE;
 
ALTER TABLE TRIAGEM ADD CONSTRAINT FK_TRIAGEM_2
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico)
    ON DELETE CASCADE;
 
ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_2
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico)
    ON DELETE CASCADE;
 
ALTER TABLE EXAME ADD CONSTRAINT FK_EXAME_2
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico)
    ON DELETE CASCADE;
 
ALTER TABLE MEDICAMENTO ADD CONSTRAINT FK_MEDICAMENTO_2
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico)
    ON DELETE CASCADE;
 
ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_2
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico)
    ON DELETE CASCADE;
 
ALTER TABLE PAGAMENTO ADD CONSTRAINT FK_PAGAMENTO_2
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico)
    ON DELETE RESTRICT;
 
ALTER TABLE ESTOQUE ADD CONSTRAINT FK_ESTOQUE_2
    FOREIGN KEY (FK_MEDICAMENTO_id_medicamento, FK_MEDICAMENTO_FK_SERVICO_id_servico)
    REFERENCES MEDICAMENTO (id_medicamento, FK_SERVICO_id_servico)
    ON DELETE RESTRICT;
 
ALTER TABLE ESTOQUE ADD CONSTRAINT FK_ESTOQUE_3
    FOREIGN KEY (FK_PRODUTO_id_produto, FK_PRODUTO_FK_SERVICO_id_servico)
    REFERENCES PRODUTO (id_produto, FK_SERVICO_id_servico)
    ON DELETE RESTRICT;
 
ALTER TABLE ESTOQUE ADD CONSTRAINT FK_ESTOQUE_4
    FOREIGN KEY (FK_FORNECEDOR_id_fornecedor)
    REFERENCES FORNECEDOR (id_fornecedor)
    ON DELETE RESTRICT;
 
ALTER TABLE FORNECEDOR ADD CONSTRAINT FK_FORNECEDOR_2
    FOREIGN KEY (FK_telefone_fornecedor_telefone_fornecedor_PK)
    REFERENCES telefone_fornecedor (telefone_fornecedor_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE FORNECEDOR ADD CONSTRAINT FK_FORNECEDOR_3
    FOREIGN KEY (FK_endereco_fornecedor_endereco_fornecedor_PK)
    REFERENCES endereco_fornecedor (endereco_fornecedor_PK)
    ON DELETE SET NULL;
 
ALTER TABLE LEVAR ADD CONSTRAINT FK_LEVAR_1
    FOREIGN KEY (FK_ANIMAL_id_animal)
    REFERENCES ANIMAL (id_animal)
    ON DELETE RESTRICT;
 
ALTER TABLE LEVAR ADD CONSTRAINT FK_LEVAR_2
    FOREIGN KEY (FK_CLIENTE_id_cliente)
    REFERENCES CLIENTE (id_cliente)
    ON DELETE SET NULL;
 
ALTER TABLE DIRECIONAR ADD CONSTRAINT FK_DIRECIONAR_1
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico)
    ON DELETE RESTRICT;
 
ALTER TABLE DIRECIONAR ADD CONSTRAINT FK_DIRECIONAR_2
    FOREIGN KEY (FK_ANIMAL_id_animal)
    REFERENCES ANIMAL (id_animal)
    ON DELETE SET NULL;
 
ALTER TABLE REALIZAR ADD CONSTRAINT FK_REALIZAR_1
    FOREIGN KEY (FK_FUNCIONARIO_id_funcionario)
    REFERENCES FUNCIONARIO (id_funcionario)
    ON DELETE RESTRICT;
 
ALTER TABLE REALIZAR ADD CONSTRAINT FK_REALIZAR_2
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico)
    ON DELETE RESTRICT;
 
ALTER TABLE TRATAR ADD CONSTRAINT FK_TRATAR_1
    FOREIGN KEY (FK_ANIMAL_id_animal)
    REFERENCES ANIMAL (id_animal)
    ON DELETE RESTRICT;
 
ALTER TABLE TRATAR ADD CONSTRAINT FK_TRATAR_2
    FOREIGN KEY (FK_FUNCIONARIO_id_funcionario)
    REFERENCES FUNCIONARIO (id_funcionario)
    ON DELETE RESTRICT;
 
ALTER TABLE ATENDER ADD CONSTRAINT FK_ATENDER_1
    FOREIGN KEY (FK_CLIENTE_id_cliente)
    REFERENCES CLIENTE (id_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE ATENDER ADD CONSTRAINT FK_ATENDER_2
    FOREIGN KEY (FK_FUNCIONARIO_id_funcionario)
    REFERENCES FUNCIONARIO (id_funcionario)
    ON DELETE RESTRICT;