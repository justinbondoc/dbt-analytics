with 

source as (

    select * from {{ source('V02', 'establishments_closed') }}

),

renamed as (

    select
        establishment_id,
        name as establishment_name,
        location_city as establishment_city,
        location_state_code as establishment_state_code,
        location_zip as establishment_zip,
        location_country_code as establishment_country_code,
        status,
        closed_date
    

    from source

)

select * from renamed