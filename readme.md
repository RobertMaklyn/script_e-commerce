# Sistema de Banco de Dados para E-commerce

Este projeto implementa um banco de dados relacional para gerenciar um sistema de e-commerce, com funcionalidades robustas para controle de clientes, produtos, pedidos, estoques, fornecedores, vendedores terceirizados, formas de pagamento e entregas.

## Estrutura do Banco de Dados
- **Clientes**: Cadastro de informações pessoais e relacionamento com formas de pagamento.
- **Produtos**: Dados sobre nome, categoria, valor, avaliação e estoque.
- **Pedidos**: Registro de pedidos, incluindo status, produtos associados e informações de frete.
- **Estoque**: Controle de quantidades por local.
- **Fornecedores e Vendedores Terceirizados**: Cadastro e associação de produtos fornecidos/vendidos.
- **Formas de Pagamento**: Tipos e detalhes de pagamentos.
- **Entregas**: Status e rastreamento de entregas de pedidos.

## Funcionalidades
- Controle de estoque por localização.
- Associação de pedidos a clientes, produtos e status.
- Gerenciamento de formas de pagamento e entregas.
- Relatórios, como:
  - Produtos mais avaliados.
  - Estoques com maior quantidade.
  - Pedidos por cliente.

## Como Utilizar
1. Execute os scripts SQL para criar as tabelas e inserir os dados fictícios.
2. Utilize as consultas fornecidas para explorar os dados e gerar relatórios.
