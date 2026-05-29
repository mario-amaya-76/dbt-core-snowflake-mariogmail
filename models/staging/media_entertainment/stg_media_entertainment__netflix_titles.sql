with source as (

    select * from {{ source('media_entertainment', 'netflix_titles') }}
    where _fivetran_deleted is distinct from true

),

renamed as (

    select
        id                          as netflix_id,
        show_id,
        type                        as content_type,
        title,
        nullif(director, '')        as director,
        nullif(actors, '')          as cast_members,
        nullif(country, '')         as country,
        date_added,
        release_year,
        nullif(rating, '')          as rating,
        duration,
        listed_in                   as genres,
        description,
        'Netflix'                   as platform,
        _fivetran_synced

    from source

)

select * from renamed
