with customers as (

    select
        customer_id,
        customer_type,
        kyc_status,
        address,
        risk_profile,
        phone_number,
        email
    from {{ ref('stg_customers') }}

)

select * from customers