{% macro get_column_values(column_name, relation) %}

    {% set relation_query %}
        SELECT DISTINCT
            {{ column_name }}
        FROM {{ relation }}
        ORDER BY {{ column_name }}
    {% endset %}

    {% set results = run_query(relation_query) %}

    {% if execute %}
    {# Return the first column #}
        {% set results_list = results.columns[0].values() %}
    {% else %}
        {% set results_list = [] %}
    {% endif %}
    {{ log("**** before list check ****" + ": size, " + (results_list|length)|string, info=True) }}
    {% for pm in results_list %}
        {{ log(pm, info=True) }}
    {% endfor %}

    {{ return(results_list) }}

{% endmacro %}


{% macro get_payment_methods() %}
    {{ return(get_column_values('payment_method', ref('raw_payments'))) }}
{% endmacro %}
