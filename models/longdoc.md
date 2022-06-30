{% docs firstOrderDate %}

The first_order_date column is only populated when a customer has placed at least one order.

When a customer has many orders, the value will be the minimum, or oldest of all the order dates. Otherwise, the value will be NULL.

{% enddocs %}
