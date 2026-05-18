with source as (

    select * from {{ source('V02', 'establishments_open') }}
),

renamed as (
    select
        establishment_id,
        name as establishment_name,
        score as establishment_score,
        location_city as establishment_city,
        location_state_code as establishment_state_code,
        location_country_code as establishment_country_code,
        location_zip as establishment_zip,
        location_metro_area as establishment_metro_area,
        price_symbolic as establishment_price_symbolic,
        status
    from source
)

select * from renamed