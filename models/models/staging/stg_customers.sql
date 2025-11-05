with source as (

    select * from {{ source('payments_v1', 'customers') }}

),

renamed as (

    select
        customer_id,
        customer_type,
        kyc_status,
        address,
        updated_at,
        risk_profile,
        created_at,
        phone_number,
        email

    from source

)

select * from renamed