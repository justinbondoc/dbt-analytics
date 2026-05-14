with 

source as (

    select * from {{ source('tpch_sf1', 'customer') }}

),

renamed as (

    select
        c_custkey as customer_ID,
        c_name as customer_number,
        c_address,
        c_nationkey as nation_key,
        c_phone as customer_phone,
        c_mktsegment as customer_market_segment,
        c_comment

    from source

)

select * from renamed