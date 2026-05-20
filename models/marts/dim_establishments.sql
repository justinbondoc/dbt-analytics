with

establishments as (

    select * from {{ ref('int_establishments__overview') }}

),

menu_stats as (

    select * from {{ ref('int_menu_items__aggregated') }}

),

final as (

    select
        establishments.establishment_id,
        establishments.establishment_name,
        establishments.establishment_city,
        establishments.establishment_state_code,
        establishments.status,
        menu_stats.item_count,
        menu_stats.avg_price,
        menu_stats.min_price,
        menu_stats.max_price

    from establishments
    left join menu_stats
        on establishments.establishment_id = menu_stats.establishment_id

)

select * from final