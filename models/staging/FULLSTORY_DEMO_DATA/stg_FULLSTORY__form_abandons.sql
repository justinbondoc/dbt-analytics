with 

source as (

    select * from {{ source('FULLSTORY_DEMO_DATA', 'form_abandons') }}

),

renamed as (

    select
        event_id,
        event_time,
        user_id,
        view_id,
        target_raw_selector

    from source

)

select * from renamed