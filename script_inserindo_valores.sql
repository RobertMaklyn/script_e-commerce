-- Inserindo dados na tabela cliente
INSERT INTO cliente (pnome, nmeio_inicial, sobre_nome, CPF, endereco, data_de_nascimento, tipo_cliente)
VALUES
('João', 'A.', 'Silva', '12345678901', 'Rua das Flores, 123', '1990-01-15', 'PF'),
('Maria', 'B.', 'Oliveira', '98765432100', 'Av. Paulista, 456', '1985-07-20', 'PF'),
('Pedro', 'C.', 'Santos', '45612378902', 'Rua da Praia, 789', '1995-11-05', 'PF');

-- Inserindo dados na tabela produto
INSERT INTO Produto (Pnome, categoria, avaliacao, valor)
VALUES
('Boneca Barbie', 'brinquedos', 4.5, 59.99),
('Camiseta Branca', 'roupas', 4.0, 29.90),
('Carro de Controle Remoto', 'brinquedos', 4.8, 120.00);

-- Inserindo dados na tabela pedido
INSERT INTO pedido (cliente_idcliente, status_do_pedido, descricao, frete)
VALUES
(1, 'pendente', 'Pedido de brinquedos', 15.00),
(2, 'finalizado', 'Pedido de roupas', 10.00),
(3, 'cancelado', 'Pedido misto', 20.00);

-- Inserindo dados na tabela estoque
INSERT INTO estoque (local, quantidade)
VALUES
('Armazém Central', 100),
('Loja Física', 50),
('Armazém Secundário', 200);

-- Inserindo dados na tabela fornecedor
INSERT INTO fornecedor (razao_social, CNPJ, contato)
VALUES
('Brinquedos SA', '12345678000199', '11999999999'),
('Roupas LTDA', '98765432000188', '11988888888');

-- Inserindo dados na tabela Terceiro_vendedor
INSERT INTO Terceiro_vendedor (razao_social, local, nome_fantasia, CNPJ, CPF)
VALUES
('Loja de Brinquedos', 'Shopping Center', 'ToyShop', '45612378000166', 12345678147),
('Roupas da Moda', 'Av. Central', 'Fashion Clothes', 456123780008457, '12345678910');

-- Inserindo dados na tabela produto_fornecedor
INSERT INTO produto_fornecedor (Produto_idProduto, fornecedor_idfornecedor, quantidade)
VALUES
(1, 1, 50),
(2, 2, 30),
(3, 1, 20);

-- Inserindo dados na tabela produto_terceiro_vendedor
INSERT INTO produto_terceiro_vendedor (Produto_idProduto, Terceiro_idTerceiro, quantidade)
VALUES
(1, 1, 10),
(2, 2, 5),
(3, 1, 15);

-- Inserindo dados na tabela produto_estoque
INSERT INTO produto_estoque (Produto_idProduto, estoque_idestoque, quantidade)
VALUES 
    (1, 1, 40),
    (2, 2, 20),
    (3, 3, 60)
AS new
ON DUPLICATE KEY UPDATE quantidade = new.quantidade;

-- Inserindo dados na tabela produto_pedido
INSERT INTO produto_pedido (Produto_idProduto, pedido_idpedido, quantidade, status)
VALUES
(1, 1, 2, 'reservado'),
(2, 2, 1, 'entregue'),
(3, 3, 3, 'entregue');

-- Inserindo dados na tabela forma_pagamento

INSERT INTO forma_pagamento (tipo_pagamento, detalhes_pagamento)
VALUES
('cartao_credito', 'Visa - 1234 **** **** 5678'),
('boleto', 'Boleto bancário - Banco do Brasil'),
('pix', 'Chave PIX - CPF: 12345678901'),
('transferencia', 'Conta: 1234-5 / Banco: Itaú'),
('cartao_credito', 'Mastercard - 9876 **** **** 5432');


-- Iserindo dados na tabela cliente_forma_pagamento

INSERT INTO cliente_forma_pagamento (cliente_idcliente, forma_pagamento_idpagamento)
VALUES
(1, 1), 
(1, 3), 
(2, 2), 
(3, 4); 

-- Inserindo dados na tabela entrega

INSERT INTO entrega (pedido_idpedido, status_entrega, codigo_rastreio)
VALUES
(1, 'pendente', 'BR123456789BR'), -- Pedido 1 ainda está pendente
(2, 'entregue', 'BR987654321BR'), -- Pedido 2 já foi entregue
(3, 'cancelado', NULL);     