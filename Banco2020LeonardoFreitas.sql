create database db2020;
 
create table db2020.usuarios (
  id BIGINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255),
  login VARCHAR(255),
  senha VARCHAR(255),
  status VARCHAR(255),
  tipo VARCHAR(255),
  primary key (id));

create table db2020.cliente (
  cli_id BIGINT NOT NULL AUTO_INCREMENT,
  cli_nome VARCHAR(255),
  cli_telefone VARCHAR(255),
  primary key (cli_id));
  
  create table db2020.confeiteiros (
  conf_id BIGINT NOT NULL AUTO_INCREMENT,
  conf_nome VARCHAR(255),
  conf_cpf VARCHAR(255),
  conf_telefone VARCHAR(255),
  primary key (conf_id));
  
  create table db2020.pedido (
  ped_id BIGINT NOT NULL AUTO_INCREMENT,
  ped_nome VARCHAR(255),
  ped_preco VARCHAR(255),
  primary key (ped_id));

  create table db2020.cp_cliente_pedido (
  cp_id BIGINT NOT NULL AUTO_INCREMENT,
  cp_cli_id BIGINT,
  cp_ped_id BIGINT,
  cp_obs VARCHAR(255),
  primary key (cp_id));

create table db2020.cr_confeiteiro_receita (
  cr_id BIGINT NOT NULL AUTO_INCREMENT,
  cr_conf_id BIGINT,
  cr_rec_id BIGINT,
  cr_obs VARCHAR(255),
  primary key (cr_id));
  
ALTER TABLE db2020.cp_cliente_pedido ADD CONSTRAINT FK_CP_CLI_ID FOREIGN KEY (CP_CLI_ID) REFERENCES db2020.CLIENTE (CLI_ID);
ALTER TABLE db2020.cp_cliente_pedido ADD CONSTRAINT FK_CP_PED_ID FOREIGN KEY (CP_PED_ID) REFERENCES db2020.PEDIDO (PED_ID);   

ALTER TABLE db2020.cr_confeiteiro_receita ADD CONSTRAINT FK_CR_CONF_ID FOREIGN KEY (CR_CONF_ID) REFERENCES db2020.CONFEITEIROS (CONF_ID);
ALTER TABLE db2020.cr_confeiteiro_receita ADD CONSTRAINT FK_CR_REC_ID FOREIGN KEY (CR_PED_ID) REFERENCES db2020.PEDIDO (PED_ID);  

INSERT INTO `db2020`.`usuarios` (`id`, `nome`, `login`, `senha`, `status`, `tipo`) VALUES ('1', 'Leonardo', 'LEONARDO', '12345', 'ATIVO', 'ADM');

SELECT     
        CLI.CLI_ID 'ID_CLIENTE', 
        CLI.CLI_NOME 'NOME_CLIENTE', 
        CLI.CLI_TELEFONE 'TELEFONE_CLIENTE',
        PED.PED_ID 'ID_PEDIDO',
        PED.PED_NOME 'NOME_PEDIDO',
        PED.PED_PRECO 'PRECO_PEDIDO', 
        CP.CP_ID 'ID_RELACAO', 
        CP.CP_OBS 'OBS_RELACAO'  
FROM 
        db2020.cliente cli, 
        db2020.pedido ped, 
        db2020.cp_cliente_pedido cp 
WHERE 
        cli.cli_id = cp.cp_cli_id 
AND 
        ped.ped_id = cp.cp_ped_id;


SELECT     
        CONF.CONF_ID 'ID_CONFEITEIRO', 
        CONF.CONF_NOME 'NOME_CONFEITEIRO', 
        CONF.CONF_TELEFONE 'TELEFONE_CONFEITEIRO',
        PED.PED_ID 'ID_PEDIDO',
        PED.PED_NOME 'NOME_PEDIDO',
        PED.PED_PRECO 'PRECO_PEDIDO', 
        CR.CR_ID 'ID_RELACAO', 
        CR.CR_OBS 'OBS_RELACAO'  
FROM 
        db2020.confeiteiros conf, 
        db2020.pedido rec, 
        db2020.cr_confeiteiro_receita cr 
WHERE 
        conf.conf_id = cr.cr_conf_id 
AND 
        ped.ped_id = cr.cr_rec_id;
