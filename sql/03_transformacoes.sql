-- Parte 3: Transformações de Dados e Triggers

-- Interpretacao do requisito "mais de 10 vezes":
-- A expressao "mais de 10 vezes" foi interpretada como a contagem total de ocorrencias de requisicao
-- (quantidade de pedidos/registros em que o produto aparece) sendo estritamente maior que 10 (COUNT(*) > 10).

-- 1, 2 e 3. Concatenacao, Formatacao de Data e Filtro por Requisicao (> 10 vezes)
SELECT 
    CONCAT(pc.produto_id, ' - ', COALESCE(pc.descricao_produto, 'Sem Descrição')) AS Produto,
    SUM(pc.qtde_pedida) AS "Qtde Requisitada",
    DATE_FORMAT(pc.data_pedido, '%d/%m/%Y') AS "Solicitação de dados"
FROM public_pedido_compra pc
WHERE pc.data_pedido >= '2025-02-01' 
  AND pc.data_pedido <= '2025-02-28'
GROUP BY 
    pc.produto_id, 
    pc.descricao_produto, 
    pc.data_pedido
HAVING COUNT(*) > 10;


-- 4. Automação de ID do Fornecedor na tabela de produtos via TRIGGER
-- Gera/Associa o idfornecedor automaticamente a partir do historico de pedidos de compra.

DELIMITER //

CREATE TRIGGER trg_auto_idfornecedor_produtos
BEFORE INSERT ON public_produtos_filial
FOR EACH ROW
BEGIN
    DECLARE v_idfornecedor INT;

    -- Busca o ultimo fornecedor que forneceu o produto cadastrado
    SELECT fornecedor_id INTO v_idfornecedor
    FROM public_pedido_compra
    WHERE produto_id = NEW.produto_id
      AND fornecedor_id IS NOT NULL
    ORDER BY data_pedido DESC
    LIMIT 1;

    -- Atribui o fornecedor encontrado ao novo registro da tabela produtos_filial
    IF v_idfornecedor IS NOT NULL THEN
        SET NEW.idfornecedor = v_idfornecedor;
    END IF;
END//

DELIMITER ;
