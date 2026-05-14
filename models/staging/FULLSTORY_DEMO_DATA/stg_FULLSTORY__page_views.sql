with 

source as (

    select * from {{ source('FULLSTORY_DEMO_DATA', 'page_views') }}

),

renamed as (

    select
        event_id,
        event_time,
        user_id,
        view_id,
        page_name

    from source

)

select * from renamed