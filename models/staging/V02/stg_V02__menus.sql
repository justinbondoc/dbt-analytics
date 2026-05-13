with source as (

    select * from {{ source('v02', 'menus') }}

),

renamed as (

    select
        menu_id,
        establishment_id,
        source,
        menu_item_price_median,
        menu_item_price_20th_percentile,
        menu_item_price_80th_percentile,
        is_current

    from source

)

select * from renamed 