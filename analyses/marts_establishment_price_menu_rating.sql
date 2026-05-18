-- Simple roll-up: one row per price band ($, $$, $$$, $$$$).
-- How many places, average menu size, average rating.

with menu_items_by_place as (

    select
        establishment_id,
        count(distinct menu_item_id) as unique_menu_items

    from {{ ref('stg_V02__menu_items') }}

    group by establishment_id

),

places as (

    select
        establishment_id,
        trim(establishment_price_symbolic) as price_tier,
        establishment_score

    from {{ ref('stg_V02__establishments_open') }}

    where trim(establishment_price_symbolic) in ('$', '$$', '$$$', '$$$$')

),

joined as (

    select
        places.price_tier,
        places.establishment_score,
        coalesce(menu_items_by_place.unique_menu_items, 0) as unique_menu_items

    from places
    left join menu_items_by_place
        on places.establishment_id = menu_items_by_place.establishment_id

)

select
    price_tier,
    count(*) as establishment_count,
    round(avg(unique_menu_items), 0) as avg_unique_menu_items,
    round(avg(establishment_score), 1) as avg_rating_score

from joined

group by price_tier

order by length(price_tier)
