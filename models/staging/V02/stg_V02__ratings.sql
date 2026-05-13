with source as (

    select * from {{ source('v02', 'ratings') }}

),

renamed as (
    select
        unique_id,
        establishment_id,
        source as ratings_source,
        is_current,
        score,
        review_count

    from source
)

select * from renamed