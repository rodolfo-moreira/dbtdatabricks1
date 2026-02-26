{% macro generate_schema_name(custom_schema_name, node) -%}
    {# 
      Se NÃO tiver custom_schema (+schema), usa o schema padrão do target (ex.: default).
      Se TIVER custom_schema (+schema: bronze/silver/gold),
      usa APENAS ele, sem prefixar com target.schema.
    #}
    {%- if custom_schema_name is none -%}
        {{ target.schema }}
    {%- else -%}
        {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}