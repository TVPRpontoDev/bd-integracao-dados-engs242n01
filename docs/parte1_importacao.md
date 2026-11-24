# Parte 1: Documentação do processo de importação

## Ferramenta utilizada

## Estrutura da planilha

| Aba | Coluna | Tipo | Observação |
| --- | --- | --- | --- |
|  |  |   |  |

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
