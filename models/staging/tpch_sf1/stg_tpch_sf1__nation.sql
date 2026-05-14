with 

source as (

    select * from {{ source('tpch_sf1', 'nation') }}

),

renamed as (

    select
        n_nationkey as nation_key,
        n_name as nation_name,
        n_regionkey as region_key,
        n_comment

    from source

)

select * from renamed