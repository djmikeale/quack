with source as (
    {#- read from seed #}
    select * from {{ ref('raw_skillzz') }}

),

clean as (
    select
        ordering,
        skill,
        skill_description,
        type,
        NULLIF(subtype, '') as subtype,
        NULLIF(abbreviation, '') as abbreviation,
        NULLIF(level_example, '') as level_example
    from source
)

select * from clean
