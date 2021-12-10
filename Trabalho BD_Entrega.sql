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
    produto varchar(100),
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
    Hr_atendimento varchar(11),
    nome varchar(100),
    idade integer,
    foreign key(cpf) references ESPECIALIZAÇOES(cpf) on delete cascade,
    primary key(cpf)
);
create table ESP_BANHO_TOSA(
	cpf char(11),
    Hr_atendimento varchar(11),
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

insert into CLIENTES(cpf, nome, telefone, cadastro) value ('45656582671', 'Amanda Silva', '944526-3264', '100100900157');
insert into CLIENTES(cpf, nome, telefone, cadastro) value ('76331261672', 'Bruno Castro', '965156-5482', '100100900174');
insert into CLIENTES(cpf, nome, telefone, cadastro) value ('96839391639', 'Carlos Chavier', '916603-1005', '100200900789');
insert into CLIENTES(cpf, nome, telefone, cadastro) value ('85264870004', 'Daniel Lima', '938395-1238', '100300900897');
insert into CLIENTES(cpf, nome, telefone, cadastro) value ('68282040002', 'Eduador Esteves', '932607-0883', '100250900001');
insert into CLIENTES(cpf, nome, telefone, cadastro) value ('53551316899', 'Fabiano Coelho', '916321-1980', '100100900564');
insert into CLIENTES(cpf, nome, telefone, cadastro) value ('22884357807', 'Gabriela Costa', '913506-4330', '100200900321');
insert into CLIENTES(cpf, nome, telefone, cadastro) value ('47182656574', 'Heitor Alves', '923518-0114', '100200900458');
insert into CLIENTES(cpf, nome, telefone, cadastro) value ('71166876888', 'Igor Fagan', '946575-0330', '100300900787');
insert into CLIENTES(cpf, nome, telefone, cadastro) value ('75268181386', 'Joana Rosa', '962321-3691', '100200900222');

insert into ANIMAIS(rga, nome, caracteristicas, raça, cpf_dono) value ('8512352264', 'Art', 'Branco e pequeno porte', 'vira lata', '45656582671');
insert into ANIMAIS(rga, nome, caracteristicas, raça, cpf_dono) value ('7616548651', 'Lika', 'Marrom com manchas brancas e de médio porte', 'Beagle', '76331261672');
insert into ANIMAIS(rga, nome, caracteristicas, raça, cpf_dono) value ('1656547462', 'Nina', 'Caramelo e de médio porte', 'vira lata', '96839391639');
insert into ANIMAIS(rga, nome, caracteristicas, raça, cpf_dono) value ('1684235468', 'Pyke', 'Preto e de pequeno porte', 'Pinscher Miniatura', '85264870004');
insert into ANIMAIS(rga, nome, caracteristicas, raça, cpf_dono) value ('4321098712', 'Touka', 'Branco com manchas pretas e grande porte', 'Dogue Alemão', '68282040002');
insert into ANIMAIS(rga, nome, caracteristicas, raça, cpf_dono) value ('2135968478', 'Amora', 'Branco peludo de pequeno porte', 'Coton de Tuléar', '53551316899');
insert into ANIMAIS(rga, nome, caracteristicas, raça, cpf_dono) value ('2358957456', 'Pantera', 'Preto e de grande porte', 'Dobermann', '22884357807');
insert into ANIMAIS(rga, nome, caracteristicas, raça, cpf_dono) value ('2145873614', 'Tico', 'Branco e médio porte', 'vira lata', '47182656574');
insert into ANIMAIS(rga, nome, caracteristicas, raça, cpf_dono) value ('2365014984', 'Thor', 'Marrom com manchas pretas e de pequeno porte', 'King Charles', '71166876888');
insert into ANIMAIS(rga, nome, caracteristicas, raça, cpf_dono) value ('7841562565', 'Mike', 'Preto e branco de grande porte', 'Border Collie', '75268181386');

insert into SETORES(responsavel, tipo_produto, nome) value ('Antonio dos Santos', 'ração', 'Setor de Rações');
insert into SETORES(responsavel, tipo_produto, nome) value ('Cristiane Silva', 'Remédio', 'Setor de Farmácia');
insert into SETORES(responsavel, tipo_produto, nome) value ('José Carlos', 'Acessórios', 'Setor de Acessórios');
insert into SETORES(responsavel, tipo_produto, nome) value ('Fabricio Pereira', 'Banho', 'Setor de Banho');
insert into SETORES(responsavel, tipo_produto, nome) value ('Eduardo Junior', 'Tosa', 'Setor de Tosa');
insert into SETORES(responsavel, tipo_produto, nome) value ('Maria Julia', 'Consulta veterinária', 'Setor de Veterinária');
insert into SETORES(responsavel, tipo_produto, nome) value ('Vitor Santos', 'Petiscos', 'Setor de Petiscos');
insert into SETORES(responsavel, tipo_produto, nome) value ('Guilherme Machado', 'Aquário', 'Setor de Aquário');
insert into SETORES(responsavel, tipo_produto, nome) value ('Gustavo Rodrigues', 'Aves', 'Setor de Aves');
insert into SETORES(responsavel, tipo_produto, nome) value ('Antonieta Souza', 'Roedores', 'Setor de Roedores');

insert into PRODUTOS(código, nome, preço, setor_produto) value ('725632598612', 'Saco de ração Pedigree', 'R$:59,90', 'Setor de Rações');
insert into PRODUTOS(código, nome, preço, setor_produto) value ('761682348654', 'Nex Gard', 'R$:109,90', 'Setor de Farmácia');
insert into PRODUTOS(código, nome, preço, setor_produto) value ('798686412654', 'Coleira', 'R$:37,49', 'Setor de Acessórios');
insert into PRODUTOS(código, nome, preço, setor_produto) value ('745542355866', 'Banho', 'R$:60,00', 'Setor de Banho');
insert into PRODUTOS(código, nome, preço, setor_produto) value ('713544861266', 'Tosa', 'R$:60,00', 'Setor de Tosa');
insert into PRODUTOS(código, nome, preço, setor_produto) value ('784236526569', 'Consulta', 'R$:120,00', 'Setor de Veterinária');
insert into PRODUTOS(código, nome, preço, setor_produto) value ('798416682543', 'Keldog Dental', 'R$:9,90', 'Setor de Petiscos');
insert into PRODUTOS(código, nome, preço, setor_produto) value ('734619382436', 'Peixe Beta', 'R$:10,00', 'Setor de Aquário');
insert into PRODUTOS(código, nome, preço, setor_produto) value ('796198168299', 'Ração para Papagaio', 'R$:45,99', 'Setor de Aves');
insert into PRODUTOS(código, nome, preço, setor_produto) value ('751456848657', 'Gaiola para Ramister', 'R$:249,00', 'Setor de Roedores');
insert into PRODUTOS(código, nome, preço, setor_produto) value ('743564286176', 'Ração Golden', 'R$:60,00', 'Setor de Rações');
insert into PRODUTOS(código, nome, preço, setor_produto) value ('753824627379', 'Ração Premier', 'R$:70,00', 'Setor de Rações');
insert into PRODUTOS(código, nome, preço, setor_produto) value ('738663846548', 'Arranhador', 'R$:49,00', 'Setor de Acessórios');

insert into COMPRAS(código_produto, cpf_cliente) value ('725632598612', '45656582671');
insert into COMPRAS(código_produto, cpf_cliente) value ('761682348654', '76331261672');
insert into COMPRAS(código_produto, cpf_cliente) value ('798686412654', '96839391639');
insert into COMPRAS(código_produto, cpf_cliente) value ('745542355866', '22884357807');
insert into COMPRAS(código_produto, cpf_cliente) value ('713544861266', '85264870004');
insert into COMPRAS(código_produto, cpf_cliente) value ('784236526569', '47182656574');
insert into COMPRAS(código_produto, cpf_cliente) value ('798416682543', '68282040002');
insert into COMPRAS(código_produto, cpf_cliente) value ('734619382436', '75268181386');
insert into COMPRAS(código_produto, cpf_cliente) value ('796198168299', '71166876888');
insert into COMPRAS(código_produto, cpf_cliente) value ('751456848657', '53551316899');

insert into FORNECEDORES(CNPJ, nome_empresa, telefone, endereço, preço_custo, produto) value ('62848307000102', 'Maisração', '934376-9664', 'Rua Tenente-Coronel Cardoso - RJ CEP: 28035042', 'R$:32,15', 'Saco de ração Pedigree');
insert into FORNECEDORES(CNPJ, nome_empresa, telefone, endereço, preço_custo, produto) value ('07675756000180', 'RemédioJá', '959608-2977', 'Avenida Afonso Pena - MG CEP: 30130005', 'R$:58,15', 'Nex Gard');
insert into FORNECEDORES(CNPJ, nome_empresa, telefone, endereço, preço_custo, produto) value ('64491169000174', 'AcessóPet', '920810-3086', 'Rua Paracatu - SP CEP: 04302021', 'R$:11,00', 'Coleira');
insert into FORNECEDORES(CNPJ, nome_empresa, telefone, endereço, preço_custo, produto) value ('22273726000130', 'PetiscaCia', '933200-0476', 'Avenida São João - SP CEP: 13216000', 'R$:2,90', 'Keldog Dental');
insert into FORNECEDORES(CNPJ, nome_empresa, telefone, endereço, preço_custo, produto) value ('98891164000150', 'PeixeFete', '975180-6618', 'Rua Tenente-Coronel Cardoso - RJ CEP: 28035042', 'R$:1,00', 'Peixe Beta');
insert into FORNECEDORES(CNPJ, nome_empresa, telefone, endereço, preço_custo, produto) value ('17177525000108', 'AveThis', '910214-7530', 'Praça da República - SP  CEP: 01045001', 'R$:15,15', 'Ração para Papagaio');
insert into FORNECEDORES(CNPJ, nome_empresa, telefone, endereço, preço_custo, produto) value ('82816367000142', 'RoerRoer', '922238-1402', 'Rua da Imprensa - MS CEP: 79002290', 'R$:109,90', 'Gaiola para Ramister');
insert into FORNECEDORES(CNPJ, nome_empresa, telefone, endereço, preço_custo, produto) value ('33588648000180', 'AcessóMais', '928730-2593', 'Rua Carlos Augusto Cornelsen - PR CEP: 80520560', 'R$:21,00', 'Arranhador');
insert into FORNECEDORES(CNPJ, nome_empresa, telefone, endereço, preço_custo, produto) value ('13526550000190', 'RaçãoCia', '983223-6536', 'Rua das Fiandeiras - SP CEP: 04545005', 'R$:28,75', 'Ração Golden');
insert into FORNECEDORES(CNPJ, nome_empresa, telefone, endereço, preço_custo, produto) value ('08500745000121', 'IAração', '946085-8583', 'Rua Pereira Estéfano - SP CEP: 04144070', 'R$:35,15', 'Ração Premier');

insert into VENDAS(código_produto, cnpj_fornecedor) value ('725632598612', '62848307000102');
insert into VENDAS(código_produto, cnpj_fornecedor) value ('761682348654', '07675756000180');
insert into VENDAS(código_produto, cnpj_fornecedor) value ('798686412654', '64491169000174');
insert into VENDAS(código_produto, cnpj_fornecedor) value ('798416682543', '22273726000130');
insert into VENDAS(código_produto, cnpj_fornecedor) value ('734619382436', '98891164000150');
insert into VENDAS(código_produto, cnpj_fornecedor) value ('796198168299', '17177525000108');
insert into VENDAS(código_produto, cnpj_fornecedor) value ('751456848657', '82816367000142');
insert into VENDAS(código_produto, cnpj_fornecedor) value ('743564286176', '13526550000190');
insert into VENDAS(código_produto, cnpj_fornecedor) value ('753824627379', '08500745000121');
insert into VENDAS(código_produto, cnpj_fornecedor) value ('738663846548', '33588648000180');

insert into FUNCIONARIOS(ID, nome, cpf) value ('480224135690', 'Antonio dos Santos', '61814015639');
insert into FUNCIONARIOS(ID, nome, cpf) value ('813873488410', 'Cristiane Silva', '32203765763');
insert into FUNCIONARIOS(ID, nome, cpf) value ('962183743000', 'José Carlos', '28870899861');
insert into FUNCIONARIOS(ID, nome, cpf) value ('856617631660', 'Fabricio Pereira', '34286447782');
insert into FUNCIONARIOS(ID, nome, cpf) value ('737574215400', 'Eduardo Junior', '36254548232');
insert into FUNCIONARIOS(ID, nome, cpf) value ('287427012100', 'Maria Julia', '05407388162');
insert into FUNCIONARIOS(ID, nome, cpf) value ('683303327720', 'Vitor Santos', '27796668546');
insert into FUNCIONARIOS(ID, nome, cpf) value ('017147106700', 'Guilherme Machado', '41642286109');
insert into FUNCIONARIOS(ID, nome, cpf) value ('760812995620', 'Gustavo Rodrigues', '58094158301');
insert into FUNCIONARIOS(ID, nome, cpf) value ('551581124010', 'Antonieta Souza', '63634048271'); --
insert into FUNCIONARIOS(ID, nome, cpf) value ('410222586210', 'Claudia Silva', '17552870893');
insert into FUNCIONARIOS(ID, nome, cpf) value ('495283212080', 'Renan Brito', '17446282207');
insert into FUNCIONARIOS(ID, nome, cpf) value ('110733847640', 'Luiz Fernando', '53497398241');
insert into FUNCIONARIOS(ID, nome, cpf) value ('061644666790', 'Gisele Bernardez', '82757728261');
insert into FUNCIONARIOS(ID, nome, cpf) value ('887306217200', 'Irineu Arnaldo', '85683368685');
insert into FUNCIONARIOS(ID, nome, cpf) value ('377685642430', 'Sebastiana Santos', '25689443662');
insert into FUNCIONARIOS(ID, nome, cpf) value ('017948199160', 'Daniele Primo', '42589132603');
insert into FUNCIONARIOS(ID, nome, cpf) value ('679101436990', 'Marcos Vital', '24843258270');
insert into FUNCIONARIOS(ID, nome, cpf) value ('636632466200', 'Gabriel Henrique', '82963350775');
insert into FUNCIONARIOS(ID, nome, cpf) value ('936767171710', 'Augusto Oliveira', '20189328100');

insert into SETOR_TEM_LIDER(ID, nome, Lider) value ('480224135690', 'Setor de Rações', 'Antonio dos Santos');
insert into SETOR_TEM_LIDER(ID, nome, Lider) value ('813873488410', 'Setor de Farmácia', 'Cristiane Silva');
insert into SETOR_TEM_LIDER(ID, nome, Lider) value ('962183743000', 'Setor de Acessórios', 'José Carlos');
insert into SETOR_TEM_LIDER(ID, nome, Lider) value ('856617631660', 'Setor de Banho', 'Fabricio Pereira');
insert into SETOR_TEM_LIDER(ID, nome, Lider) value ('737574215400', 'Setor de Tosa', 'Eduardo Junior');
insert into SETOR_TEM_LIDER(ID, nome, Lider) value ('287427012100', 'Setor de Veterinária', 'Maria Julia');
insert into SETOR_TEM_LIDER(ID, nome, Lider) value ('683303327720', 'Setor de Petiscos', 'Vitor Santos');
insert into SETOR_TEM_LIDER(ID, nome, Lider) value ('017147106700', 'Setor de Aquário', 'Guilherme Machado');
insert into SETOR_TEM_LIDER(ID, nome, Lider) value ('760812995620', 'Setor de Aves', 'Gustavo Rodrigues');
insert into SETOR_TEM_LIDER(ID, nome, Lider) value ('551581124010', 'Setor de Roedores', 'Antonieta Souza');

insert into FUNCION_CONTRATADOS(ID, salario, escolaridade, tamanho_familia) value ('480224135690', 'R$:2000,00', 'Ensino Médio', 3);
insert into FUNCION_CONTRATADOS(ID, salario, escolaridade, tamanho_familia) value ('813873488410', 'R$:2500,00', 'Ensino Médio', 5);
insert into FUNCION_CONTRATADOS(ID, salario, escolaridade, tamanho_familia) value ('962183743000', 'R$:2000,00', 'Ensino Médio', 2);
insert into FUNCION_CONTRATADOS(ID, salario, escolaridade, tamanho_familia) value ('856617631660', 'R$:1800,00', 'Técnico', 4);
insert into FUNCION_CONTRATADOS(ID, salario, escolaridade, tamanho_familia) value ('737574215400', 'R$:1800,00', 'Técnico', 3);
insert into FUNCION_CONTRATADOS(ID, salario, escolaridade, tamanho_familia) value ('287427012100', 'R$:3000,00', 'Ensino Superior', 3);
insert into FUNCION_CONTRATADOS(ID, salario, escolaridade, tamanho_familia) value ('683303327720', 'R$:2700,00', 'Ensino Médio', 5);
insert into FUNCION_CONTRATADOS(ID, salario, escolaridade, tamanho_familia) value ('017147106700', 'R$:2800,00', 'Ensino Médio', 4);
insert into FUNCION_CONTRATADOS(ID, salario, escolaridade, tamanho_familia) value ('760812995620', 'R$:2600,00', 'Ensino Médio', 2);
insert into FUNCION_CONTRATADOS(ID, salario, escolaridade, tamanho_familia) value ('551581124010', 'R$:2350,00', 'Ensino Médio', 3);

insert into SERVIÇOS(tipo_serviço, preço, tempo) value ('Banho', 'R$60,00', '30:00');
insert into SERVIÇOS(tipo_serviço, preço, tempo) value ('Tosa', 'R$60,00', '30:00');
insert into SERVIÇOS(tipo_serviço, preço, tempo) value ('Consulta', 'R$120,00', '60:00');

insert into FUNCION_TERCERIZADOS(ID, salario, empresa, serviço) value ('410222586210', 'R$:1800,00', 'MaisBanho', 'Banho');
insert into FUNCION_TERCERIZADOS(ID, salario, empresa, serviço) value ('495283212080', 'R$:1800,00', 'MaisBanho', 'Banho');
insert into FUNCION_TERCERIZADOS(ID, salario, empresa, serviço) value ('110733847640', 'R$:1900,00', 'BanhoPet', 'Banho');
insert into FUNCION_TERCERIZADOS(ID, salario, empresa, serviço) value ('061644666790', 'R$:1900,00', 'BanhoPet', 'Banho');
insert into FUNCION_TERCERIZADOS(ID, salario, empresa, serviço) value ('887306217200', 'R$:1800,00', 'MaisTosa', 'Tosa');
insert into FUNCION_TERCERIZADOS(ID, salario, empresa, serviço) value ('377685642430', 'R$:1800,00', 'MaisTosa', 'Tosa');
insert into FUNCION_TERCERIZADOS(ID, salario, empresa, serviço) value ('017948199160', 'R$:1900,00', 'TosaPet', 'Tosa');
insert into FUNCION_TERCERIZADOS(ID, salario, empresa, serviço) value ('679101436990', 'R$:1900,00', 'TosaPet', 'Tosa');
insert into FUNCION_TERCERIZADOS(ID, salario, empresa, serviço) value ('636632466200', 'R$:3000,00', 'MaisSaúde', 'Consulta');
insert into FUNCION_TERCERIZADOS(ID, salario, empresa, serviço) value ('936767171710', 'R$:3000,00', 'SaúdePet', 'Consulta');

insert into ESPECIALIZAÇOES(cpf, experiencia, formaçao) value ('17552870893', '10 anos', 'Técnico');
insert into ESPECIALIZAÇOES(cpf, experiencia, formaçao) value ('17446282207', '7 anos', 'Técnico');
insert into ESPECIALIZAÇOES(cpf, experiencia, formaçao) value ('53497398241', '4 anos', 'Técnico');
insert into ESPECIALIZAÇOES(cpf, experiencia, formaçao) value ('82757728261', '1 ano', 'Técnico');
insert into ESPECIALIZAÇOES(cpf, experiencia, formaçao) value ('85683368685', '5 anos', 'Técnico');
insert into ESPECIALIZAÇOES(cpf, experiencia, formaçao) value ('25689443662', '2 anos', 'Técnico');
insert into ESPECIALIZAÇOES(cpf, experiencia, formaçao) value ('42589132603', '3 anos', 'Técnico');
insert into ESPECIALIZAÇOES(cpf, experiencia, formaçao) value ('24843258270', '8 anos', 'Técnico');
insert into ESPECIALIZAÇOES(cpf, experiencia, formaçao) value ('82963350775', '5 anos', 'Veterinário');
insert into ESPECIALIZAÇOES(cpf, experiencia, formaçao) value ('20189328100', '4 anos', 'Veterinário');

insert into ESP_VETERINARIOS(cpf, Hr_atendimento, nome, idade) value('82963350775', '12:00-18:00', 'Gabriel Henrique', 30);
insert into ESP_VETERINARIOS(cpf, Hr_atendimento, nome, idade) value('20189328100', '18:00-21:00', 'Augusto Oliveira', 27);

insert into ESP_BANHO_TOSA(cpf, Hr_atendimento, nome, idade) value ('17552870893', '07:00-17:00', 'Claudia Silva', 35);
insert into ESP_BANHO_TOSA(cpf, Hr_atendimento, nome, idade) value ('17446282207', '17:00-22:00', 'Renan Brito', 43);
insert into ESP_BANHO_TOSA(cpf, Hr_atendimento, nome, idade) value ('53497398241', '07:00-17:00', 'Luiz Fernando', 31);
insert into ESP_BANHO_TOSA(cpf, Hr_atendimento, nome, idade) value ('82757728261', '17:00-22:00', 'Gisele Bernardez', 28);
insert into ESP_BANHO_TOSA(cpf, Hr_atendimento, nome, idade) value ('85683368685', '07:00-17:00', 'Irineu Arnaldo', 35);
insert into ESP_BANHO_TOSA(cpf, Hr_atendimento, nome, idade) value ('25689443662', '17:00-22:00', 'Sebastiana Santos', 24);
insert into ESP_BANHO_TOSA(cpf, Hr_atendimento, nome, idade) value ('42589132603', '07:00-17:00', 'Daniele Primo', 38);
insert into ESP_BANHO_TOSA(cpf, Hr_atendimento, nome, idade) value ('24843258270', '17:00-22:00', 'Marcos Vital', 27);

insert into SERVIÇO_FORNECIDO(ID, tipo_serviço) value ('410222586210', 'Banho');
insert into SERVIÇO_FORNECIDO(ID, tipo_serviço) value ('495283212080', 'Banho');
insert into SERVIÇO_FORNECIDO(ID, tipo_serviço) value ('110733847640', 'Banho');
insert into SERVIÇO_FORNECIDO(ID, tipo_serviço) value ('061644666790', 'Banho');
insert into SERVIÇO_FORNECIDO(ID, tipo_serviço) value ('887306217200', 'Tosa');
insert into SERVIÇO_FORNECIDO(ID, tipo_serviço) value ('377685642430', 'Tosa');
insert into SERVIÇO_FORNECIDO(ID, tipo_serviço) value ('017948199160', 'Tosa');
insert into SERVIÇO_FORNECIDO(ID, tipo_serviço) value ('679101436990', 'Tosa');

insert into ESPECIALIZAÇAO_POSSUIDA(ID, cpf) value ('410222586210', '17552870893');
insert into ESPECIALIZAÇAO_POSSUIDA(ID, cpf) value ('495283212080', '17446282207');
insert into ESPECIALIZAÇAO_POSSUIDA(ID, cpf) value ('110733847640', '53497398241');
insert into ESPECIALIZAÇAO_POSSUIDA(ID, cpf) value ('061644666790', '82757728261');
insert into ESPECIALIZAÇAO_POSSUIDA(ID, cpf) value ('887306217200', '85683368685');
insert into ESPECIALIZAÇAO_POSSUIDA(ID, cpf) value ('377685642430', '25689443662');
insert into ESPECIALIZAÇAO_POSSUIDA(ID, cpf) value ('017948199160', '42589132603');
insert into ESPECIALIZAÇAO_POSSUIDA(ID, cpf) value ('679101436990', '24843258270');

