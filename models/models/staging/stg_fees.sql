with source as (

    select * from {{ source('payments_v1', 'fees') }}

),

renamed as (

    select
        fee_id,
        transaction_id,
        amount,
        created_at,
        currency,
        fee_type

    from source

)

select * from renamed