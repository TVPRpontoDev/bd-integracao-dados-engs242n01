-- Parte 4: Consultas para Validação de Erros nos Dados

-- Erro 1: Vendas sem produto correspondente na tabela de produtos (Inconsistencia de integridade referencial)
SELECT v.*
FROM public_venda v
LEFT JOIN public_produtos_filial p ON v.produto_id = p.produto_id
WHERE p.produto_id IS NULL;

-- Erro 2: Quantidades entregues maiores que as quantidades pedidas no pedido de compra
SELECT *
FROM public_pedido_compra
WHERE qtde_entregue > qtde_pedida;

-- Erro 3: Datas de emissao ou entrega com valores nulos ou invalidos em fevereiro/2025
SELECT *
FROM public_venda
WHERE data_emissao IS NULL;

-- Erro 4: Precos unitarios ou valores negativos nas vendas
SELECT *
FROM public_venda
WHERE valor_unitario < 0 OR qtde_vendida < 0;

-- Erro 5: Entradas de mercadoria sem nota fiscal ou com NFe duplicada
SELECT nro_nfe, item, COUNT(*) AS duplicadas
FROM public_entradas_mercadoria
GROUP BY nro_nfe, item
HAVING COUNT(*) > 1;
