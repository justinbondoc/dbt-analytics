with source as (

    select * from {{ source('v02', 'technologies') }}

),

renamed as (

    select
        unique_id as technology_id,
        establishment_id,
        name as technology_name,
        category as technology_category,
        subcategory as technology_subcategory

    from source
    where is_current = true --Remove any masked data

)

select * from renamed