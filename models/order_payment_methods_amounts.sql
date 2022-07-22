{%- set payment_methods = ["bank_transfer", "credit_card", "gift_card"] -%}

SELECT
    order_id,
{%- for pm in payment_methods %}
    IFNULL(SUM(CASE WHEN payment_method = '{{pm}}' THEN amount END), 0) AS {{pm}}_amount,
{%- endfor %}
    IFNULL(SUM(amount), 0) AS total_amount
FROM {{ ref('raw_payments') }}
GROUP BY order_id
