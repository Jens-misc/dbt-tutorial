{%- set payment_methods = dbt_utils.get_column_values(
    table=ref('raw_payments'),
    column='payment_method'
) -%}

SELECT
    order_id,
{%- for pmo in payment_methods %}
    IFNULL(SUM(CASE WHEN payment_method = '{{pmo}}' THEN amount END), 0) AS {{pmo}}_amount,
{%- endfor %}
    IFNULL(SUM(amount), 0) AS total_amount
FROM {{ ref('raw_payments') }}
GROUP BY order_id
