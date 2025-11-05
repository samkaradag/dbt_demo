with disputes as (

    select * from {{ ref('stg_disputes') }}

),

fct_transactions as (

    select * from {{ ref('fct_transactions') }}

)

select 
    d.dispute_id,
    d.reason,
    d.amount,
    d.status,
    d.created_at,
    d.updated_at,
    ft.transaction_id
from disputes d
left join fct_transactions ft on d.transaction_id = ft.transaction_id