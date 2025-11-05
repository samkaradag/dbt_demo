with payment_methods as (

    select
        payment_method_id,
        method_type,
        is_default,
        details,
        customer_id
    from {{ ref('stg_payment_methods') }}

)

select * from payment_methods