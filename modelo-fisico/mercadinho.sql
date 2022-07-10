create database mercadinho;
use mercadinho;

CREATE TABLE Cliente (
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cpf_cliente VARCHAR(11) NOT NULL UNIQUE,
    nome_cliente VARCHAR(40) NOT NULL,
    id_operador_caixa INT NOT NULL
);

CREATE TABLE Produto (
	id_produto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(30) NOT NULL,
    categoria_produto VARCHAR(20) NOT NULL,
    tipo_produto VARCHAR(15) NOT NULL,
    marca_produto VARCHAR(20) NOT NULL,
    preco_produto FLOAT NOT NULL,
    lote_produto VARCHAR(20) NOT NULL,
    validade_produto DATE NOT NULL,
    fornecedor_produto VARCHAR(30) NOT NULL,
    setor_produto VARCHAR(20) NOT NULL,
    id_estoque INT NOT NULL,
    id_repositor INT NOT NULL
);

CREATE TABLE Cliente_Produto_Comprar (
    id_compra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    itens_compra VARCHAR(30) NOT NULL,
    quantidade_itens_compra VARCHAR(5) NOT NULL,
    data_compra DATE NOT NULL,
    horario_compra TIME NOT NULL,
    fk_Cliente_id_cliente INT NOT NULL,
    fk_Produto_id_produto INT NOT NULL
);

CREATE TABLE Operador_Caixa (
    id_operador_caixa INT NOT NULL AUTO_INCREMENT,
    fk_Funcionario_id_funcionario INT NOT NULL,
    fk_Cliente_id_cliente INT NOT NULL,
    PRIMARY KEY (id_operador_caixa, fk_Funcionario_id_funcionario)
);

CREATE TABLE Fornecedor (
    id_fornecedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_fornecedor VARCHAR(30) NOT NULL,
    cnpj_fornecedor VARCHAR(14) NOT NULL,
    email_fornecedor VARCHAR(40) NOT NULL,
    fk_telefone_fornecedor_telefone_fornecedor_PK INT NOT NULL
);

CREATE TABLE Estoque (
    id_estoque INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    produto_estoque VARCHAR(30) NOT NULL,
    setor_estoque VARCHAR(15) NOT NULL,
    quantidade_estoque VARCHAR(5) NOT NULL,
    fornecedor_estoque VARCHAR(30) NOT NULL,
    id_estoquista INT NOT NULL,
    fk_Produto_id_produto INT NOT NULL,
    fk_Estoquista_id_estoquista INT NOT NULL,
    fk_Estoquista_fk_Funcionario_id_funcionario INT NOT NULL
);

CREATE TABLE Estoque_Fornecedor_Fornecer (
    id_fornecimento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_Estoque_id_estoque INT NOT NULL,
    fk_Fornecedor_id_fornecedor INT NOT NULL
);

CREATE TABLE Estoquista (
    id_estoquista INT NOT NULL AUTO_INCREMENT,
    setor_estoquista VARCHAR(15) NOT NULL,
    fk_Funcionario_id_funcionario INT NOT NULL,
    PRIMARY KEY (id_estoquista, fk_Funcionario_id_funcionario)
);

CREATE TABLE Repositor (
    id_repositor INT NOT NULL AUTO_INCREMENT,
    setor_repositor VARCHAR(15) NOT NULL,
    fk_Funcionario_id_funcionario INT NOT NULL,
    fk_Produto_id_produto INT NOT NULL,
    PRIMARY KEY (id_repositor, fk_Funcionario_id_funcionario)
);

CREATE TABLE Funcionario (
    id_funcionario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(30) NOT NULL,
    cargo_funcionario VARCHAR(20) NOT NULL,
    cpf_funcionario VARCHAR(11) NOT NULL,
    rg_funcionario VARCHAR(9) NOT NULL,
    carteira_trabalho_funcionario VARCHAR(7) NOT NULL,
    data_nascimento_funcionario DATE NOT NULL,
    sexo_funcionario VARCHAR(15) NOT NULL,
    email_funcionario VARCHAR(40) NOT NULL,
    fk_telefone_funcionario_telefone_funcionario_PK INT NOT NULL,
    fk_endereco_funcionario_endereco_funcionario_PK INT NOT NULL
);

ALTER TABLE Funcionario
MODIFY COLUMN fk_endereco_funcionario_endereco_funcionario_PK INT;

CREATE TABLE Balconista (
    id_balconista INT NOT NULL AUTO_INCREMENT,
    setor_balconista VARCHAR(15) NOT NULL,
    fk_Funcionario_id_funcionario INT NOT NULL,
    PRIMARY KEY (id_balconista, fk_Funcionario_id_funcionario)
);

CREATE TABLE Limpeza (
    id_limpeza INT NOT NULL AUTO_INCREMENT,
    setor_limpeza VARCHAR(15) NOT NULL,
    fk_Funcionario_id_funcionario INT NOT NULL,
    PRIMARY KEY (id_limpeza, fk_Funcionario_id_funcionario)
);

CREATE TABLE Seguranca (
    id_seguranca INT NOT NULL AUTO_INCREMENT,
    turno_seguranca VARCHAR(10) NOT NULL,
    fk_Funcionario_id_funcionario INT NOT NULL,
    PRIMARY KEY (id_seguranca, fk_Funcionario_id_funcionario)
);

CREATE TABLE telefone_fornecedor (
    telefone_fornecedor_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    telefone_fornecedor VARCHAR(11) NOT NULL
);

CREATE TABLE endereco_fornecedor (
    endereco_fornecedor_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(40) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    complemento VARCHAR(10) NOT NULL,
    bairro VARCHAR(25) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    cidade VARCHAR(25) NOT NULL,
    estado VARCHAR(25) NOT NULL
);

CREATE TABLE telefone_funcionario (
    telefone_funcionario_PK INT NOT NULL PRIMARY KEY,
    telefone_funcionario VARCHAR(11) NOT NULL
);

CREATE TABLE endereco_funcionario (
    endereco_funcionario_PK INT PRIMARY KEY,
    rua VARCHAR(40) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    complemento VARCHAR(10) NOT NULL,
    bairro VARCHAR(25) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

DROP TABLE IF EXISTS endereco_funcionario;
ALTER TABLE endereco_funcionario
MODIFY COLUMN endereco_funcionario_PK INT AUTO_INCREMENT;
 
ALTER TABLE Cliente_Produto_Comprar ADD CONSTRAINT FK_Cliente_Produto_Comprar_2
    FOREIGN KEY (fk_Cliente_id_cliente)
    REFERENCES Cliente (id_cliente);
 
ALTER TABLE Cliente_Produto_Comprar ADD CONSTRAINT FK_Cliente_Produto_Comprar_3
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto);
 
ALTER TABLE Operador_Caixa ADD CONSTRAINT FK_Operador_Caixa_2
    FOREIGN KEY (fk_Funcionario_id_funcionario)
    REFERENCES Funcionario (id_funcionario)
    ON DELETE CASCADE;
 
ALTER TABLE Operador_Caixa ADD CONSTRAINT FK_Operador_Caixa_3
    FOREIGN KEY (fk_Cliente_id_cliente)
    REFERENCES Cliente (id_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE Fornecedor ADD CONSTRAINT FK_Fornecedor_2
    FOREIGN KEY (fk_telefone_fornecedor_telefone_fornecedor_PK)
    REFERENCES telefone_fornecedor (telefone_fornecedor_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Fornecedor ADD CONSTRAINT FK_Fornecedor_3
    FOREIGN KEY (fk_endereco_fornecedor_endereco_fornecedor_PK)
    REFERENCES endereco_fornecedor (endereco_fornecedor_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Estoque ADD CONSTRAINT FK_Estoque_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE Estoque ADD CONSTRAINT FK_Estoque_3
    FOREIGN KEY (fk_Estoquista_id_estoquista, fk_Estoquista_fk_Funcionario_id_funcionario)
    REFERENCES Estoquista (id_estoquista, fk_Funcionario_id_funcionario)
    ON DELETE RESTRICT;
 
ALTER TABLE Estoque_Fornecedor_Fornecer ADD CONSTRAINT FK_Estoque_Fornecedor_Fornecer_2
    FOREIGN KEY (fk_Estoque_id_estoque)
    REFERENCES Estoque (id_estoque);
 
ALTER TABLE Estoque_Fornecedor_Fornecer ADD CONSTRAINT FK_Estoque_Fornecedor_Fornecer_3
    FOREIGN KEY (fk_Fornecedor_id_fornecedor)
    REFERENCES Fornecedor (id_fornecedor);
 
ALTER TABLE Estoquista ADD CONSTRAINT FK_Estoquista_2
    FOREIGN KEY (fk_Funcionario_id_funcionario)
    REFERENCES Funcionario (id_funcionario)
    ON DELETE CASCADE;
 
ALTER TABLE Repositor ADD CONSTRAINT FK_Repositor_2
    FOREIGN KEY (fk_Funcionario_id_funcionario)
    REFERENCES Funcionario (id_funcionario)
    ON DELETE CASCADE;
 
ALTER TABLE Repositor ADD CONSTRAINT FK_Repositor_3
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE Funcionario ADD CONSTRAINT FK_Funcionario_2
    FOREIGN KEY (fk_telefone_funcionario_telefone_funcionario_PK)
    REFERENCES telefone_funcionario (telefone_funcionario_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Funcionario ADD CONSTRAINT FK_Funcionario_3
    FOREIGN KEY (fk_endereco_funcionario_endereco_funcionario_PK)
    REFERENCES endereco_funcionario (endereco_funcionario_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Balconista ADD CONSTRAINT FK_Balconista_2
    FOREIGN KEY (fk_Funcionario_id_funcionario)
    REFERENCES Funcionario (id_funcionario)
    ON DELETE CASCADE;
 
ALTER TABLE Limpeza ADD CONSTRAINT FK_Limpeza_2
    FOREIGN KEY (fk_Funcionario_id_funcionario)
    REFERENCES Funcionario (id_funcionario)
    ON DELETE CASCADE;
 
ALTER TABLE Seguranca ADD CONSTRAINT FK_Seguranca_2
    FOREIGN KEY (fk_Funcionario_id_funcionario)
    REFERENCES Funcionario (id_funcionario)
    ON DELETE CASCADE;