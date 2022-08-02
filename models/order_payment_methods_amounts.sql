{%- set payment_methods = get_payment_methods() -%}

SELECT
    order_id,
{%- for pmo in payment_methods %}
    IFNULL(SUM(CASE WHEN payment_method = '{{pmo}}' THEN amount END), 0) AS {{pmo}}_amount,
{%- endfor %}
    IFNULL(SUM(amount), 0) AS total_amount
FROM {{ ref('raw_payments') }}
GROUP BY order_id
