with source as (

    select * from {{ source('payments_v1', 'refunds') }}

),

renamed as (

    select
        refund_id,
        original_transaction_id,
        reason,
        amount,
        updated_at,
        created_at,
        currency,
        status

    from source

)

select * from renamed