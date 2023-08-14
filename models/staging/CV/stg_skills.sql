with
    source as (select * from {{ source("raw", "skills.csv") }}),

    clean as (
        select
            ordering,
            skill,
            skill_description,
            type,
            nullif(subtype, '') as subtype,
            nullif(abbreviation, '') as abbreviation,
            nullif(level_example, '') as level_example
        from source
    )

select *
from clean
