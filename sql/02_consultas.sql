
-- 1. Total em vendas e quantidade em R$ por produto, em fevereiro de 2025.
SELECT 
    produto_id,
    SUM(qtde_vendida) AS total_quantidade_vendida,
    SUM(qtde_vendida * valor_unitario) AS valor_total_vendas_rs
FROM public_venda
WHERE data_emissao >= '2025-02-01' 
  AND data_emissao <= '2025-02-28'
GROUP BY produto_id;


-- 2. Produtos requisitados e não recebidos.
-- Considera itens onde a quantidade pendente é maior que zero ou quantidade entregue é igual a zero.
SELECT DISTINCT
    pc.produto_id,
    pc.descricao_produto,
    pc.qtde_pedida,
    pc.qtde_entregue,
    pc.qtde_pendente
FROM public_pedido_compra pc
WHERE pc.qtde_pendente > 0 
   OR (pc.qtde_pedida > 0 AND pc.qtde_entregue = 0);
