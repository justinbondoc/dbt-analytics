with 

source as (

    select * from {{ source('FULLSTORY_DEMO_DATA', 'users') }}

),

renamed as (

    select
        id as user_id,
        user_display_name,
        user_email
        
    from source

)

select * from renamed