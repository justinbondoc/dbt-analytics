with delivery_platforms as (

    select
        establishment_id,
        technology_name as delivery_platform

    from {{ ref('stg_V02__technologies') }}

    where technology_category = 'Delivery'
),

establishments as (

    select
        establishment_id,
        establishment_country_code,
        establishment_score,
        establishment_review_count

    from {{ ref('stg_V02__establishments_open') }}

),

joined as (

    select
        dp.delivery_platform,
        e.establishment_country_code,
        e.establishment_id,
        e.establishment_score,
        e.establishment_review_count

    from delivery_platforms as dp
    inner join establishments as e
        on dp.establishment_id = e.establishment_id

),

final as (

    select
        delivery_platform,
        establishment_country_code,
        count(distinct establishment_id) as establishment_count,
        round(avg(establishment_score), 2) as avg_rating_score,
        sum(establishment_review_count) as total_review_count

    from joined

    where establishment_country_code is not null

    group by 1, 2

)

select * from final
order by delivery_platform, establishment_country_code
