# Parte 1: Documentação do processo de importação

## Estrutura da planilha

| Aba | Coluna | Tipo | Observação |
| --- | --- | --- | --- |
| `public_venda` | `venda_id` | `BIGINT` | Chave Primária (PK) |
| `public_venda` | `data_emissao` | `DATE` | Data da venda (usada no filtro de Fev/2025) |
| `public_venda` | `horariomov` | `VARCHAR(8)` | Horário do movimento (`HH:MM:SS`) |
| `public_venda` | `produto_id` | `VARCHAR(25)` | Código identificador do produto |
| `public_venda` | `qtde_vendida` | `DOUBLE` | Quantidade vendida |
| `public_venda` | `valor_unitario` | `NUMERIC(12,4)` | Valor unitário em R$ |
| `public_venda` | `filial_id` | `BIGINT` | Código da filial |
| `public_venda` | `item` | `INT` | Número do item |
| `public_venda` | `unidade_medida` | `VARCHAR(3)` | Unidade de medida (ex: UN, KG) |
| `public_pedido_compra` | `pedido_id` | `DOUBLE` | Identificador do pedido de compra |
| `public_pedido_compra` | `data_pedido` | `DATE` | Data do pedido |
| `public_pedido_compra` | `item` | `DOUBLE` | Item do pedido |
| `public_pedido_compra` | `produto_id` | `VARCHAR(25)` | Código do produto requisitado |
| `public_pedido_compra` | `descricao_produto` | `VARCHAR(255)` | Nome/Descrição do produto |
| `public_pedido_compra` | `ordem_compra` | `DOUBLE` | Número da ordem de compra |
| `public_pedido_compra` | `qtde_pedida` | `DOUBLE` | Quantidade requisitada |
| `public_pedido_compra` | `filial_id` | `INT` | Código da filial solicitante |
| `public_pedido_compra` | `data_entrega` | `DATE` | Data de entrega |
| `public_pedido_compra` | `qtde_entregue` | `DOUBLE` | Quantidade entregue |
| `public_pedido_compra` | `qtde_pendente` | `DOUBLE` | Quantidade pendente |
| `public_pedido_compra` | `preco_compra` | `DOUBLE` | Preço unitário de compra |
| `public_pedido_compra` | `fornecedor_id` | `INT` | ID do fornecedor |
| `public_entradas_mercadoria` | `ordem_compra` | `DOUBLE` | Chave Primária (PK) |
| `public_entradas_mercadoria` | `data_entrada` | `DATE` | Data de recebimento |
| `public_entradas_mercadoria` | `nro_nfe` | `VARCHAR(255)` | Número da Nota Fiscal Eletrônica |
| `public_entradas_mercadoria` | `item` | `DOUBLE` | Item da NF-e |
| `public_entradas_mercadoria` | `produto_id` | `VARCHAR(25)` | Código do produto recebido |
| `public_entradas_mercadoria` | `descricao_produto` | `VARCHAR(255)` | Descrição da mercadoria |
| `public_entradas_mercadoria` | `qtde_recebida` | `DOUBLE` | Quantidade recebida |
| `public_entradas_mercadoria` | `filial_id` | `INT` | Código da filial |
| `public_entradas_mercadoria` | `custo_unitario` | `NUMERIC(12,4)` | Custo unitário de entrada |
| `public_produtos_filial` | `filial_id` | `INT` | Chave Primária composta (PK) |
| `public_produtos_filial` | `produto_id` | `VARCHAR(255)` | Chave Primária composta (PK) |
| `public_produtos_filial` | `descricao` | `VARCHAR(255)` | Descrição oficial do produto |
| `public_produtos_filial` | `estoque` | `DOUBLE` | Saldo em estoque |
| `public_produtos_filial` | `preco_unitario` | `DOUBLE` | Preço de tabela |
| `public_produtos_filial` | `preco_compra` | `DOUBLE` | Preço de compra |
| `public_produtos_filial` | `preco_venda` | `DOUBLE` | Preço de venda |
| `public_produtos_filial` | `idfornecedor` | `INT` | Preenchido automaticamente via TRIGGER |
| `public_fornecedor` | `idfornecedor` | `VARCHAR(25)` | Chave Primária (PK) |
| `public_fornecedor` | `razao_social` | `VARCHAR(255)` | Nome / Razão Social do fornecedor |
### Ferramenta Utilizada
* **SGBD / Ferramenta:** MySQL (gerenciado via DBeaver)

## Erros encontrados no DDL e como foram corrigidos

| Tabela | Erro | Correção |
| --- | --- | --- |
| Tabela | Erro | Correção |
| :--- | :--- | :--- |
| `public.venda` | Uso de tipos/sintaxe do PostgreSQL (`int8`, `float8`, `::character varying`). | Substituir por tipos nativos do MySQL (`BIGINT`, `DOUBLE`) e remover o cast de texto. |
| `public.entradas_mercadoria` | A `PRIMARY KEY` faz referência à coluna `ordem_compra`, que não foi declarada. | Adicionar a coluna `ordem_compra DOUBLE NOT NULL` à tabela. |
| `public.produtos_filial` | Falta de vírgula após o campo `idfonecedor`, antes do `CONSTRAINT`. | Adicionar a vírgula para separar a coluna da instrução de chave primária. |
| `public.produtos_filial` | A coluna `filial_id` foi definida como `NULL`, mas pertence à `PRIMARY KEY`. | Alterar a definição de `filial_id` para `NOT NULL`. |
| `public.produtos_filial` | A `PRIMARY KEY` aponta para `idproduto`, mas o nome correto na tabela é `produto_id`. | Corrigir a constraint para `PRIMARY KEY (filial_id, produto_id)`. |
| `public.produtos_filial` | Definição de valores numéricos `DEFAULT` entre aspas simples (`'0'`). | Remover as aspas para manter o padrão numérico correto (`DEFAULT 0`). |
| `public.fornecedor` | A `PRIMARY KEY` referencia `idproduto`, uma coluna inexistente nesta tabela. | Remover `idproduto` da constraint, mantendo apenas `PRIMARY KEY (idfornecedor)`. |

## Erros encontrados no script de importação e como foram corrigidos

| Erro | Efeito | Correção |
| --- | --- | --- |
|  |  |  |

## Tratamentos aplicados aos dados

(conversão de tipos, validações, normalizações)

## Conferência final

| Tabela | Linhas na planilha | Linhas no banco |
| --- | --- | --- |
| fornecedor |  |  |
| produtos_filial |  |  |
| pedido_compra |  |  |
| entradas_mercadoria |  |  |
| venda |  |  |
