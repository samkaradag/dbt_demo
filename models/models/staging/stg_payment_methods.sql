with source as (

    select * from {{ source('payments_v1', 'payment_methods') }}

),

renamed as (

    select
        payment_method_id,
        method_type,
        is_default,
        updated_at,
        created_at,
        details,
        customer_id

    from source

)

select * from renamed