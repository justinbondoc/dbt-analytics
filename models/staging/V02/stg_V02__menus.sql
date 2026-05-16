with 

source as (

    select * from {{ source('V02', 'menus') }}

),

renamed as (

    select
        menu_id,
        establishment_id,
        is_current

    from source

)

select * from renamed