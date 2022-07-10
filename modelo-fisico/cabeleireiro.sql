create database cabeleireiro;
use cabeleireiro;

CREATE TABLE FUNCIONARIO (
    id_funcionario int not null primary key auto_increment,
    nome_funcionario varchar(40) not null unique,
    contato_funcionario varchar(11) not null unique
);
CREATE TABLE SERVICO (
    id_servico int not null primary key auto_increment,
    preco_servico float not null,
    tipo_servico varchar(20) not null,
    descricao_servico varchar(40),
    id_cliente int not null,
    id_agendamento int not null,
    id_funcionario int not null
);

CREATE TABLE AGENDAMENTO (
    id_agendamento int not null primary key auto_increment,
    titulo_agendamento varchar(20),
    data_agendamento date not null,
    horario_agendamento time not null,
    observacao_agendamento varchar(40),
    id_cliente int not null
);

CREATE TABLE CLIENTE (
    id_cliente int not null primary key auto_increment,
    nome_cliente varchar(40) not null unique,
    contato_cliente varchar(11) not null
);

CREATE TABLE PAGAMENTO (
	id_pagamento int not null primary key auto_increment,
    data_pagamento date not null,
    forma_pagamento varchar(20) not null
);

ALTER TABLE PAGAMENTO
ADD COLUMN id_cliente int not null;
ALTER TABLE PAGAMENTO
ADD COLUMN id_agendamento int not null;
DESCRIBE PAGAMENTO;

CREATE TABLE PRESTAR (
    FK_SERVICO_id_servico INT,
    FK_FUNCIONARIO_id_funcionario INT
);

CREATE TABLE SOLICITAR (
    FK_SERVICO_id_servico INT,
    FK_AGENDAMENTO_id_agendamento INT
);

CREATE TABLE FAZER (
    FK_CLIENTE_PAGAMENTO_id_cliente INT,
    FK_AGENDAMENTO_id_agendamento INT
);

CREATE TABLE REQUER (
    FK_SERVICO_id_servico INT,
    FK_PAGAMENTO_id_pagamento INT
);
 
ALTER TABLE PRESTAR ADD CONSTRAINT FK_PRESTAR_1
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico)
    ON DELETE RESTRICT;
 
ALTER TABLE PRESTAR ADD CONSTRAINT FK_PRESTAR_2
    FOREIGN KEY (FK_FUNCIONARIO_id_funcionario)
    REFERENCES FUNCIONARIO (id_funcionario)
    ON DELETE RESTRICT;
 
ALTER TABLE SOLICITAR ADD CONSTRAINT FK_SOLICITAR_1
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico)
    ON DELETE RESTRICT;
 
ALTER TABLE SOLICITAR ADD CONSTRAINT FK_SOLICITAR_2
    FOREIGN KEY (FK_AGENDAMENTO_id_agendamento)
    REFERENCES AGENDAMENTO (id_agendamento)
    ON DELETE RESTRICT;
 
ALTER TABLE FAZER ADD CONSTRAINT FK_FAZER_1
    FOREIGN KEY (FK_CLIENTE_PAGAMENTO_id_cliente)
    REFERENCES PAGAMENTO (id_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE FAZER ADD CONSTRAINT FK_FAZER_2
    FOREIGN KEY (FK_AGENDAMENTO_id_agendamento)
    REFERENCES AGENDAMENTO (id_agendamento)
    ON DELETE RESTRICT;
 
ALTER TABLE REQUER ADD CONSTRAINT FK_REQUER_1
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico)
    ON DELETE RESTRICT;
 
ALTER TABLE REQUER ADD CONSTRAINT FK_REQUER_2
    FOREIGN KEY (FK_PAGAMENTO_id_pagamento)
    REFERENCES SERVICO (id_servico);