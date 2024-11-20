-- Listar todos os clientes
SELECT * FROM cliente;

-- Obter todos os produtos com suas categorias e valores
SELECT idProduto, Pnome AS Produto, categoria, valor 
FROM Produto;

-- Listar pedidos e seus respectivos clientes
SELECT 
    pedido.idpedido AS PedidoID,
    cliente.pnome AS Cliente,
    pedido.status_do_pedido AS Status,
    pedido.descricao AS Descricao,
    pedido.frete AS Frete
FROM pedido
JOIN cliente ON pedido.cliente_idcliente = cliente.idcliente;

-- Mostrar produtos em estoque e suas quantidades
SELECT 
    Produto.Pnome AS Produto, 
    estoque.local AS LocalEstoque, 
    produto_estoque.quantidade AS Quantidade
FROM produto_estoque
JOIN Produto ON produto_estoque.Produto_idProduto = Produto.idProduto
JOIN estoque ON produto_estoque.estoque_idestoque = estoque.idestoque;

-- Produtos fornecidos por fornecedores específicos
SELECT 
    Produto.Pnome AS Produto, 
    fornecedor.razao_social AS Fornecedor, 
    produto_fornecedor.quantidade AS Quantidade
FROM produto_fornecedor
JOIN Produto ON produto_fornecedor.Produto_idProduto = Produto.idProduto
JOIN fornecedor ON produto_fornecedor.fornecedor_idfornecedor = fornecedor.idfornecedor;

-- Produtos com as melhores avaliações
SELECT 
    Pnome AS Produto, 
    categoria AS Categoria, 
    avaliacao AS Avaliacao, 
    valor AS Valor
FROM Produto
WHERE avaliacao >= 4.5
ORDER BY avaliacao DESC;

-- Estoque com mais de 50 unidades
SELECT 
    estoque.local AS LocalEstoque, 
    Produto.Pnome AS Produto, 
    produto_estoque.quantidade AS Quantidade
FROM produto_estoque
JOIN Produto ON produto_estoque.Produto_idProduto = Produto.idProduto
JOIN estoque ON produto_estoque.estoque_idestoque = estoque.idestoque
WHERE produto_estoque.quantidade > 50;

-- Listar todos os clientes e suas formas de pagamento
SELECT 
    c.idcliente, 
    c.pnome AS nome, 
    c.tipo_cliente, 
    fp.tipo_pagamento, 
    fp.detalhes_pagamento
FROM 
    cliente c
JOIN 
    cliente_forma_pagamento cfp ON c.idcliente = cfp.cliente_idcliente
JOIN 
    forma_pagamento fp ON cfp.forma_pagamento_idpagamento = fp.idpagamento;

-- Listar pedidos com seus status e informações de entrega
SELECT 
    p.idpedido, 
    p.descricao, 
    p.status_do_pedido, 
    e.status_entrega, 
    e.codigo_rastreio
FROM 
    pedido p
LEFT JOIN 
    entrega e ON p.idpedido = e.pedido_idpedido;
