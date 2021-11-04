with customers as (
    select * from {{ref('stg_customers')}}
),

orders as (
    select * from {{ ref('stg_orders')}}
),

payments as (
    select * from {{ ref('stg_payments')}}
)


select orders.order_id, customers.customer_id, payments.amount

from orders 
left join customers using (customer_id)
left join payments on payments.orderid = orders.order_id 
