drop table if exists ESPECIALIZAÇAO_POSSUIDA;
drop table if exists SERVIÇO_FORNECIDO;
drop table if exists SETOR_TEM_LIDER;
drop table if exists VENDAS;
drop table if exists COMPRAS;
drop table if exists ANIMAIS;
drop table if exists CLIENTES;
drop table if exists PRODUTOS;
drop table if exists FORNECEDORES;
drop table if exists SETORES;
drop table if exists FUNCION_TERCERIZADOS;
drop table if exists FUNCION_CONTRATADOS;
drop table if exists FUNCIONARIOS;
drop table if exists ESP_BANHO_TOSA;
drop table if exists ESP_VETERINARIOS;
drop table if exists ESPECIALIZAÇOES;
drop table if exists SERVIÇOS;

create table CLIENTES(
	cpf char(11),
    nome varchar(100),
    telefone char(11),
    cadastro char(12),
    primary key(cpf)
);
create table ANIMAIS(
	rga varchar(10),
    nome varchar(20),
    caracteristicas varchar(100),
    raça varchar(20),
    cpf_dono char(11),
    foreign key(cpf_dono) references CLIENTES(cpf),
    primary key(rga)
);
create table SETORES(
	responsavel varchar(100),
    tipo_produto varchar(100),
    nome varchar(100),
    primary key(nome)
);
create table PRODUTOS(
	código char(12),
    nome varchar(100),
    preço varchar(10),
    setor_produto varchar(100),
    foreign key(setor_produto) references SETORES(nome),
    primary key(código)
);
create table COMPRAS(
	código_produto char(12),
    cpf_cliente char(11),
    foreign key(código_produto) references PRODUTOS(código),
    foreign key(cpf_cliente) references CLIENTES(cpf),
    primary key(código_produto, cpf_cliente)
);
create table FORNECEDORES(
	CNPJ char(14),
    nome_empresa varchar(100),
	telefone char(11),
    endereço varchar(100),
    preço_custo varchar(10),
    primary key(CNPJ)
);
create table VENDAS(
	código_produto char(12),
    cnpj_fornecedor char(14),
    foreign key(código_produto) references PRODUTOS(código),
    foreign key(cnpj_fornecedor) references FORNECEDORES(CNPJ),
    primary key(código_produto, cnpj_fornecedor)
);
create table FUNCIONARIOS(
	ID char(12),
    nome varchar(100),
    cpf char(11),
    primary key(ID)
);
create table SETOR_TEM_LIDER(
	ID char(12),
    nome varchar(100),
    lider varchar(100),
    foreign key(ID) references FUNCIONARIOS(ID),
    foreign key(nome) references SETORES(nome),
    primary key(ID, nome)
);
create table FUNCION_CONTRATADOS(
	ID char(12),
    salario varchar(15),
    escolaridade varchar(50),
    tamanho_familia integer,
    foreign key(ID) references FUNCIONARIOS(ID) on delete cascade,
    primary key(ID)
);
create table SERVIÇOS(
	tipo_serviço varchar(50),
    preço varchar(10),
    tempo varchar(5),
    primary key(tipo_serviço)
);
create table FUNCION_TERCERIZADOS(
	ID char(12),
    salario varchar(15),
    empresa varchar(50),
    serviço varchar(50),
    foreign key(ID) references FUNCIONARIOS(ID) on delete cascade,
    primary key(ID)
);
create table ESPECIALIZAÇOES(
	cpf char(11),
    experiencia varchar(100),
    formaçao varchar(100),
    primary key(cpf)
);
create table ESP_VETERINARIOS(
	cpf char(11),
    Hr_atendimento varchar(10),
    nome varchar(100),
    idade integer,
    foreign key(cpf) references ESPECIALIZAÇOES(cpf) on delete cascade,
    primary key(cpf)
);
create table ESP_BANHO_TOSA(
	cpf char(11),
    Hr_atendimento varchar(10),
    nome varchar(100),
    idade integer,
    foreign key(cpf) references ESPECIALIZAÇOES(cpf) on delete cascade,
    primary key(cpf)
);
create table SERVIÇO_FORNECIDO(
	ID char(12),
    tipo_serviço varchar(50),
    foreign key(ID) references FUNCION_TERCERIZADOS(ID),
    foreign key(tipo_serviço) references SERVIÇOS(tipo_serviço),
    primary key(ID, tipo_serviço)
);
create table ESPECIALIZAÇAO_POSSUIDA(
	ID char(12),
    cpf char(11),
    foreign key(ID) references FUNCION_TERCERIZADOS(ID),
    foreign key(cpf) references ESPECIALIZAÇOES(cpf),
    primary key(ID, cpf)
);
