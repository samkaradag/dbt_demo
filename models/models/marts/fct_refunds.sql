with refunds as (

    select * from {{ ref('stg_refunds') }}

),

fct_transactions as (

    select * from {{ ref('fct_transactions') }}

)

select 
    r.refund_id,
    r.reason,
    r.amount,
    r.status,
    r.created_at,
    r.updated_at,
    ft.transaction_id as original_transaction_id
from refunds r
left join fct_transactions ft on r.original_transaction_id = ft.transaction_id