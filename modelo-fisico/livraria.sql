create database livraria;
use livraria;

create table cliente (
    id_cliente int not null primary key auto_increment,
    nome_cliente varchar(40) not null,
    telefone_cliente varchar(11) not null,
    FK_endereco_cliente_endereco_cliente_PK int
);

create table fisica (
    cpf varchar(11) not null,
    rg varchar(9) not null,
    FK_CLIENTE_id_cliente INT PRIMARY KEY
);

create table juridica (
    cnpj varchar(11) not null,
    ie varchar(9) not null,
    FK_CLIENTE_id_cliente INT PRIMARY KEY
);

create table editora (
    id_editora int not null primary key auto_increment,
    email_editora varchar(40) not null,
    nome_editora varchar(40) not null,
    FK_telefone_editora_telefone_editora_PK int,
    FK_endereco_editora_endereco_editora_PK INT
);

create table pedido (
    id_pedido int not null primary key auto_increment,
    data_pedido date not null,
    valor_pedido float not null,
    id_cliente int not null
);

create table livro (
    id_livro int not null primary key auto_increment,
    nome_livro varchar(30) not null,
    autor_livro varchar(30) not null,
    categoria_livro varchar(20) not null,
    ano_livro year not null,
    isbn_livro varchar(13) not null,
    preco_livro float not null,
    id_editora int not null
);

create table estoque (
    id_livro int not null,
    quantidade_estoque int not null
);

create table itens_pedido_verificar (
    valores_itens_pedido float not null primary key,
    id_livro int not null,
    quantidade_pedido int not null,
    FK_PEDIDO_id_pedido int not null,
    FK_LIVRO_id_livro int not null
);

create table endereco_cliente (
    endereco_cliente_PK int not null primary key auto_increment,
    rua_avenida varchar(40)not null,
    numero varchar(5) not null,
    complemento varchar(15) not null,
    cep varchar(8) not null,
    cidade varchar(20) not null,
    estado varchar(20) not null
);

create table telefone_editora (
    telefone_editora_PK int not null primary key auto_increment,
    telefone_editora varchar(11) not null
);

create table endereco_editora (
    endereco_editora_PK int not null primary key auto_increment,
    rua_avenida varchar(40) not null,
    numero varchar(5) not null,
    complemento varchar(15) not null,
    cep varchar(8) not null,
    cidade varchar(20) not null,
    estado varchar(20) not null
);

create table fazer (
    FK_CLIENTE_id_cliente int not null,
    FK_PEDIDO_id_pedido int not null
);

create table existir (
    FK_LIVRO_id_livro int not null
);

create table pertencer (
    FK_EDITORA_id_editora int not null,
    FK_LIVRO_id_livro int not null
);
 
alter table cliente add constraint FK_CLIENTE_2
    foreign key (FK_endereco_cliente_endereco_cliente_PK)
    references endereco_cliente (endereco_cliente_PK)
    on delete set null;
 
alter table fisica add constraint FK_FISICA_2
    foreign key (FK_CLIENTE_id_cliente)
    references CLIENTE (id_cliente)
    on delete cascade;
 
alter table juridica add constraint FK_JURIDICA_2
    foreign key (FK_CLIENTE_id_cliente)
    references cliente (id_cliente)
    on delete cascade;
 
alter table editora add constraint FK_EDITORA_2
    foreign key (FK_telefone_editora_telefone_editora_PK)
    references telefone_editora (telefone_editora_PK)
    on delete cascade;
 
alter table editora add constraint FK_EDITORA_3
    foreign key (FK_endereco_editora_endereco_editora_PK)
    references endereco_editora (endereco_editora_PK)
    on delete set null;
 
alter table itens_pedido_verificar add constraint FK_ITENS_PEDIDO_VERIFICAR_2
    foreign key (FK_PEDIDO_id_pedido)
    references pedido (id_pedido);
 
alter table itens_pedido_verificar add constraint FK_ITENS_PEDIDO_VERIFICAR_3
    foreign key (FK_LIVRO_id_livro)
    references livro (id_livro);
 
alter table fazer add constraint FK_FAZER_1
    foreign key (FK_CLIENTE_id_cliente)
    references cliente (id_cliente)
    on delete restrict;
 
alter table fazer add constraint FK_FAZER_2
    foreign key (FK_PEDIDO_id_pedido)
    references pedido (id_pedido)
    on delete restrict;
 
alter table existir add constraint FK_EXISTIR_1
    foreign key (FK_LIVRO_id_livro)
    references livro (id_livro)
    on delete restrict;
 
alter table pertencer add constraint FK_PERTENCER_1
    foreign key (FK_EDITORA_id_editora)
    references editora (id_editora)
    on delete restrict;
 
alter table pertencer add constraint FK_PERTENCER_2
    foreign key (FK_LIVRO_id_livro)
    references livro (id_livro)
    on delete restrict;