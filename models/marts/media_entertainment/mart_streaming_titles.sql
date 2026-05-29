{{ config(materialized='table') }}

with streaming_titles as (

    select * from {{ ref('int_streaming_titles__unioned') }}

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['platform', 'show_id']) }}
                                as streaming_title_id,
        platform,
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
        _fivetran_synced

    from streaming_titles

)

select * from final
