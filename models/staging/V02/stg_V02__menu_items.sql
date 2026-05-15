with 

source as (

    select * from {{ source('V02', 'menu_items') }}

),

renamed as (

    select
        menu_item_id,
        establishment_id,
        menu_id,
        name as menu_item_name,
        description,
        price,
        is_current

    from source

)

select * from renamed