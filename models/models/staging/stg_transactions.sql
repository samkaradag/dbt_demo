with source as (

    select * from {{ source('payments_v1', 'transactions') }}

),

renamed as (

    select
        transaction_id,
        reference,
        amount,
        payment_method_id,
        updated_at,
        debtor_customer_id,
        creditor_customer_id,
        created_at,
        currency,
        status

    from source

)

select * from renamed