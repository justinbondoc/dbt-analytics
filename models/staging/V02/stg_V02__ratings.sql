with source as (

    select * from {{ source('v02', 'ratings') }}

),

renamed as (
    select
        unique_id as ratings_unique_id,
        establishment_id as establishment_id,
        source as ratings_source,
        is_current as is_ratings_current,
        score as ratings_score,
        review_count as ratings_review_count

    from source
)

select * from renamed