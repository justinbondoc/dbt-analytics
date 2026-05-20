with

establishments_open as (

    select * from {{ ref('stg_V02__establishments_open') }}

),

establishments_closed as (

    select * from {{ ref('stg_V02__establishments_closed') }}

),

final as (

    select
        establishment_id,
        establishment_name,
        establishment_city,
        establishment_state_code,
        establishment_zip,
        establishment_country_code,
        establishment_score,
        establishment_metro_area,
        establishment_price_symbolic,
        status,
        null as closed_date
    from establishments_open

    union all

    select
        establishment_id,
        establishment_name,
        establishment_city,
        establishment_state_code,
        establishment_zip,
        establishment_country_code,
        null as establishment_score,
        null as establishment_metro_area,
        null as establishment_price_symbolic,
        status,
        closed_date
    from establishments_closed

)

select * from final
