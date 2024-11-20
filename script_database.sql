-- Criação do banco de dados para o modelo de E-commerce
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Criando tabela cliente
CREATE TABLE IF NOT EXISTS `cliente` (
    `idcliente` INT AUTO_INCREMENT PRIMARY KEY,
    `pnome` VARCHAR(45),
    `nmeio_inicial` CHAR(3),
    `sobre_nome` VARCHAR(45),
    `CPF` CHAR(11) NOT NULL UNIQUE,
    `endereco` VARCHAR(45),
    `data_de_nascimento` DATE,
    `tipo_cliente` ENUM('PF', 'PJ') NOT NULL;
);

-- Criando tabela produto
CREATE TABLE IF NOT EXISTS `Produto` (
    `idProduto` INT AUTO_INCREMENT PRIMARY KEY,
    `Pnome` VARCHAR(45) NOT NULL,
    `categoria` ENUM('brinquedos', 'roupas'),
    `avaliacao` DECIMAL(2,1) DEFAULT NULL,
    `valor` DECIMAL(10, 2)
);

-- Criando tabela pedido
CREATE TABLE IF NOT EXISTS `pedido` (
    `idpedido` INT AUTO_INCREMENT PRIMARY KEY,
    `cliente_idcliente` INT,
    `status_do_pedido` ENUM('pendente', 'finalizado', 'cancelado') DEFAULT 'pendente',
    `descricao` VARCHAR(255),
    `frete` DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente`(`idcliente`)
);

-- Criando tabela estoque
CREATE TABLE IF NOT EXISTS `estoque` (
    `idestoque` INT AUTO_INCREMENT PRIMARY KEY,
    `local` VARCHAR(255),
    `quantidade` INT DEFAULT 0
);

-- Criando tabela fornecedor
CREATE TABLE IF NOT EXISTS `fornecedor` (
    `idfornecedor` INT AUTO_INCREMENT PRIMARY KEY,
    `razao_social` VARCHAR(45),
    `CNPJ` CHAR(14) NOT NULL,
    `contato` CHAR(11) NOT NULL,
    CONSTRAINT `fornecedor_cnpj_unique` UNIQUE (`CNPJ`)
);

-- Criando tabela Terceiro_vendedor
CREATE TABLE IF NOT EXISTS `Terceiro_vendedor` (
    `idTerceiro` INT AUTO_INCREMENT PRIMARY KEY,
    `razao_social` VARCHAR(255),
    `local` VARCHAR(255),
    `nome_fantasia` VARCHAR(45),
    `CNPJ` CHAR(14) NOT NULL,
    `CPF` CHAR(11) NOT NULL,
    CONSTRAINT `terceiro_cnpj_unique` UNIQUE (`CNPJ`),
    CONSTRAINT `terceiro_cpf_unique` UNIQUE (`CPF`)
);

-- Criando tabela produto_fornecedor
CREATE TABLE IF NOT EXISTS `produto_fornecedor` (
    `Produto_idProduto` INT,
    `fornecedor_idfornecedor` INT,
    `quantidade` INT NOT NULL,
    PRIMARY KEY (`Produto_idProduto`, `fornecedor_idfornecedor`),
    FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto`(`idProduto`),
    FOREIGN KEY (`fornecedor_idfornecedor`) REFERENCES `fornecedor`(`idfornecedor`)
);

-- Criando tabela produto_terceiro_vendedor
CREATE TABLE IF NOT EXISTS `produto_terceiro_vendedor` (
    `Produto_idProduto` INT,
    `Terceiro_idTerceiro` INT,
    `quantidade` INT,
    PRIMARY KEY (`Produto_idProduto`, `Terceiro_idTerceiro`),
    FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto`(`idProduto`),
    FOREIGN KEY (`Terceiro_idTerceiro`) REFERENCES `Terceiro_vendedor`(`idTerceiro`)
);

-- Criando tabela produto_estoque
CREATE TABLE IF NOT EXISTS `produto_estoque` (
    `Produto_idProduto` INT,
    `estoque_idestoque` INT,
    `quantidade` INT,
    PRIMARY KEY (`Produto_idProduto`, `estoque_idestoque`),
    FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto`(`idProduto`),
    FOREIGN KEY (`estoque_idestoque`) REFERENCES `estoque`(`idestoque`)
);

-- Criando tabela produto_pedido
CREATE TABLE IF NOT EXISTS `produto_pedido` (
    `Produto_idProduto` INT,
    `pedido_idpedido` INT,
    `quantidade` INT,
    `status` ENUM('reservado', 'enviado', 'entregue'),
    PRIMARY KEY (`Produto_idProduto`, `pedido_idpedido`),
    FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto`(`idProduto`),
    FOREIGN KEY (`pedido_idpedido`) REFERENCES `pedido`(`idpedido`)
);

-- Criando tabela forma_pagamento
CREATE TABLE forma_pagamento (
    idpagamento INT AUTO_INCREMENT PRIMARY KEY,
    tipo_pagamento ENUM('cartao_credito', 'boleto', 'pix', 'transferencia') NOT NULL,
    detalhes_pagamento VARCHAR(255)
);

-- Criando tabela de relacionamento entre cliente e forma_pagamento
CREATE TABLE cliente_forma_pagamento (
    cliente_idcliente INT,
    forma_pagamento_idpagamento INT,
    PRIMARY KEY (cliente_idcliente, forma_pagamento_idpagamento),
    FOREIGN KEY (cliente_idcliente) REFERENCES cliente(idcliente),
    FOREIGN KEY (forma_pagamento_idpagamento) REFERENCES forma_pagamento(idpagamento)
);

-- Criando tabela para gerenciar informações de entrega
CREATE TABLE entrega (
    identrega INT AUTO_INCREMENT PRIMARY KEY,
    pedido_idpedido INT NOT NULL,
    status_entrega ENUM('pendente', 'enviado', 'em_transito', 'entregue', 'cancelado') DEFAULT 'pendente',
    codigo_rastreio VARCHAR(50),
    FOREIGN KEY (pedido_idpedido) REFERENCES pedido(idpedido)
);