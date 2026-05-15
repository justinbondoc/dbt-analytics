with

menus as (

    select * from {{ ref('stg_V02__menus') }}

),

menu_items as (

    select * from {{ ref('stg_V02__menu_items') }}

),

current_items as (

    select
        menu_items.menu_item_id,
        menu_items.establishment_id,
        menu_items.price

    from menu_items
    inner join menus
        on menu_items.menu_id = menus.menu_id

    where menu_items.is_current
      and menus.is_current

),

aggregated as (

    select
        establishment_id,
        count(menu_item_id) as item_count,
        round(avg(price), 2) as avg_price,
        min(price) as min_price,
        max(price) as max_price

    from current_items

    group by establishment_id

)

select * from aggregated