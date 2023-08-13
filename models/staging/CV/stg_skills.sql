with
    source as (select * from 'models/raw/source_data/raw_skills.csv'),

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
