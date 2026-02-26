{{ config(materialized='table', alias='vendas') }}

WITH src AS (
    SELECT * FROM {{ ref('vendas_finais') }}
)

SELECT
    {{ cast_int('produto') }} AS cod_produto,
    {{ cast_int('cod_loja') }} AS cod_loja,
    {{ cast_int('pdv') }} AS ponto_de_venda,
    {{ cast_int('cupom') }} AS cupom,
    {{ cast_decimal('pco') }} AS preco,
    {{ cast_decimal('desconto') }} AS desconto ,
    {{ cast_decimal('pcotot') }} AS preco_total,
    {{ cast_decimal('descontotot') }} AS desconto_total,
    {{ cast_int('qtd') }} AS quantidade,
    {{cast_date('data', 'yyyy-MM-dd') }} AS data
FROM src