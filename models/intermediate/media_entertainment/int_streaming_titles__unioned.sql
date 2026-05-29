with disney as (

    select
        show_id,
        content_type,
        title,
        director,
        cast_members,
        country,
        date_added,
        release_year,
        rating,
        duration,
        genres,
        description,
        platform,
        _fivetran_synced
    from {{ ref('stg_media_entertainment__disney_plus_titles') }}

),

netflix as (

    select
        show_id,
        content_type,
        title,
        director,
        cast_members,
        country,
        date_added,
        release_year,
        rating,
        duration,
        genres,
        description,
        platform,
        _fivetran_synced
    from {{ ref('stg_media_entertainment__netflix_titles') }}

),

unioned as (

    select * from disney
    union all
    select * from netflix

)

select * from unioned
