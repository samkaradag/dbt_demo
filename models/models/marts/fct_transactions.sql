with transactions as (

    select * from {{ ref('stg_transactions') }}

),

dim_customers as (

    select * from {{ ref('dim_customers') }}

),

dim_payment_methods as (

    select * from {{ ref('dim_payment_methods') }}

)

select 
    t.transaction_id,
    t.reference,
    t.amount,
    t.status,
    t.created_at,
    t.updated_at,
    dc.customer_id as debtor_customer_id,
    dp.customer_id as creditor_customer_id,
    pm.payment_method_id
from transactions t
left join dim_customers dc on t.debtor_customer_id = dc.customer_id
left join dim_customers dp on t.creditor_customer_id = dp.customer_id
left join dim_payment_methods pm on t.payment_method_id = pm.payment_method_id