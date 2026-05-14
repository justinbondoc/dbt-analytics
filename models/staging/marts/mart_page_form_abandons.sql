with page_views as (

    select
        view_id,
        user_id,
        page_name

    from {{ ref('stg_FULLSTORY__page_views') }}

),

form_abandons as (

    select
        view_id,
        user_id,
        event_id as abandon_event_id

    from {{ ref('stg_FULLSTORY__form_abandons') }}

),

users as (

    select
        user_id,
        user_display_name,
        user_email

    from {{ ref('stg_FULLSTORY__users') }}

),

joined as (

    select
        page_views.page_name,
        page_views.view_id,
        page_views.user_id,
        form_abandons.abandon_event_id

    from page_views 
    left join form_abandons
        on page_views.view_id = form_abandons.view_id
    inner join users
        on page_views.user_id = users.user_id

),

final as (

    select
        page_name,
        count(distinct view_id) as total_page_views,
        count(distinct abandon_event_id) as total_form_abandons,
        count(distinct case when abandon_event_id is not null
                            then user_id end) as users_who_abandoned

    from joined

    group by 1

)

select * from final
order by total_form_abandons desc
