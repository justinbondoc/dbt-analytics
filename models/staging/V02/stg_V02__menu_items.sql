with 

source as (

    select * from {{ source('v02', 'menu_items') }}

),

renamed as (

    select
        menu_item_id,
        establishment_id,
        menu_id,
        name as menu_item_name,

    from source
    where is_current = 'true' --Removes any duplicate items
)

select * from renamed