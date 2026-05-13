with source as (

    select * from {{ source('v02', 'establishments_open') }}
),

renamed as (
    select
        establishment_id,
        name as establishment_name,
        location_city,
        location_state_code,
        location_country_code,
        location_metro_area,
        chain_name,
        business_types,
        cuisines_regional,
        price_symbolic as price_rating
    from source
)

select * from renamed