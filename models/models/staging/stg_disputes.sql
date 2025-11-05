with source as (

    select * from {{ source('payments_v1', 'disputes') }}

),

renamed as (

    select
        dispute_id,
        transaction_id,
        reason,
        amount,
        updated_at,
        created_at,
        currency,
        status

    from source

)

select * from renamed