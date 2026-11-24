-- Aqui em baixo deixei o erros que fora encontrados 
CREATE TABLE public_venda (
    venda_id BIGINT NOT NULL,
    data_emissao DATE NOT NULL,
    horariomov VARCHAR(8) DEFAULT '00:00:00' NOT NULL,
    produto_id VARCHAR(25) DEFAULT '' NOT NULL,
    qtde_vendida DOUBLE NULL,
    valor_unitario NUMERIC(12, 4) DEFAULT 0 NOT NULL,
    filial_id BIGINT DEFAULT 1 NOT NULL,
    item INT DEFAULT 0 NOT NULL,
    unidade_medida VARCHAR(3) NULL,
    CONSTRAINT pk_consumo PRIMARY KEY (filial_id, venda_id, data_emissao, produto_id, item, horariomov)
);

CREATE TABLE public_pedido_compra (
    pedido_id DOUBLE DEFAULT 0 NOT NULL,
    data_pedido DATE NULL,
    item DOUBLE DEFAULT 0 NOT NULL,
    produto_id VARCHAR(25) DEFAULT '0' NOT NULL,
    descricao_produto VARCHAR(255) NULL,
    ordem_compra DOUBLE DEFAULT 0 NOT NULL,
    qtde_pedida DOUBLE NULL,
    filial_id INT NULL,
    data_entrega DATE NULL,
    qtde_entregue DOUBLE DEFAULT 0 NOT NULL,
    qtde_pendente DOUBLE DEFAULT 0 NOT NULL,
    preco_compra DOUBLE DEFAULT 0 NULL,
    fornecedor_id INT DEFAULT 0 NULL,
    CONSTRAINT pedido_compra_pkey PRIMARY KEY (pedido_id, produto_id, item)
);

CREATE TABLE public_entradas_mercadoria (
    ordem_compra DOUBLE NOT NULL, -- Coluna adicionada para bater com a PK
    data_entrada DATE NULL,
    nro_nfe VARCHAR(255) NOT NULL,
    item DOUBLE DEFAULT 0 NOT NULL,
    produto_id VARCHAR(25) DEFAULT '0' NOT NULL,
    descricao_produto VARCHAR(255) NULL,
    qtde_recebida DOUBLE NULL,
    filial_id INT NULL,
    custo_unitario NUMERIC(12, 4) DEFAULT 0 NOT NULL,
    CONSTRAINT entradas_mercadoria_pkey PRIMARY KEY (ordem_compra, item, produto_id, nro_nfe)
);

CREATE TABLE public_produtos_filial (
    filial_id INT NOT NULL, -- Ajustado para NOT NULL para aceitar PK
    produto_id VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    estoque DOUBLE DEFAULT 0 NOT NULL,
    preco_unitario DOUBLE DEFAULT 0 NOT NULL,
    preco_compra DOUBLE DEFAULT 0 NOT NULL,
    preco_venda DOUBLE DEFAULT 0 NOT NULL,
    idfornecedor INT NULL, -- Corrigida a falta de virgula aqui
    CONSTRAINT produtos_filial_pkey PRIMARY KEY (filial_id, produto_id) -- Corrigido idproduto -> produto_id
);

CREATE TABLE public_fornecedor (
    idfornecedor VARCHAR(25) NOT NULL,
    razao_social VARCHAR(255) NOT NULL,
    CONSTRAINT fornecedor_pkey PRIMARY KEY (idfornecedor) -- Removido idproduto que nao existia
);-- DDL corrigido para MySQL
