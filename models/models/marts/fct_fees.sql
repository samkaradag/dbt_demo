with fees as (

    select * from {{ ref('stg_fees') }}

),

fct_transactions as (

    select * from {{ ref('fct_transactions') }}

)

select 
    f.fee_id,
    f.fee_type,
    f.amount,
    f.created_at,
    ft.transaction_id
from fees f
left join fct_transactions ft on f.transaction_id = ft.transaction_id